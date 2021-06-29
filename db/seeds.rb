# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETC",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
)

Coin.create!(
    description: "Dash Coin",
    acronym: "DASH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
)