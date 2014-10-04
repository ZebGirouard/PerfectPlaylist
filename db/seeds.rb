# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Song.create(title: 'Turn Down for What', artist: 'DJ Snake', energy: 0.2, valence: 0.3, danceability: 0.4, rank: 1)
Song.create(title: 'Turn Down for Whom', artist: 'DJ Rabbit', energy: 0.3, valence: 0.4, danceability: 0.5, rank: 2)
Song.create(title: 'Turn Down for Which', artist: 'DJ Mongoose', energy: 0.4, valence: 0.5, danceability: 0.6, rank: 3)
Song.create(title: 'Turn Down for Where', artist: 'DJ Hippopotamus', energy: 0.5, valence: 0.6, danceability: 0.7, rank: 4)
Play.create(rank: 1)
Play.create(rank: 2)
Play.create(rank: 3)
Play.create(rank: 4)