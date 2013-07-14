source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.13'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'devise'
gem 'figaro'
gem 'haml-rails'
gem 'linkedin-scraper'
gem 'rails_admin'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'sqlite3'
end
group :development, :test do
  gem 'rspec-rails'
end
group :production do
  gem 'thin'
  gem 'pg'
end
group :test do
  gem 'database_cleaner'
  gem 'email_spec'
end
