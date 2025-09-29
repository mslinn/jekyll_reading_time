require 'jekyll'
require_relative '../lib/jekyll_reading_time'

RSpec.describe(Jekyll) do
  include described_class

  let(:config) { instance_double(Configuration) }
  let(:context) do
    context_ = instance_double(Liquid::Context)
    context_.config = config
    context_
  end

  it 'is created properly', skip: 'unfinished' do
    # TODO: write this test
  end
end
