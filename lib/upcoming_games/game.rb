class UpcomingGames::Game
   @@all = []


   attr_accessor :title, :release_date, :genre, :url, :platform, :rating, :publisher, :summary

   def initialize
      save
   end

   def save
      @@all.push(self)
   end

end
