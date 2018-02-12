
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "upcoming_games/version"

Gem::Specification.new do |spec|
  spec.name          = "upcoming_games"
  spec.version       = UpcomingGames::VERSION
  spec.authors       = ["Jose Luis Jardon"]
  spec.email         = ["jljardon.c@gmail.com"]

  spec.summary       = %q{This Gem allows you to look at the upcoming video games by name and see specific details of that game.}
  spec.homepage      = "https://github.com/jljardon/upcoming_games"
  spec.license       = "MIT"
  spec.executables   = ["upcoming_games"]
  spec.require_paths = ["lib", "lib/upcoming_games"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", '~> 0'
  spec.add_development_dependency "pry", '~> 0'
  spec.add_development_dependency "colorize", '~> 0'
end
