const knex = require('knex')
const bcrypt = require('bcryptjs')
const app = require('../src/app')
const helpers = require('./test-helpers')

describe('Users Endpoints', function() {
  let db

  const { testUsers } = helpers.makeArtistsFixtures()
  // const testUser = testUsers[0]

  before('make knex instance', () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DATABASE_URL,
    })
    app.set('db', db)
  })

  after('disconnect from db', () => db.destroy())

  before('cleanup', () => helpers.cleanTables(db))

  afterEach('cleanup', () => helpers.cleanTables(db))

  describe(`POST /api/users`, () => {
    context(`User Validation`, () => {
      beforeEach('insert users', () =>
        helpers.seedUsers(
          db,
          testUsers,
        )
      )

      const requiredFields = ['user_name', 'password', 'full_name']

      requiredFields.forEach(field => {
        const registerAttemptBody = {
          user_name: 'test user_name',
          password: 'test password',
          full_name: 'test full_name',
        }

        it(`responds with 400 required error when '${field}' is missing`, () => {
          delete registerAttemptBody[field]

          return supertest(app)
            .post('/api/users')
            .send(registerAttemptBody)
            .expect(400, {
              error: `Missing '${field}' in request body`,
            })
        })
      })
  })

    context(`Happy path`, () => {
      it(`responds 201, serialized user, storing bcryped password`, () => {
        const newUser = {
          user_name: 'test user_name',
          password: '11AAaa!!',
          full_name: 'test full_name',
        }
        return supertest(app)
          .post('/api/users')
          .send(newUser)
          .expect(201)
          .expect(res => {
            expect(res.body).to.have.property('id')
            expect(res.body.user_name).to.eql(newUser.user_name)
            expect(res.body.full_name).to.eql(newUser.full_name)
            expect(res.body).to.not.have.property('password')
            expect(res.headers.location).to.eql(`/api/users/${res.body.id}`)
            /* const expectedDate = new Date().toLocaleString('en', { timeZone: 'UTC' })
            const actualDate = new Date(res.body.date_created).toLocaleString()
            expect(actualDate).to.eql(expectedDate) */
          })
          .expect(res =>
            db
              .from('users')
              .select('*')
              .where({ id: res.body.id })
              .first()
              .then(row => {
                expect(row.user_name).to.eql(newUser.user_name)
                expect(row.full_name).to.eql(newUser.full_name)
                /* const expectedDate = new Date().toLocaleString('en', { timeZone: 'UTC' })
                const actualDate = new Date(row.date_created).toLocaleString()
                expect(actualDate).to.eql(expectedDate) */

                return bcrypt.compare(newUser.password, row.password)
              })
              .then(compareMatch => {
                expect(compareMatch).to.be.true
              })
          )
      })
    })
  })
})
