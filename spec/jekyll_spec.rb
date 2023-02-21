require 'jekyll'
require_relative '../lib/jekyll_reading_time'

RSpec.describe(Jekyll) do
  include described_class

  let(:config) { instance_double(Configuration) }
  let(:context) {
    context_ = instance_double(Liquid::Context)
    context_.config = config
    context_
  }

  it 'is created properly' do
    pending 'TBD'
  end
end
