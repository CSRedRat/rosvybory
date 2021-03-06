source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'twitter-bootstrap-rails'
gem 'formtastic', '2.3.0.rc2'
gem 'formtastic-bootstrap'#, github: 'mjbellantoni/formtastic-bootstrap'
gem 'x-editable-rails'
gem 'select2-rails'
gem 'handlebars_assets'

group :production do
  gem 'dalli'
  gem 'rvm'
end

# Use postgresql as the database for Active Record
gem 'pg'
gem 'activerecord-postgres-hstore'

gem "resque"#, "~> 2.0.0.pre.1", github: "resque/resque"
gem 'resque_mailer'
gem 'redis'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem "less-rails"
gem 'haml-rails'
gem 'slim'

gem 'honeybadger'
gem 'therubyracer', platforms: :ruby
gem 'unicorn'
gem 'foreman', require: false
gem 'foreman-export-initscript', require: false

gem 'awesome_nested_set'
gem 'cancan'
gem 'draper'
gem 'enumerize'
gem 'state_machine'
gem 'jbuilder'

gem 'activeadmin',         github: 'gregbell/active_admin'
# gem 'activeadmin-axlsx'   # breaks app for no good reason
gem 'rubyzip', '~> 0.9.5'
gem 'axlsx'
gem 'ransack', "~> 1.0.0"
gem 'inherited_resources', "~> 1.4.1"
gem 'sms_ru', github: 'stiff/sms_ru'
gem "recaptcha", :require => "recaptcha/rails"
gem 'gon'
gem 'cocoon'

gem 'roo' #import from excel
gem 'google_drive'

# Генерация PDF
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

# Мониторинг и паниконагнетатель
gem 'newrelic_rpm'

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rvm-capistrano'
  gem 'launchy'
  gem 'letter_opener'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'guard'
  gem 'guard-rspec'
  gem 'growl'
  gem 'ffaker'
end
