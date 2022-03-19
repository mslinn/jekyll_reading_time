`jekyll_reading_time`
[![Gem Version](https://badge.fury.io/rb/jekyll_reading_time.svg)](https://badge.fury.io/rb/jekyll_reading_time)
===========

`jekyll_reading_time` is a Jekyll plugin that provides a [Liquid](http://www.liquidmarkup.org/) filter that intelligently counts the number of words in a piece of HTML and estimates how long the text will take to read.

The contents of the following tags are ignored and do not count towards the computed reading time:
`area`, `audio`, `canvas`, `code`, `embed`, `footer`, `form`, `img`, `map`, `math`, `nav`, `object`, `pre`, `script`, `svg`, `table`, `track`, `video`.


# Usage

Two functions are provided:

* reading\_time

  This function gives an estimate of the amount of time it will take to read the input text. The return value is an integer number of minutes. The input should be HTML (i.e. the text should have already been run through your Markdown or Textile filter). For example, you could use it in a `_layout` file like this:

        {% capture time %}{{ content | reading_time }}{% endcapture %}
        <p>This article will take {{ time }} {% if time == '1' %}minute{% else %}minutes{% endif %} to read.</p>

  Even better, using the [pluralize](https://github.com/bdesham/pluralize) filter, which is a dependency and is automatically installed when this gem is installed.

        <p>This article will take {{ content | reading_time | pluralize: "minute" }} to read.</p>

* count\_words

  This function returns the number of words in the input. Like `reading_time`, this function takes HTML as its input.

## Details

These functions try to be smart about counting words. Specifically, words are not counted if they are contained within any of the following HTML elements: area, audio, canvas, code, embed, footer, form, img, map, math, nav, object, pre, script, svg, table, track, and video. My intention here is to prevent words from contributing toward the count if they don’t seem to be part of the running text—contrast this with the simple but inaccurate approach of e.g. Jekyll’s built-in `number_of_words`.

The plugin assumes a reading speed of 270 words per minute. Wikipedia [cites](https://en.wikipedia.org/w/index.php?title=Words_per_minute&oldid=569027766#Reading_and_comprehension) 250–300 words per minute as a typical range, and I found that I could read articles on my website at about 270 words per minute.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_reading_time'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_reading_time


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


### Build and Install Locally
To build and install this gem onto your local machine, run:
```shell
$ rake install:local
```

The following also does the same thing:
```shell
$ bundle exec rake install
jekyll_reading_time 1.0.0 built to pkg/jekyll_reading_time-0.1.0.gem.
jekyll_reading_time (1.0.0) installed.
```

Examine the newly built gem:
```shell
$ gem info jekyll_reading_time

*** LOCAL GEMS ***

jekyll_reading_time (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_reading_time
    License: ISC
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```

### Build and Push to RubyGems
To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Authors

This plugin was created by [Benjamin Esham](https://esham.io),
and later updated by [Mike Slinn](https://mslinn.com).

This project is [hosted on GitHub](https://github.com/mslinn/jekyll_reading_time). Please feel free to submit pull requests.

The gem is hosted on [RubyGems](https://rubygems.org).


## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [ISC License](https://opensource.org/licenses/ISC).
