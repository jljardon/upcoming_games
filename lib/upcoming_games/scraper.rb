class UpcomingGames::Scraper
   BASE_URL = 'http://www.ign.com'

   def self.get_games_list
      Nokogiri::HTML(open(BASE_URL + "/upcoming/games")).css('.itemList .itemList-item')
   end

   def self.get_game_details(url)
      Nokogiri::HTML(open(BASE_URL + url))
   end

   def self.game_list_scraper
      get_games_list.each do |upcoming_game|
         game = UpcomingGames::Game.new
         game.title = upcoming_game.css('div .item-title a').text.strip
         game.platform = upcoming_game.css('.item-platform').text.strip
         game.release_date = upcoming_game.css('.releaseDate').text.strip
         game.genre = upcoming_game.css('.item-genre').text.strip.split(/\s*,\s*/)
         game.url = upcoming_game.css('div .item-title a').attribute('href').value
      end
   end

   def self.game_details_scraper(game)
      game.platform = get_game_details(game.url).css('.object-metadata span:last-child').text
      game.publisher = get_game_details(game.url).css('.object-metadata span:first-child').text
      game.rating = get_game_details(game.url).css('.hexagon-content').text
      game.summary = if get_game_details(game.url).css('.description p').first.nil?
                        get_game_details(game.url).css('.description').first.text.gsub(/\n/," ").gsub(/\r/,"")
                     else
                        get_game_details(game.url).css('.description p').first.text.gsub(/\n/," ").gsub(/\r/,"")
                     end
   end
end
