require "bundler/capistrano"
 set :application, "qpt"
 set :scm, :git
 set :repository,  "https://github.com/Babsi/RaidMe.git"
 set :deploy_to, "/var/www/virthosts/raidme.multimediaart.at"
 set :user, "deploy_raidme"
 set :branch, "master"
 default_run_options[:pty] = true
 set :use_sudo, false
 set :port, 5412
 set :bundle_flags, "--quiet"
 role :web, "multimediaart.at"                   # Your HTTP server, Apache/etc
 role :app, "multimediaart.at"                   # This may be the same as your `Web` server
 role :db,  "multimediaart.at", :primary => true # This is where Rails migrations will run
 # role :db,  "your slave db-server here
