#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless #$LOAD_PATH.include?(lib)
require  './lib/stranger_things_directory/version'

Gem::Specification.new do |spec|
  spec.name          = "stranger_things_directory"
  spec.version       = StrangerThingsDirectory::VERSION
  spec.authors       = ["Alethia Quintero"]
  spec.email         = ["alethiaq22@gmail.com"]

  spec.summary       = "A Stranger Things Character and Location information guide"
  spec.description   = "A user will choose between a list of trending Stranger Things characters or locations, the list will be shown, the user will choose a number representing an item, then information about that item will appear"
  spec.homepage      = 'https://rubygems.org/gems/stranger_things_directory'
  spec.license       = "MIT"

  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ["lib/stranger_things_directory.rb","lib/stranger_things_directory/cli.rb", "lib/stranger_things_directory/location_scraper.rb", "lib/stranger_things_directory/locations.rb", "lib/stranger_things_directory/character_scraper.rb", "lib/stranger_things_directory/characters.rb",  "config/environment.rb"]
  
  #spec.bindir        = "exe"
  spec.executables  << 'stranger_things_directory'
  #spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", ">=0"
  spec.add_development_dependency "nokogiri", ">=0"
end
