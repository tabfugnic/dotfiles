gem "i18n-tasks"
gem "tailwindcss-rails"
gem "view_component"

gem_group :development, :test do
  gem "factory_bot_rails"
  gem "rspec-rails"
end

gem_group :development do
  gem "standard", require: false
  gem "standard-rails", require: false
end

gem_group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
