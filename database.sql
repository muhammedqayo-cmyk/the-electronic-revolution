-- Run in Supabase SQL Editor once. No secret keys should be used in browser code.
create table if not exists public.registrations (
 id uuid primary key default gen_random_uuid(),
 created_at timestamptz not null default now(),
 full_name text not null check (char_length(trim(full_name)) between 1 and 100),
 email text not null check (char_length(email) between 3 and 254 and position('@' in email)>1),
 country text not null check (char_length(trim(country)) between 1 and 80),
 interest text not null check (interest in ('Electric vehicles','EV technology','Events and updates','General interest')),
 consented boolean not null check (consented = true)
);
create table if not exists public.admins (
 user_id uuid primary key references auth.users(id) on delete cascade
);
alter table public.registrations enable row level security;
alter table public.admins enable row level security;
revoke all on public.registrations from anon, authenticated;
revoke all on public.admins from anon, authenticated;
grant usage on schema public to anon, authenticated;
grant insert on public.registrations to anon, authenticated;
grant select on public.registrations to authenticated;
grant select on public.admins to authenticated;
-- Anyone can submit a registration, but cannot read submitted entries.
drop policy if exists "Public can register" on public.registrations;
create policy "Public can register" on public.registrations for insert to anon, authenticated with check (consented = true);
-- Each signed-in user can only check whether they are an admin.
drop policy if exists "Admin membership self check" on public.admins;
create policy "Admin membership self check" on public.admins for select to authenticated using (user_id = (select auth.uid()));
-- Only members of admins can view registrations.
drop policy if exists "Admins can view registrations" on public.registrations;
create policy "Admins can view registrations" on public.registrations for select to authenticated using (exists (select 1 from public.admins where user_id = (select auth.uid())));
-- IMPORTANT: After creating your admin user in Supabase > Authentication > Users,
-- run the following separately, replacing the email with your REAL admin email:
-- insert into public.admins(user_id)
-- select id from auth.users where email = 'YOUR_ADMIN_EMAIL@example.com';
