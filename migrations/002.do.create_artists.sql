DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER
        REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    "name" TEXT NOT NULL,
    bio TEXT NOT NULL,
    tags TEXT,
    soundcloud_embed TEXT,
    date_created TIMESTAMPTZ DEFAULT now() NOT NULL
);
