lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stranger_things_directory/version"

Gem::Specification.new do |spec|
  spec.name          = "stranger_things_directory"
  spec.version       = StrangerThingsDirectory::VERSION
  spec.authors       = ["Alethia Quintero"]
  spec.email         = ["alethiaq22@gmail.com"]

  spec.summary       = %q{A Stranger Things Character and Location information guide}
  spec.description   = %q{A user will choose between a list of trending Stranger Things characters or locations, the list will be shown, the user will choose a number representing an item, then information about that item will appear.}
  spec.homepage      = ""
  spec.license       = "MIT"

  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", ">=0"
  spec.add_development_dependency "nokogiri", ">=0"
end
