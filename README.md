# ServiceStatusClient

A library to consume the [Service Status API](https://github.com/anymoto/service_status). Current stable version is *0.1.0*.

With this gem you will be able to:
- [x] Get the service current status
- [x] Update the service status

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'service_status_client', git: 'git://github.com/anymoto/service_status_client.git'
```

And then execute:

    $ bundle

Or, clone/download the repository and install it yourself as:

    $ gem build service_status_client.gemspec
    $ gem install path_to_gem/service_status_client-*VERSION*.gem

## Usage

* First, require the gem:

```ruby
require 'service_status_client'
```

* Then, initialize the client:
```ruby
client = ServiceStatusClient::Client.new(url: *API_URL*, auth_token: *USER_TOKEN*)
```

If url is not present, the default url will be:
```
http://localhost:3000/api/v1
```

But, you always must provide your authorization token.

* To get the current status:
```ruby
client.current_status
```

* To update the service status:
```ruby
client.create_status(status: 'UP', message: 'Service was restored')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anymoto/service_status_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
