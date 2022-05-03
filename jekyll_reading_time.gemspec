# frozen_string_literal: true

require_relative "lib/jekyll_reading_time/version"

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  github = "https://github.com/mslinn/jekyll_reading_time"

  spec.authors = ["Benjamin D. Esham", "Mike Slinn"]
  spec.bindir = "exe"
  spec.description = <<~END_OF_DESC
    A Liquid filter to estimate how long a passage of text will take to read.
  END_OF_DESC
  spec.email = ["benjamin@esham.io", "mslinn@mslinn.com"]
  spec.files = Dir[".rubocop.yml", "LICENSE.*", "Rakefile", "{lib,spec}/**/*", "*.gemspec", "*.md"]
  spec.homepage = "https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html#jekyll_reading_time"
  spec.license = "ISC"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri"   => "#{github}/issues",
    "changelog_uri"     => "#{github}/CHANGELOG.md",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => github,
  }
  spec.name = "jekyll_reading_time"
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.6.0"
  spec.summary = "A Liquid filter to estimate how long a passage of text will take to read."
  spec.test_files = spec.files.grep(%r!^(test|spec|features)/!)
  spec.version = JekyllReadingTimeVersion::VERSION

  spec.add_dependency "jekyll", ">= 3.5.0"
  spec.add_dependency "jekyll_plugin_logger"
  spec.add_dependency "liquid"
  spec.add_dependency "liquid_pluralize"
  spec.add_dependency "nokogiri"

  # spec.add_development_dependency "debase"
  # spec.add_development_dependency "rubocop-jekyll"
  # spec.add_development_dependency "rubocop-rake"
  # spec.add_development_dependency "rubocop-rspec"
  # spec.add_development_dependency "ruby-debug-ide"
end
# rubocop:enable Metrics/BlockLength
