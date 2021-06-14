const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

function makeUsersArray() {
  return [
    {
      id: 1,
      full_name:  'Olivia Frederick',
      user_name: 'oliviafrederick',
      password: 'password',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    },
    {
      id: 2,
      full_name:  'Emma Blaugh',
      user_name: 'emmablaugh',
      password: 'password',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    },
    {
      id: 3,
      full_name:  'Isabella Smith',
      user_name: 'isasmith',
      password: 'password',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    }
  ]
}

function makeArtistsArray(users) {
  return [
    {
      id: 1,
      user_id:1,
      name: 'First test artist',
      bio: 'Vestibulum id ligula porta felis euismod semper.',
      tags: 'tag1, tag2',
      soundcloud_embed: '<div>soundcloud</div>',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    },
    {
      id: 2,
      user_id:2,
      name: 'Second test artist',
      bio: 'Vestibulum id ligula porta felis euismod semper.',
      tags: 'tag1, tag2',
      soundcloud_embed: '<div>soundcloud</div>',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    },
    {
      id: 3,
      user_id:3,
      name: 'Third test artist',
      bio: 'Vestibulum id ligula porta felis euismod semper.',
      tags: 'tag1, tag2',
      soundcloud_embed: '<div>soundcloud</div>',
      date_created: new Date('2029-01-22T16:28:32.615Z')
    }
  ]
}

function makeUsersFixtures() {
  const testUsers = makeUsersArray()
  return { testUsers }
}

function makeArtistsFixtures() {
  const testUsers = makeUsersArray()
  const testArtists = makeArtistsArray(testUsers)
  return { testUsers, testArtists }
}

function cleanTables(db) {
  return db.transaction(trx =>
    trx.raw(
      `TRUNCATE
        artists,
        users
      `
    )
    .then(() =>
      Promise.all([
        trx.raw(`ALTER SEQUENCE artists_id_seq minvalue 0 START WITH 1`),
        trx.raw(`ALTER SEQUENCE users_id_seq minvalue 0 START WITH 1`),
        trx.raw(`SELECT setval('artists_id_seq', 0)`),
        trx.raw(`SELECT setval('users_id_seq', 0)`),
      ])
    )
  )
}

function seedUsers(db, users) {
  const preppedUsers = users.map(user => ({
    ...user,
    password: bcrypt.hashSync(user.password, 1)
  }))
  return db.into('users').insert(preppedUsers)
    .then(() =>
      // update the auto sequence to stay in sync
      db.raw(
        `SELECT setval('users_id_seq', ?)`,
        [users[users.length - 1].id],
      )
    )
}

function seedArtistsTables(db, users, artists) {
  // use a transaction to group the queries and auto rollback on any failure
  return db.transaction(async trx => {
    await seedUsers(trx, users)
    await trx.into('artists').insert(artists)
    // update the auto sequence to match the forced id values
    await trx.raw(
      `SELECT setval('artists_id_seq', ?)`,
      [artists[artists.length - 1].id],
    )
  })
}

function makeAuthHeader(user, secret = process.env.JWT_SECRET) {
  const token = jwt.sign({ user_id: user.id }, secret, {
    subject: user.user_name,
    algorithm: 'HS256',
  })
  return `Bearer ${token}`
}

module.exports = {
  makeUsersArray,
  makeArtistsArray,
  cleanTables,
  makeUsersFixtures,
  makeArtistsFixtures,
  seedArtistsTables,
  makeAuthHeader,
  seedUsers,
}
