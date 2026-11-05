-- ============================================================
-- À coller dans Supabase > SQL Editor > Run.
-- Peut être relancé sans risque (base neuve OU déjà existante).
-- ⚠️ AVANT DE LANCER : remplacez REMPLACEZ@VOTRE-EMAIL.COM (ligne is_admin)
--    par l'e-mail du compte administrateur créé dans Authentication > Users.
-- ============================================================
create table if not exists items(id uuid primary key default gen_random_uuid(),kind text not null,name text not null,description text,price numeric default 0,unit text default 'unité',image_url text,stock int,active boolean default true,sort int default 0,created_at timestamptz default now());
create table if not exists gallery(id uuid primary key default gen_random_uuid(),title text,event_type text,image_url text not null,created_at timestamptz default now());
create table if not exists requests(id uuid primary key default gen_random_uuid(),created_at timestamptz default now(),name text,phone text,event_type text,event_date date,guests int,message text,items jsonb,total numeric,surprise boolean default false,inspiration_url text,source text,status text default 'nouveau');
create table if not exists profiles(id uuid primary key references auth.users on delete cascade,name text,phone text,created_at timestamptz default now());
alter table items add column if not exists name_en text;
alter table items add column if not exists description_en text;
alter table requests add column if not exists user_id uuid default auth.uid() references auth.users on delete set null;

create or replace function is_admin() returns boolean language sql stable as
$$ select lower(coalesce(auth.jwt()->>'email',''))=lower('contactfirstmiracleevent@gmail.com') $$;

create or replace function handle_new_user() returns trigger language plpgsql security definer set search_path=public as
$$ begin insert into profiles(id,name,phone) values(new.id,new.raw_user_meta_data->>'name',new.raw_user_meta_data->>'phone') on conflict do nothing; return new; end $$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users for each row execute function handle_new_user();

alter table items enable row level security;alter table gallery enable row level security;alter table requests enable row level security;alter table profiles enable row level security;
drop policy if exists "items lecture" on items;drop policy if exists "items admin" on items;
drop policy if exists "galerie lecture" on gallery;drop policy if exists "galerie admin" on gallery;
drop policy if exists "demande envoi" on requests;drop policy if exists "demande admin" on requests;drop policy if exists "demande lecture" on requests;drop policy if exists "demande modif" on requests;drop policy if exists "demande suppr" on requests;
drop policy if exists "profil lecture" on profiles;drop policy if exists "profil modif" on profiles;drop policy if exists "profil suppr" on profiles;
create policy "items lecture" on items for select using(active or is_admin());
create policy "items admin" on items for all to authenticated using(is_admin()) with check(is_admin());
create policy "galerie lecture" on gallery for select using(true);
create policy "galerie admin" on gallery for all to authenticated using(is_admin()) with check(is_admin());
create policy "demande envoi" on requests for insert to anon,authenticated with check(user_id is null or user_id=auth.uid());
create policy "demande lecture" on requests for select to authenticated using(user_id=auth.uid() or is_admin());
create policy "demande modif" on requests for update to authenticated using(is_admin()) with check(is_admin());
create policy "demande suppr" on requests for delete to authenticated using(is_admin());
create policy "profil lecture" on profiles for select to authenticated using(id=auth.uid() or is_admin());
create policy "profil modif" on profiles for update to authenticated using(id=auth.uid() or is_admin()) with check(id=auth.uid() or is_admin());
create policy "profil suppr" on profiles for delete to authenticated using(is_admin());

insert into storage.buckets(id,name,public) values('media','media',true) on conflict do nothing;
drop policy if exists "media lecture" on storage.objects;drop policy if exists "media admin" on storage.objects;drop policy if exists "media inspiration" on storage.objects;
create policy "media lecture" on storage.objects for select using(bucket_id='media');
create policy "media admin" on storage.objects for all to authenticated using(bucket_id='media' and is_admin()) with check(bucket_id='media' and is_admin());
create policy "media inspiration" on storage.objects for insert to anon,authenticated with check(bucket_id='media' and name like 'inspiration/%');
