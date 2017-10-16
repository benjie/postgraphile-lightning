set search_path to app, public;

grant usage on schema app to barcamp;

alter table users enable row level security;
alter table messages enable row level security;
grant select on users to barcamp;
grant select on messages to barcamp;
drop policy if exists select_all on users;
create policy select_all on users for select using (true);
drop policy if exists select_own on messages;
create policy select_own on messages for select using (user_id = current_user_id());
