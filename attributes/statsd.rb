default[:statsd][:version] = "0.1.2"
default[:statsd][:user] = "statsd"
default[:statsd][:log_file] = "/var/log/statsd.log"

default[:statsd][:address] = "0.0.0.0:8125"
default[:statsd][:librato_user] = ""
default[:statsd][:librato_token] = ""
default[:statsd][:librato_source] = ""

default[:statsd][:flush] = 60
default[:statsd][:percentiles] = []

