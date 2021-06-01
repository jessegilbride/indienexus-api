CREATE TABLE users (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_name TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  password TEXT NOT NULL,
  -- is_artist BOOLEAN NOT NULL,
  date_created TIMESTAMP DEFAULT now() NOT NULL,
  date_modified TIMESTAMP
);

ALTER TABLE artists
  ADD COLUMN
    user_id INTEGER REFERENCES users(id)
--     is_artist BOOLEAN REFERENCES users(is_artist)
    ON DELETE SET NULL;