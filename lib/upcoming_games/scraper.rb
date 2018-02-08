class UpcomingGames::Scraper
   BASE_URL = 'http://www.ign.com/upcoming/games'.freeze
   DETAILS_URL = 'http://www.ign.com/games/'

   def get_games_list
      Nokogiri::HTML(open(BASE_URL)).css('.itemList .itemList-item')
   end

   def get_game_details(url)
      Nokogiri::HTML(open(DETAILS_URL + url))
   end

   def game_list_scraper
      get_games_list.each do |_upcoming_game|
         game = UpcomingGames::Game.new
         game.title = upcoming_game.css('div .item-title a').text.strip
         game.release_date = upcoming_game.css('.releaseDate').text.strip
         game.genre = upcoming_game.css('.item-genre').text.strip
         game.url = game.css('div .item-title a').attribute('href').value
      end
   end

   def game_details_scraper(game)
      game.platform = get_game_details(game.url).css('.object-metadata span:last-child').text
      game.publisher = get_game_details(game.url).css('.object-metadata span:first-child').text
      game.rating = get_game_details(game.url).css('.hexagon-content').text
      game.summary = get_game_details(game.url).css('.description p').first.text
   end
end
