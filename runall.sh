set -e
dropdb barcamp
createdb barcamp
echo 'create schema app;' | psql barcamp

echo "Now run 'postgraphile -c postgres://localhost/barcamp --schema app --watch' in another terminal [ENTER]"
read

open http://localhost:5000/graphiql

psql barcamp <<HERE
set search_path to app, public;
create table users (id serial primary key, first_name text not null, last_name text not null);
create table messages (id serial primary key, user_id int not null references users, message varchar(140) not null);
insert into users(first_name, last_name) values ('Benjie', 'Gillam');
insert into users(first_name, last_name) values ('Jem', 'Gillam');
insert into messages(user_id, message) values (1, 'I hope everyone''s enjoyed Barcamp so far!'), (2, 'The many uses of yarn... http://....');
HERE

echo "You can now query '{allUsers { nodes { firstName lastName messagesByUserId { nodes { message } } } } }' [ENTER]"
read
psql barcamp < data.sql
echo "[ENTER]"
read
psql barcamp < functions.sql
echo "[ENTER]"
read
psql barcamp < auth.sql
echo "[ENTER]"
read
echo "Now terminate the old postgraphile and instead run 'postgraphile -c postgres://barcamp:Southampton@localhost/barcamp --schema app --watch' [ENTER]"
read
psql barcamp < friends.sql
echo "[ENTER]"
read
