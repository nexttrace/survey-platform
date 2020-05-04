# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

# Prevent duplicate `yarn install` on assets:precompile
Rake::Task["webpacker:yarn_install"].clear
namespace(:webpacker) { task(:yarn_install) { puts "skipping webpacker:yarn_install" } }
Rake::Task["yarn:install"].clear
namespace(:yarn) { task(:install) { puts "skipping yarn:install" } }
