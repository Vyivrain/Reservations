source 'https://rubygems.org'

ruby File.read('.ruby-version').strip
gem 'rails', '5.0.0.1'

gem 'pg'
gem 'puma'
gem 'sass-rails'

gem 'uglifier'
gem 'coffee-rails'

gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'figaro'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder'

gem 'sdoc', group: :doc
gem 'jquery-turbolinks'

gem 'rails_12factor', group: :production

group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development, :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

