class UpcomingGames::CLI
   def call
      puts "Welcome to upcoming_games gem!\n".cyan
      list_upcoming_games
      selected_game
   end

   def list_upcoming_games
      puts 'Here is a list of upcoming Video Games:'
      scraper = UpcomingGames::Scraper.new
      scraper.game_list_scraper

      UpcomingGames::Game.all.each do |game|
         puts "*************************".light_blue
         puts "Title: ".red + game.title
         puts "Release date: ".red + game.release_date
         puts "Genre: ".red + game.genre
      end
   end

   def selected_game
      puts "\n\nHere are more details of the selected game:".blue
      game = UpcomingGames::Game.all.first
      scraper = UpcomingGames::Scraper.new
      scraper.game_details_scraper(game)
      puts "Title: ".red + game.title
      puts "Release date: ".red + game.release_date
      puts "Genre: ".red + game.genre
      puts "Platform: ".red + game.platform
      puts "Rating: ".red + game.rating
      puts "Publisher: ".red + game.publisher
      puts "Summary: ".red + game.summary
   end
end
