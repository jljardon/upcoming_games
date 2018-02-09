class UpcomingGames::CLI
   def call
      start
   end

   def start
      puts '******************************************'.yellow.blink
      puts '****  Welcome to upcoming_games gem!  ****'.cyan
      puts "******************************************\n\n".yellow.blink

      list_upcoming_games
      input = ""
      until input.casecmp('exit').zero?
         puts "\nPlease input the name of the game you wish to see:\n"
         puts '(Or type exit to terminate the program.)'
         input = gets.strip
         break if input == 'exit'
         !UpcomingGames::Game.find_by_title(input).nil? ? selected_game(UpcomingGames::Game.find_by_title(input)) : (puts "\nGame not found!".white.on_red.blink)
      end
   end

   def list_upcoming_games
      puts "Here is a list of upcoming Video Games:\n"
      UpcomingGames::Scraper.game_list_scraper
      UpcomingGames::Game.all.each do |game|
         puts '******************************************'.light_blue
         puts 'Title: '.red + game.title
         puts 'Platform: '.red + game.platform
         puts 'Release date: '.red + game.release_date
         puts 'Genre: '.red + game.genre
      end
   end

   def selected_game(game)
      puts "\n\nHere are more details of the selected game:".blue
      UpcomingGames::Scraper.game_details_scraper(game)
      puts 'Title: '.red + game.title
      puts 'Release date: '.red + game.release_date
      puts 'Genre: '.red + game.genre
      puts 'Platform: '.red + game.platform
      puts 'Rating: '.red + game.rating
      puts 'Publisher: '.red + game.publisher
      puts 'Summary: '.red + game.summary + "\n"
   end
end
