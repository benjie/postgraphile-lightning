set search_path to app, public;                                                                                                                                                                          drop table if exists friends cascade;

create table friends (
  user_id int not null references users,
  friend_id int not null references users,
  primary key(user_id, friend_id)
);

insert into friends (user_id, friend_id)
  values (1, 2);

alter table friends enable row level security;
grant select on friends to barcamp;

create policy select_own on friends
  for select using (user_id = current_user_id());

create policy select_friends on messages
  for select using (exists(
    select 1
      from friends
      where friends.user_id = current_user_id()
      and friend_id = messages.user_id
  ));
