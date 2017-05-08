source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']

gem 'jekyll-paginate'
gem 'jekyll-admin', group: :jekyll_plugins
gem 'html-proofer'

gem 'scss_lint', require: false
