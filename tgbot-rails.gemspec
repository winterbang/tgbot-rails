$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tgbot/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tgbot-rails"
  s.version     = Tgbot::Rails::VERSION
  s.authors     = ["winter"]
  s.email       = ["zwtao90@gmail.com"]
  s.homepage    = "https://winterbang.github.io/tgbot-rails"
  s.summary     = "telegram bot for rails"
  s.description = "telegram bot for rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  # s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency 'telegram-bot-ruby'
  s.add_dependency 'colorizer'
  # s.add_development_dependency "sqlite3"
end
