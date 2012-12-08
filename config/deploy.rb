require "capsum/typical"

set :application, "restaurant"

set :shared, %w{
  config/database.yml
  config/settings.local.rb
}