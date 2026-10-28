-- Execute no SQL Editor do seu projeto Supabase.
-- Cada usuário só pode ler e gravar seu próprio dashboard.
create table if not exists public.dashboards (
  user_id uuid primary key references auth.users(id) on delete cascade,
  content jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.dashboards enable row level security;
create policy "read_own_dashboard" on public.dashboards for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert_own_dashboard" on public.dashboards for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update_own_dashboard" on public.dashboards for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
