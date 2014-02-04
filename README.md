# Bare

Barebones requests for Ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'bare'

And then execute:

    $ bundle

Or install it yourself as

    $ gem install bare

## Usage

### Functions

* `setCookie(url, parameters={}, https=false)` - Gets and sets a cookie, to the `cookie` attribute, from a given url using any given parameters
* `get(url, parameters={}, https=false, cookie=self.cookie)` - GET request method
* `post(url, parameters={}, https=false, cookie=self.cookie)` - POST request method
* `put(url, parameters={}, https=false, cookie=self.cookie)` - PUT request method
* `delete(url, parameters={}, https=false, cookie=self.cookie)` - DELETE request method

```ruby
> require 'bare'
> c = Bare::Curl
> c.get('http://www.google.com')
> c.body
```

### Attributes

`body`, `code`, and `response` attributes are set after running `get`, `post`, `put`, or `delete` functions.

```ruby
> c.body
=> "<!doctype html>...</html>"
> c.code
=> "200"
> c.response
=> #<Net::HTTPOK 200 OK readbody=true>
```

## Contributing

1. Fork it ( http://github.com/eanlain/bare/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
