# Brickset

Get LEGO set details from brickset.com.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brickset'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brickset

## Usage

```ruby
require 'brickset'

client = Brickset::Client.new
client.get_set(10251)
=> #<Brickset::Legoset:0x007f956acfc3b0
  @available_since=Fri, 01 Jan 2016,
  @eol=0,
  @legoset_id="10251",
  @minifigs=5,
  @name="Brick Bank",
  @pieces=2380,
  @ppp=5.5,
  @rrp_eur=149.99,
  @rrp_usd=169.99,
  @rrp_gbp=129.99,
  @score=4.6,
  @subtheme="Modular Buildings",
  @theme="Advanced Models",
  @year=2016>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pelf/brickset.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

