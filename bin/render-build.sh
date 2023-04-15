set -o errexit

bundle install
bundle exec rake assets:precompile 
bundle exec rake assets:clean
bundle exec rake db:create
bundle exec rake db:migrate