-- À exécuter dans Supabase : SQL Editor > New query

create table if not exists public.messages (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  name text not null,
  email text not null,
  message text not null
);

-- Sécurité : on active la RLS (Row Level Security)
alter table public.messages enable row level security;

-- On autorise n'importe qui à ENVOYER un message (insert)...
create policy "Autoriser l'envoi de messages"
on public.messages
for insert
to anon
with check (true);

-- ...mais PAS à les lire (pas de policy "select" pour "anon" = personne
-- d'extérieur ne peut lire les messages des autres, seul toi via le
-- tableau de bord Supabase, connecté avec ton propre compte).
