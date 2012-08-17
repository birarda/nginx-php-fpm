#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2012, Stephen Birarda
#

# install the php-fpm package
package "php5-fpm" do
  action :install
end

# config php-fpm for nginx
template "php-fpm.inc" do
  path "#{node[:nginx][:dir]}/conf.d/php-fpm.inc"
  source "php-fpm.config.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  only_if "dpkg --get-selections | grep php5-fpm"
end

service "php5-fpm" do
  action :start
end  