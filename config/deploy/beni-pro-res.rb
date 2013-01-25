set :deploy_to, "/var/www/gxw/apps/#{application}"

set :user, "www-data"
server "151.236.220.235", :app, :web, :db, :primary => true, :whenever => true

# set :asset_env, "RAILS_RELATIVE_URL_ROOT=/#{application}"