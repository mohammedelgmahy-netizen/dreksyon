-- برنامج معرض الفردي: إعداد قاعدة بيانات Supabase
-- انسخ هذا الملف كله والصقه في Supabase ← SQL Editor ← New query، ثم اضغط Run.

create table if not exists public.fardi_records (
  col        text        not null,               -- نوع السجل: vehicles, customers, contracts, payments, expenses, checks, settings
  id         text        not null,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (col, id)
);

-- القراءة والكتابة لمن سجّل الدخول فقط
alter table public.fardi_records enable row level security;

drop policy if exists "signed-in users manage records" on public.fardi_records;
create policy "signed-in users manage records" on public.fardi_records
  for all to authenticated using (true) with check (true);

-- تحديث الشاشة فورًا لو فتحت البرنامج من أكثر من جهاز
do $$ begin
  alter publication supabase_realtime add table public.fardi_records;
exception when duplicate_object then null; end $$;
