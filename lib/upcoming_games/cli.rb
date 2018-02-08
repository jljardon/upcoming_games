class UpcomingGames::CLI
   def call
      puts "Welcome to upcoming_games gem!\n".red
      list_upcoming_games
      selected_game
   end

   def list_upcoming_games
      puts 'Here is a list of upcoming Video Games:'.blue
      puts 'Title: Monster Hunter World'
      puts 'Platform: PC'
      puts 'Release Date: Q3 2018'
      puts 'Genre: Action'
      puts '*******************************'.red
      puts 'Title: Far Cry 3 (Classic Edition)'
      puts 'Platform: PlayStation 4'
      puts 'Release Date: TBA 2018'
      puts 'Genre: Shooter'
      puts '*******************************'.red
   end

   def selected_game
      puts 'Here are more details of the selected movie:'.blue
      puts 'Release Date: Q3 2018'
      puts 'Rating: T for Teen: Blood, Mild Language, Use of Alcohol, Violence, Online Interactions Not Rated by the ESRB'
      puts 'Genre: Action'
      puts 'Publisher: Capcom'
      puts 'Developer: Capcom'
      puts 'Summary": Monster Hunter: World introduces a living, breathing ecosystem in which players take on the role of a hunter that seeks and slays ferocious beasts in heart-pounding battles that unfold across the vast ever-changing terrain. Retaining the series’ skill based progression and robust crafting system, players gear up to venture on quests to seek and slay monsters, progressively improving their skills to become the ultimate hunter. Loot collected from fallen foes can be used to create new equipment and armor upgrades styled after the monsters they’ve slain, allowing hunters to survive the elements and defeat the tougher opponents that await them.

      Monster Hunter: World delivers a seamless gameplay experience allowing players to move freely across map areas that comprise the living ecosystems and dynamically transition from day to night. The landscape and its diverse inhabitants play a critical role in each quest as players strategically use the surrounding environment including terrain, vegetation and wildlife to their advantage in battle or become hindered by the hazards they present. Hunters must use their cunning and abilities to track and maneuver their targets throughout the intense, evolving battles.'


   end
end
