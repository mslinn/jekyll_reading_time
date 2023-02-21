require 'jekyll_plugin_logger'
require 'liquid'
require 'nokogiri'
require_relative 'jekyll_reading_time/version'

module JekyllReadingTimeName
  PLUGIN_NAME = 'jekyll_reading_time'.freeze
end

# A Liquid filter to estimate how long a passage of text will take to read
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
    root.children.each do |node|
      if node.text?
        texts << node.text
      elsif !ignored_tags.include? node.name
        texts.concat text_nodes node
      end
    end
    texts
  end

  def words(html)
    fragment = Nokogiri::HTML.fragment html
    text_nodes(fragment).map { |text| text.scan(%r![\p{L}\p{M}'‘’]+!) }.flatten
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllReadingTimeName::PLUGIN_NAME} #{JekyllReadingTimeVersion::VERSION} plugin." }
Liquid::Template.register_filter(ReadingTime)
