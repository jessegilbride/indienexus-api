-- psql -U postgres -d indienexus -f ./seeds/seed.tables.sql

BEGIN;

TRUNCATE
  artists,
  users
  RESTART IDENTITY CASCADE;

INSERT INTO users (full_name, user_name, password)
VALUES
  ('Olivia Frederick', 'oliviafrederick', '$2a$12$8f8AREiVHqUkKbBzeJZF7uSmRSS8Zjbenxs3Kchxdo3JS54ZbZnV.'), -- SAm7WzE9
  ('Emma Blaugh', 'emmablaugh', '$2a$12$eWF4olFzUKFbo0K5sVnKdOUoNeQEh1HbeGCaiUadpzo9e1fDmcHTK'), -- oZLRkxW7
  ('Isabella Smith', 'isasmith', '$2a$12$f2FwDz9pZsTcR4B5YXYhCuXHAWOsTt8jhJ1UUQZPkuGcRYclaknSy'), -- 7EDHZtgg
  ('Noah Taylor', 'noahtaylor', '$2a$12$V5Q4UH4kZOee2nFlV/212Oyfo3COaWk0uGoXR4riZXob58P7ZAjBS'), -- x7FgNKRt
  ('James Whitlock', 'jwhitlock', '$2a$12$v2W3MQWPe0zCy1I12ScCnOCjYFo2R7En.feLcyvCU38NyjEuK/P9e'); -- swSf5Hti

INSERT INTO artists ("name", bio, tags, soundcloud_embed, date_created)
VALUES
  ('Artist 0',
    'Sed posuere consectetur est at lobortis.',
    'indie, rock, rap, spoken, folk',
    '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
    '2021-03-21 00:00:00'),
  ('Artist 1',
    'Sed posuere consectetur est at lobortis.',
    'indie, rock, rap, spoken, folk',
    '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
    '2021-03-22 00:00:00'),
  ('Artist 2',
    'Sed posuere consectetur est at lobortis.',
    'indie, rock, rap, spoken, folk',
    '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
    '2021-03-23 00:00:00'),
  ('Artist 3',
    'Sed posuere consectetur est at lobortis.',
    'indie, rock, rap, spoken, folk',
    '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
    '2021-03-23 00:00:00'),
  ('Artist 4',
    'Sed posuere consectetur est at lobortis.',
    'indie, rock, rap, spoken, folk',
    '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
    '2021-03-23 00:00:00'),
  -- ('Artist 5',
  --   'Sed posuere consectetur est at lobortis.',
  --   'indie, rock, rap, spoken, folk',
  --   '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
  --   '2021-03-23 00:00:00'),
  -- ('Artist 6',
  --   'Sed posuere consectetur est at lobortis.',
  --   'indie, rock, rap, spoken, folk',
  --   '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
  --   '2021-03-23 00:00:00'),
  -- ('Artist 7',
  --   'Sed posuere consectetur est at lobortis.',
  --   'indie, rock, rap, spoken, folk',
  --   '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
  --   '2021-03-23 00:00:00'),
  -- ('Artist 8',
  --   'Sed posuere consectetur est at lobortis.',
  --   'indie, rock, rap, spoken, folk',
  --   '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
  --   '2021-03-23 00:00:00'),
  -- ('Artist 9',
  --   'Sed posuere consectetur est at lobortis.',
  --   'indie, rock, rap, spoken, folk',
  --   '<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1005504319&color=%23d0c0a0&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/soundcloud-scenes" title="Scenes: Indie" target="_blank" style="color: #cccccc; text-decoration: none;">Scenes: Indie</a> · <a href="https://soundcloud.com/soundcloud-scenes/sets/coffee-shop-mellow-indie-chill" title="Mellow Indie Chill: Coffee Shop" target="_blank" style="color: #cccccc; text-decoration: none;">Mellow Indie Chill: Coffee Shop</a></div>',
  --   '2021-03-23 00:00:00')

COMMIT;
