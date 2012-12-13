set :deploy_to, "/var/www/gxw/apps/#{application}"

set :user, "www-data"
server "58.196.13.10", :app, :web, :db, :primary => true, :whenever => true

# set :asset_env, "RAILS_RELATIVE_URL_ROOT=/#{application}"
default_environment["http_proxy"] = default_environment["https_proxy"] = "http://58.196.13.38:8123"
