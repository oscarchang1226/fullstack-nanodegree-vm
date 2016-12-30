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
    mRound  INTEGER NOT NULL
);

CREATE TABLE results (
    matchId INTEGER NOT NULL REFERENCES matches,
    winner  INTEGER NOT NULL REFERENCES players,
    loser   INTEGER NOT NULL REFERENCES players
);

CREATE VIEW standings AS (
    SELECT
        players.id, players.name, r.wins, m.plays
    FROM
        players, (
            SELECT
        )
);
