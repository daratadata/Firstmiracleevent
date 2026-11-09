-- À exécuter UNE fois dans Supabase > SQL Editor (ne touche pas à vos autres réglages)
create table if not exists proformas(id uuid primary key default gen_random_uuid(),created_at timestamptz default now(),number text unique not null,client_name text,total numeric default 0,status text default 'brouillon',data jsonb not null);
alter table proformas enable row level security;
drop policy if exists "proforma admin" on proformas;
create policy "proforma admin" on proformas for all to authenticated using(is_admin()) with check(is_admin());
