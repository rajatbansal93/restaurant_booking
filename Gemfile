source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby                              '2.4.1'
gem 'rails',                      '~> 5.1.4'


gem 'coffee-rails',               '~> 4.2'
gem 'jbuilder',                   '~> 2.5'
gem 'puma',                       '~> 3.7'
gem 'pg',                         '~> 0.18'
gem 'sass-rails',                 '~> 5.0'
gem 'sendgrid-ruby'
gem 'turbolinks',                 '~> 5'
gem 'tzinfo-data',                           platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier',                   '>= 1.3.0'

group :development do
  gem 'letter_opener',            '~> 1.6'
  gem 'listen',                   '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',    '~> 2.0.0'
  gem 'web-console',              '>= 3.3.0'
end

group :development, :test do
  gem 'byebug',                             platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara',                 '~> 2.13'
  gem 'database_cleaner',         '>= 1.6.2'
  gem 'rspec-rails',              '>= 3.4.2'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers', '>= 1.1.4'
  gem 'shoulda-matchers',          '>= 3.1.2'
  gem 'factory_bot',              '>= 4.8.2'
end
