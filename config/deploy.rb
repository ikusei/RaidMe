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
 role :web, "multimediaart.at"                   # Your HTTP server, Apache/etc
 role :app, "multimediaart.at"                   # This may be the same as your `Web` server
 role :db,  "multimediaart.at", :primary => true # This is where Rails migrations will run
 # role :db,  "your slave db-server here

 namespace :deploy do

desc "Remove mingw32 extensions from Gemfile.lock to re-bundle under LINUX"
task :rm_mingw32, :except => { :no_release => true }, :role => :app do
puts " modifying Gemfile.lock ... removing mingw32 platform ext. before re-bundling on LINUX"
run "sed 's/-x86-mingw32//' #{release_path}/Gemfile.lock > #{release_path}/Gemfile.tmp && mv #{release_path}/Gemfile.tmp #{release_path}/Gemfile.lock"
run "sed -n '/PLATFORMS/ a\ ruby' #{release_path}/Gemfile.lock"
end

end

before("bundle:install", "deploy:rm_mingw32")