-- À exécuter UNE fois dans Supabase > SQL Editor (fidélité + avis clients). Ne touche pas à vos autres réglages.
create table if not exists loyalty_tx(id uuid primary key default gen_random_uuid(),user_id uuid not null references auth.users on delete cascade,points int not null,reason text,ref text,created_at timestamptz default now());
create unique index if not exists loyalty_ref on loyalty_tx(ref) where ref is not null;
alter table loyalty_tx enable row level security;
drop policy if exists "fid lecture" on loyalty_tx;drop policy if exists "fid admin" on loyalty_tx;
create policy "fid lecture" on loyalty_tx for select to authenticated using(user_id=auth.uid() or is_admin());
create policy "fid admin" on loyalty_tx for all to authenticated using(is_admin()) with check(is_admin());

create table if not exists reviews(id uuid primary key default gen_random_uuid(),user_id uuid references auth.users on delete set null,name text,rating int not null check(rating between 1 and 5),comment text,event_type text,status text default 'en attente',created_at timestamptz default now());
alter table reviews enable row level security;
drop policy if exists "avis lecture" on reviews;drop policy if exists "avis envoi" on reviews;drop policy if exists "avis admin" on reviews;
create policy "avis lecture" on reviews for select using(status='publié' or user_id=auth.uid() or is_admin());
create policy "avis envoi" on reviews for insert to authenticated with check(user_id=auth.uid() and status='en attente');
create policy "avis admin" on reviews for all to authenticated using(is_admin()) with check(is_admin());
