namespace :dev do

  # Reset Database Task
  desc "Setup the development environment"
  task setup: :environment do
    if Rails.env.development?

      show_spinner("Drop Database") { %x(rails db:drop:_unsafe) }
      show_spinner("Create Database") { %x(rails db:create) }
      show_spinner("Migrate Database") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      
    
    else
      puts "You don't be in development environment"
    end
  end

  # SEED COINS
  desc "Seed Coins"
  task add_coins: :environment do
    show_spinner("Registering Coins") do
      coin = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",    
            mining_type: MiningType.find_by(acronym: 'PoW')
          },
          {
            description: "Ethereum",
            acronym: "ETC",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
            mining_type: MiningType.all.sample
          },
          {
              description: "Dash Coin",
              acronym: "DASH",
              url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
              mining_type: MiningType.all.sample
          }
        ]

      coin.each do |coin| 
          Coin.find_or_create_by!(coin)
      end
    end
  end

  # SEED MINERING TYPE
  desc "Seed Mining Types"
  task add_mining_types: :environment do
    show_spinner("Registering Mining Types") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |type|
        MiningType.find_or_create_by!(type)
      end
    end
  end


  # PRIVATE 
  private

  def show_spinner(msg_start, msg_end = "sucessful")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
