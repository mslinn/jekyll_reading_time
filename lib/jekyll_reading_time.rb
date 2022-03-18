# frozen_string_literal: true

require "jekyll"
require_relative "jekyll_reading_time/version"
require "jekyll_plugin_logger"

# A Liquid filter to estimate how long a passage of text will take to read
#
# https://github.com/bdesham/reading_time
#
# Copyright (c) 2013, 2015 Benjamin D. Esham.
# Copyright (C) 2022 Mike Slinn.
# This program is released under the ISC license, which you can find in the file LICENSE.md.

require 'nokogiri'

module Jekyll
  module ReadingTime

    def count_words(html)
      words(html).length
    end

    def reading_time(html)
      (count_words(html) / 270.0).ceil
    end

    private

    def text_nodes(root)
      ignored_tags = %w( area audio canvas code embed footer form img
                         map math nav object pre script svg table track video )

      texts = []
      root.children.each { |node|
        if node.text?
          texts << node.text
        elsif not ignored_tags.include? node.name
          texts.concat text_nodes node
        end
      }
      texts
    end

    def words(html)
      fragment = Nokogiri::HTML.fragment html
      text_nodes(fragment).map { |text| text.scan(%r![\p{L}\p{M}'‘’]+!) }.flatten
    end
  end

  Liquid::Template.register_filter(ReadingTime)
  info "Loaded jekyll_reading_time plugin."
end
