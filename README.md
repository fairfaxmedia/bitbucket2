# Bitbucket2

Bitbucket2 is a wrapper gem for the BitBucket API - exploiting the new (2.0) version, and support for OAuth2.

It leverages [Restroom](https://github.com/fairfaxmedia/bitbucket2) (a wrapper meta gem) which was built in parallel to Bitbucket2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitbucket2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitbucket2

## Usage

Use the Bitbucket2::Client class to get all public repositories like this:

```
Bitbucket2::Client.new.repositories.all
```

To collect private data, pass an oauth_token into the constructor:
```
Bitbucket2::Client.new(oauth_token: token).repositories.all
```

These tokens can be collected in a variety of ways - the Rakefile provides a number of tasks to facilitate this.

If you have client credentials for BitBucket's OAuth service, you can put them in `defaults.yml` like this:

```
credentials:
  key: <key>
  secret: <secret>
```

...and then run `rake oauth` - you'll be guided through an authentication cycle and at the end your `defaults.yml` will have an access token in it.

`rake console` will then allow you to use that token in a prebuilt client object, via a helper method at `Bitbucket2.default_client`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fairfaxmedia/bitbucket2.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
