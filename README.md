<img src="https://user-images.githubusercontent.com/8730447/37973863-7a31b70a-31a9-11e8-88f1-4c067b3275f2.png">

µBlitz (MicroBlitz) is intended to cause chaos in your life. µBlitz is designed to be configured for a Ruby on Rails app and at random it will (on any given file); delete it, delete half of it, rename it using a [homograph attack](https://en.wikipedia.org/wiki/IDN_homograph_attack), corrupt it, etc... you get the point. This (probably) will result in some throw errors or a complete application shut down. This is an attempt at chaos engineering.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'micro_blitz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install micro_blitz

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/micro_blitz.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
