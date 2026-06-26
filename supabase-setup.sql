-- ============================================================
-- House of Ayaat — Supabase setup
-- Run this ONCE in your Supabase project's SQL Editor.
-- It creates the events table and locks editing to the admin email.
--
-- If you've already run the previous version, run the
-- "MIGRATION" block at the bottom instead.
-- ============================================================

-- 1. Events table (free-text categories, "featured" toggle for the banner)
create table if not exists public.events (
  id          uuid primary key default gen_random_uuid(),
  date        date not null,
  type        text not null default 'Workshop',
  title       text not null,
  venue       text default '',
  city        text default '',
  rsvp        text default '',
  blurb       text default '',
  featured    boolean not null default false,
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
);

-- Keep updated_at fresh on every change
create or replace function public.touch_events_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end$$;

drop trigger if exists trg_events_touch on public.events;
create trigger trg_events_touch
  before update on public.events
  for each row execute procedure public.touch_events_updated_at();

-- 2. Lock the table down with Row Level Security
alter table public.events enable row level security;

-- 3. Anyone (even unauthenticated visitors) can READ events.
--    This is what powers the public homepage.
drop policy if exists "events readable by anyone" on public.events;
create policy "events readable by anyone"
  on public.events for select
  using (true);

-- 4. Only the admin email can INSERT / UPDATE / DELETE events.
--    Change the email below if the admin ever changes.
drop policy if exists "events writable by admin only" on public.events;
create policy "events writable by admin only"
  on public.events for all
  using      (auth.jwt() ->> 'email' = 'hanaayat@gmail.com')
  with check (auth.jwt() ->> 'email' = 'hanaayat@gmail.com');

-- 5. Helpful indexes
create index if not exists events_date_idx     on public.events (date);
create index if not exists events_featured_idx on public.events (featured) where featured;

-- ============================================================
-- MIGRATION (only if you already ran the previous version)
-- ============================================================
-- Run this if you set up Supabase before "featured" + free-text
-- categories existed. It is safe to re-run.
--
-- alter table public.events drop constraint if exists events_type_check;
-- alter table public.events add column if not exists featured boolean not null default false;
-- create index if not exists events_featured_idx on public.events (featured) where featured;
