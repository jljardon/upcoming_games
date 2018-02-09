class UpcomingGames::Game
   @@all = []

   attr_accessor :title, :release_date, :url, :platform, :rating, :publisher, :summary

   attr_writer :genre

   def initialize
      save
   end

   def genre
      @genre.join(', ')
   end

   def save
      @@all.push(self)
   end

   def self.find_by_title(title)
      self.all.detect do |game|
         game.title.downcase == title.downcase.strip
      end
   end

   def self.all
      @@all
   end
end
