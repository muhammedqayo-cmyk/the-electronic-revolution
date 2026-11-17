-- Run in your EXISTING Supabase project. Demo entries are separate from real registrations.
create table if not exists public.giveaway_demo_entries (
 id uuid primary key default gen_random_uuid(),
 created_at timestamptz not null default now(),
 full_name text not null check (char_length(full_name) between 1 and 100),
 email text not null check (char_length(email) between 3 and 254),
 country text not null check (char_length(country) between 1 and 80),
 vehicle_id text not null,
 vehicle_name text not null,
 package_usd integer not null check (package_usd in (500,1000,2500,5000)),
 payment_method text not null default 'not_enabled' check(payment_method='not_enabled'),
 payment_status text not null default 'not_enabled' check(payment_status='not_enabled'),
 entry_status text not null default 'demo_only' check(entry_status='demo_only')
);
alter table public.giveaway_demo_entries enable row level security;
revoke all on public.giveaway_demo_entries from anon, authenticated;
grant insert on public.giveaway_demo_entries to anon, authenticated;
grant select on public.giveaway_demo_entries to authenticated;
drop policy if exists "Public may submit demo interest" on public.giveaway_demo_entries;
create policy "Public may submit demo interest" on public.giveaway_demo_entries for insert to anon, authenticated with check (payment_method='not_enabled' and payment_status='not_enabled' and entry_status='demo_only');
drop policy if exists "Admins may view demo interest" on public.giveaway_demo_entries;
create policy "Admins may view demo interest" on public.giveaway_demo_entries for select to authenticated using (exists(select 1 from public.admins a where a.user_id=(select auth.uid())));
-- No public SELECT or UPDATE; never store gift card codes or Bitcoin private keys.
