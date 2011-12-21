$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rake_ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rake_ui"
  s.version     = RakeUi::VERSION
  s.authors     = ["Richard Brant"]
  s.email       = ["rbrant@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RakeUi."
  s.description = "TODO: Description of RakeUi."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
