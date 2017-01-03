-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

CREATE TABLE players (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255) NOT NULL
);

CREATE TABLE matches (
    id      SERIAL PRIMARY KEY,
    winner  INTEGER REFERENCES players(id),
    loser   INTEGER REFERENCES players(id)
);

CREATE VIEW standings AS
    SELECT players.id,
           players.name,
           COUNT(m1.id) AS wins,
           (COUNT(m1.id) + COUNT(m2.id)) AS matches
      FROM players
 LEFT JOIN matches AS m1
        ON players.id = m1.winner
 LEFT JOIN matches AS m2
        ON players.id = m2.loser
  GROUP BY players.id
  ORDER BY wins DESC;
