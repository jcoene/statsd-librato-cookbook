# Librato StatsD Cookbook

Installs and manages [statsd-librato](https://github.com/jcoene/statsd-librato), an Etsy compatible StatsD daemon that submits data to [Librato](https://metrics.librato.com).

## Requirements

- Chef
- Ubuntu or Debian

## Usage

Install with Berkshelf:

```ruby
cookbook "statsd", git: "git://github.com/jcoene/statsd-librato-cookbook.git"
```

Include the `statsd::default` recipe to your run list or inside your cookbook.

## Attributes

The following attributes are set under the `statsd` namespace:

- version - The version of statsd-librato to install. Must correspond with a packaged release from [statsd-librato on github](https://github.com/jcoene/statsd-librato/releases).
- user - The system user account to run statsd as. Defaults to "statsd"
- log_file - The log file for the statsd-librato application. Defaults to "/var/log/statsd.log"
- address - The statsd service address and port, defaults to "0.0.0.0:8125"
- librato_user - Your Librato username (required)
- librato_token - The Librato API token (required)
- librato_source - The source setting for submitting data from this machine (optional)
- flush - The interval at which metrics are flushed to Librato in seconds. Defaults to 60.
- percentiles - An array of integers representing additional percentiles to submit for timers. Defaults to none.

## Recipes

- default

## Author and License

Copyright 2014 Jason Coene, released under the MIT license.
