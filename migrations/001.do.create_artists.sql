CREATE TABLE artists (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    "name" TEXT NOT NULL,
    bio TEXT NOT NULL,
    soundcloud_embed TEXT,
    tag TEXT,
    date_created TIMESTAMPTZ DEFAULT now() NOT NULL
);
