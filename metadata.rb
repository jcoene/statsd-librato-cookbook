name             "statsd"
maintainer       "Jason Coene"
maintainer_email "jcoene@gmail.com"
license          "MIT License"
description      "Installs/configures statsd-librato"
version          "0.1.1"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "ark"
