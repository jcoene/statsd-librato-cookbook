#
# Cookbook Name: statsd
# Recipe: default
#
#
# Author: Jason Coene <jcoene@gmail.com>
#
# MIT License
#

include_recipe "ark"

ark "statsd" do
  version           node[:statsd][:version]
  action            :install
  has_binaries      ["bin/statsd"]
  url               "https://github.com/jcoene/statsd-librato/releases/download/#{node[:statsd][:version]}/statsd-#{node[:statsd][:version]}.linux-amd64.tar.gz"
  only_if           "test \"`/usr/local/bin/statsd -version 2>&1`\" != \"statsd-librato v#{node[:statsd][:version]}\""
  notifies :restart, "service[statsd]"
end

args = {
  "address" => node[:statsd][:address],
  "flush" => node[:statsd][:flush],
}

if node[:statsd][:percentiles].any?
  args["percentiles"] = node[:statsd][:percentiles].map(&:to_s).join(",")
end

user node[:statsd][:user] do
  system true
end

file node[:statsd][:log_file] do
  owner node[:statsd][:user]
  mode "0644"
end

template "/etc/init/statsd.conf" do
  source "statsd.conf.erb"
  owner "root"
  mode "0644"
  variables(
    args: args
  )
  notifies :restart, "service[statsd]"
end

service "statsd" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
  supports status: true, restart: true, reload: false, start: true, stop: true
end
