# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username:'xiaotuotuo')
user2 = User.create(username:'datuotuo')
user3 = User.create(username:'zhongtuotuo')

artwork1 = Artwork.create(title:'haha', image_url: 'thomas-wang.com', artist_id: 1 )
artwork2 = Artwork.create(title:'haha', image_url: 'thomas-wang2.com', artist_id: 2 )
artwork3 = Artwork.create(title:'woc', image_url: 'thomas-wang3.com', artist_id: 2 )

share1 = ArtworkShare.create(artwork_id:1, viewer_id:1)
share2 = ArtworkShare.create(artwork_id:1, viewer_id:2)
share3 = ArtworkShare.create(artwork_id:2, viewer_id:3)
share4 = ArtworkShare.create(artwork_id:1, viewer_id:3)
share5 = ArtworkShare.create(artwork_id:3, viewer_id:3)
