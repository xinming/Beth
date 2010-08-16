# include at least one source and the rails gem
source :gemcutter
gem "rails", "= 2.3.5", :require => nil
gem "sqlite3-ruby", :require => "sqlite3"

# Devise 1.0.2 is not a valid gem plugin for Rails, so use git until 1.0.3
# gem "devise", :git => "git://github.com/plataformatec/devise.git", :ref => "v1.0"

gem 'haml'
gem 'formtastic'
gem 'validation_reflection'
gem 'clearance'
gem 'hpricot'
gem 'dry_scaffold'
gem 'inherited_resources', '= 1.0.6'
gem 'will_paginate'
gem 'jrails'

group :test do
  # bundler requires these gems while running tests
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'webrat'
  gem 'database_cleaner'
  gem 'factory_girl'
end
