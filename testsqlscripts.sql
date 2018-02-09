INSERT INTO players (firstname, lastname, nickname, number, created_at, updated_at, secretkey)
VALUES ('Andrew', 'Leung', 'Obi Non', 17, current_timestamp, current_timestamp, 'testing');

INSERT INTO players (firstname, lastname, nickname, number, created_at, updated_at, secretkey)
VALUES ('Max', 'Fang', 'Burnt Toast', 5, current_timestamp, current_timestamp, 'crikey');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode)
VALUES (3, 1, 0 , 0 ,0,1,1, 0 , 1, current_timestamp, current_timestamp, 2, 'EKKLESIA');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode)
VALUES (3, 0, 1 , 2 ,0,0,0, 0 , 0, current_timestamp, current_timestamp, 2, 'PILLARS');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode)
VALUES (4, 0, 1 , 1 ,2,0,0, 0 , 1, current_timestamp, current_timestamp, 2, 'TOFU');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode)
VALUES (3, 1, 0 , 0 ,0,1,1, 0 , 1, current_timestamp, current_timestamp, 1, 'EKKLESIA');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode)
VALUES (3, 0, 1 , 2 ,0,0,0, 0 , 0, current_timestamp, current_timestamp, 1, 'PILLARS');

INSERT INTO games (atbat, single, double, triple, homerun, lineout, groundout, fc, sacfly, created_at, updated_at, player_id, gamecode, error)
VALUES (3, 0, 1 , 2 ,0,0,0, 1 , 0, current_timestamp, current_timestamp, 1, 'TOFU', 1);