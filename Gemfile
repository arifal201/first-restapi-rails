source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.5', '>= 6.0.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

gem 'devise', '~> 4.7.3'

gem 'doorkeeper'

gem 'pg_search', '2.3.5'

gem 'kaminari', '~> 1.2.1'

# gem 'ransack', github: 'activerecord-hackery/ransack'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'validates_timeliness'

gem 'enumerize', '~> 2.1', '>= 2.1.2'

gem 'active_model_serializers', '~> 0.10.10'

gem 'carrierwave', '~> 1.0'

gem 'carrierwave-aws', '~> 1.4.0'

gem 'mini_magick', '~> 4.11.0'

gem 'fog-aws', '~> 3.8.0'

gem 'dotenv-rails', '~> 2.7.6'

gem 'ransack'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'capistrano', '~> 3.17'
  gem 'capistrano-bundler', '~> 1.6'
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano3-puma', '~> 4.0'
  
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
