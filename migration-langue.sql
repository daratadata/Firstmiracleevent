-- À exécuter UNE fois dans Supabase > SQL Editor si votre base existe déjà
alter table items add column if not exists name_en text;
alter table items add column if not exists description_en text;
