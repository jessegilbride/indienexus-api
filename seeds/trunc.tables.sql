-- psql -U postgres -d indienexus -f ./seeds/trunc.tables.sql

TRUNCATE
  artists,
  users
  RESTART IDENTITY CASCADE;
