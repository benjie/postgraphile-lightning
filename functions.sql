create or replace function app.current_user_id()
returns int as $$

  -- select current_setting('jwt.claims.user_id', true)::int;
  select 1; -- No time for JWTs today!

$$ language sql stable;

create or replace function app.current_user()
returns app.users as $$

  select *
    from app.users
    where id = app.current_user_id();

$$ language sql stable;

create or replace function app.users_name(u app.users)
returns text as $$

  select u.first_name || ' ' || u.last_name;

$$ language sql stable;
