require 'jekyll'
require_relative '../lib/jekyll_reading_time'

RSpec.configure do |config|
  config.filter_run_when_matching focus: true
  config.order = 'random'
end
