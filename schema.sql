-- À coller dans Supabase > SQL Editor > Run
create table items(id uuid primary key default gen_random_uuid(),kind text not null,name text not null,description text,price numeric default 0,unit text default 'unité',image_url text,stock int,active boolean default true,sort int default 0,created_at timestamptz default now());
create table gallery(id uuid primary key default gen_random_uuid(),title text,event_type text,image_url text not null,created_at timestamptz default now());
create table requests(id uuid primary key default gen_random_uuid(),created_at timestamptz default now(),name text,phone text,event_type text,event_date date,guests int,message text,items jsonb,total numeric,surprise boolean default false,inspiration_url text,source text,status text default 'nouveau');
alter table items enable row level security;alter table gallery enable row level security;alter table requests enable row level security;
create policy "items lecture" on items for select using(active or auth.role()='authenticated');
create policy "items admin" on items for all to authenticated using(true) with check(true);
create policy "galerie lecture" on gallery for select using(true);
create policy "galerie admin" on gallery for all to authenticated using(true) with check(true);
create policy "demande envoi" on requests for insert to anon,authenticated with check(true);
create policy "demande admin" on requests for all to authenticated using(true) with check(true);
insert into storage.buckets(id,name,public) values('media','media',true) on conflict do nothing;
create policy "media lecture" on storage.objects for select using(bucket_id='media');
create policy "media admin" on storage.objects for all to authenticated using(bucket_id='media') with check(bucket_id='media');
create policy "media inspiration" on storage.objects for insert to anon with check(bucket_id='media' and name like 'inspiration/%');
