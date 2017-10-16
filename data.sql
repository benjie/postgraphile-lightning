do $$
  declare
    v_user app.users;
  begin
    insert into app.users(first_name, last_name) values ('Phil', 'Dye') returning * into v_user;
    insert into app.messages(user_id, message) values (v_user.id, 'Prepping my demo for the @EtchUK Summer Summit, using @umbraco and Alexa… What could possibly go wrong? #LiveDemo'), (v_user.id, 'iCloud makes a new iPhone easy enough, but moving all TOTP/2FA accounts is a right PITA!');

    insert into app.users(first_name, last_name) values ('Adam', 'Burt') returning * into v_user;
    insert into app.messages(user_id, message) values (v_user.id, 'Thank you for the Ukeleses @HantsMusicHub! #BarcampSouthampton'), (v_user.id, 'Whaddup it''s your boy here, Young Bananas. (your rap name is "young" + the last thing you spent money on)');

    insert into app.users(first_name, last_name) values ('Dan', 'Thomas') returning * into v_user;
    insert into app.messages(user_id, message) values (v_user.id, 'In case you missed it, last week we launched @gameuipatterns and would love your feedback #gamedev #ui'), (v_user.id, 'Huge thanks to @hantsmusichub for providing the ukes and to Find (age 9) for the lesson! @BarcampSouth');

    insert into app.users(first_name, last_name) values ('Emma', 'Budd') returning * into v_user;
    insert into app.messages(user_id, message) values (v_user.id, 'Last full day in Bali is going to consist of packing, postcards, yoga and a massage. Yes.'), (v_user.id, 'I''ve only been here for 24hours, but I''ve decided that Ubud is my favourite place ever. Amazing food, even better yoga & it''s just beautiful');

    insert into app.users(first_name, last_name) values ('Tom', 'Frame') returning * into v_user;
    insert into app.messages(user_id, message) values (v_user.id, 'Today is a big day for the @EtchUK as we welcome @big_radical into the family. - Lets do amazing things! - A humbling experience for sure!'), (v_user.id, 'There is no team without trust!');

    insert into app.messages(user_id, message) values 
      (1, 'Barcamp Southampton is open NOW! Talks start at 10; come join us at Central Hall for a day of learning and laughter!'),
      (1, 'PostgreSQL 10 is finally out! (For me best bit is improved Row Level Security performance; and perf++ in general!)'),
      (1, 'I never used comments in PostgreSQL until @calebmer introduced me to them with PostGraphQL, now I use them frequently. So useful!'),
      (1, 'People from Southampton and surrounding areas: grab a ticket for this year''s Barcamp - great way to expand horizons!'),
      (1, 'Was £11.99; now £34.99 - bargain!  👀'),
      (1, 'Cool things coming in PG10: - Faster RLS - FullTextSearch on JSON - AFTER triggers get access to changed rows'),
      (1, 'Excellent talk on Blockchain/Hyperledger Composer by @CazChurchUk at @fullstackhants tonight - thanks!! 🙏');
  end;
$$ language plpgsql;
