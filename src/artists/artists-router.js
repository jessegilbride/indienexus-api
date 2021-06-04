const express = require('express');
const ArtistsService = require('./artists-service');
const { requireAuth } = require('../middleware/jwt-auth');

const artistsRouter = express.Router();
const jsonBodyParser = express.json();

artistsRouter
  .route('/')
  .get((req, res, next) => {
    ArtistsService.getAllArtists(req.app.get('db'))
      .then((artists) => {
        // console.log(artists)
        return res.json(artists.map(ArtistsService.serializeArtist));
      })
      .catch(next);
  })
  .post(requireAuth, jsonBodyParser, (req, res, next) => {
    // const { name, bio, tags, soundcloud_embed, date_created } = req.body;
    const { name, bio, tags, soundcloud_embed } = req.body;

    if (!name)
      return res.status(400).json({
        error: `Missing '${key}' in request body`
      });

    // const newArtist = { name, bio, tags, soundcloud_embed, date_created };
    const newArtist = { name, bio, tags, soundcloud_embed };

    ArtistsService.insertArtist(req.app.get('db'), newArtist)
      .then((artist) => {
        console.log(artist);
        res.status(201).json(ArtistsService.serializeArtist(artist));
      })
      .catch(next);
  });

artistsRouter
  .route('/:artist_id')
  // .all(requireAuth) // remove authentication for MVP ... to be reinstated on a different route (TBD)
  .all(checkArtistExists)
  .get((req, res) => {
    res.json(ArtistsService.serializeArtist(res.artist));
  })
  .delete((req, res, next) => {
    ArtistsService.deleteArtist(
      req.app.get('db'),
      req.params.id
    )
      .then(numRowsAffected => {
        res.status(204).end()
      })
      .catch(next)
  });

/* async/await syntax for promises */
async function checkArtistExists(req, res, next) {
  try {
    const artist = await ArtistsService.getById(req.app.get('db'), req.params.artist_id);

    if (!artist)
      return res.status(404).json({
        error: `Artist does not exist.`
      });

    res.artist = artist;
    next();
  } catch (error) {
    next(error);
  }
}

module.exports = artistsRouter;
