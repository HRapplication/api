# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically
# be available to Rake.

require File.expand_path('../config/application', __FILE__)
# require 'slim_lint/rake_task'
# require 'rubocop/rake_task'

# SlimLint::RakeTask.new do |t|
#   t.config = 'config/.slim-lint.yml'
# end

# task :test do
#   printf "\n------------------Slimlint------------------\n"
#   begin
#     Rake::Task['slim_lint'].execute
#     printf "\nAll .slim files are fine. Good job!\n"
#   rescue
#     printf "\nSlimlint finish with exceptions. Please fix it!\n"
#   end

#   printf "\n-----------------Coffeelint------------------\n"
#   system 'coffeelint.rb -r app/assets/javascripts'
#   system 'coffeelint.rb -r spec/javascripts'

#   printf "\n------------------Rubocop------------------\n"
#   system 'rubocop -R'

#   printf "\n------------------Rspec------------------\n"
#   system 'rspec'

#   printf "\n------------------Teaspoon------------------\n"
#   system 'teaspoon'
# end

Rails.application.load_tasks
