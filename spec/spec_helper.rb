require 'jekyll'
require_relative '../lib/jekyll_reading_time'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
