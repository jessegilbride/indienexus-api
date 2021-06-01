const xss = require('xss');

const ArtistsService = {
  getAllArtists(db) {
    return db.from('artists').select('*');
  },

  getById(db, id) {
    return ArtistsService.getAllArtists(db).where('artists.id', id).first();
  },

  insertArtist(db, newArtist) {
    return db
      .insert(newArtist)
      .into('artists')
      .returning('*')
      .then(([artist]) => artist)
      .then((artist) => ArtistsService.getById(db, artist.id));
  },

  deleteArtist(db, id) {
    return db('artists')
      .where({'id': id})
      .delete()
  },

  serializeArtist(artist) {
    return {
      id: artist.id,
      name: xss(artist.name),
      bio: xss(artist.bio),
      soundcloud_embed: xss(artist.soundcloud_embed),
      tag: xss(artist.tag),
      date_created: new Date(artist.date_created)
    };
  }
};

module.exports = ArtistsService;
