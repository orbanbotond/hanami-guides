source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rake'
gem 'slim'
gem 'hanami', git: 'https://github.com/orbanbotond/hanami', branch: 'features/mailer-layouts'
# gem 'hanami', path: '/Users/orbanbotond/profession/ruby/hanami/hanami'
# gem 'hanami-mailer', require: false, path: "/Users/orbanbotond/profession/ruby/hanami/mailer"
gem 'hanami-mailer', require: false, git: "https://github.com/orbanbotond/trailblazer/mailer", branch: 'feature/add-mailer-layout'

gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'timerizer'
gem 'trailblazer'
gem 'reform'
gem 'dry-monads'
gem 'dry-matcher'
gem 'roadie', '~> 3.4'
gem 'trailblazer-endpoint', git: 'https://github.com/orbanbotond/trailblazer-endpoint'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'hanami-fabrication'
  gem 'ffaker'
  gem 'dotenv', '~> 2.4'
  gem 'pry-nav'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
