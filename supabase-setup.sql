-- جدول بيانات المعرض (متعمل خلاص في مشروع Supabase بتاع خير بلدنا)
-- كل حساب بيشوف بياناته هو بس
create table if not exists public.fardi_records (
  owner      uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  col        text        not null,
  id         text        not null,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (owner, col, id)
);
alter table public.fardi_records enable row level security;
create policy "owner reads" on public.fardi_records for select to authenticated using (owner = (select auth.uid()));
create policy "owner inserts" on public.fardi_records for insert to authenticated with check (owner = (select auth.uid()));
create policy "owner updates" on public.fardi_records for update to authenticated using (owner = (select auth.uid())) with check (owner = (select auth.uid()));
create policy "owner deletes" on public.fardi_records for delete to authenticated using (owner = (select auth.uid()));
alter table public.fardi_records replica identity full;
do $$ begin alter publication supabase_realtime add table public.fardi_records; exception when duplicate_object then null; end $$;
