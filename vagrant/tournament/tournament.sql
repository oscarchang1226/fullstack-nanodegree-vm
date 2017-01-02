-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE players (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255) NOT NULL
);

CREATE TABLE matches (
    id      SERIAL PRIMARY KEY,
    player1 INTEGER NOT NULL REFERENCES players,
    player2 INTEGER NOT NULL REFERENCES players,
    winner  INTEGER REFERENCES players,
    loser   INTEGER REFERENCES players
);

CREATE VIEW standings AS
    SELECT players.id,
           players.name,
           COUNT(m3.id) AS wins,
           (COUNT(m1.id) + COUNT(m2.id)) AS matches
      FROM players
 LEFT JOIN matches AS m1
        ON players.id = m1.player1
 LEFT JOIN matches AS m2
        ON players.id = m2.player2
 LEFT JOIN matches AS m3
        ON players.id = m3.winner
  GROUP BY players.id
  ORDER BY wins DESC;
