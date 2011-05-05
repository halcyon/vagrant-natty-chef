#
# Cookbook Name:: redmine
# Recipe:: default
#
# Copyright 2011, BRT
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rvm"

site = "#{node['nginx']['site']}"

bash "update rubygems to 1.3.5" do
  code "rvm rubygems 1.3.5"
end

rvm_gem "rails" do
  version "2.3.5"
  action :install
end

rvm_gem "sqlite3" do
  action :install
end

template "/opt/nginx/conf/sites/#{site}.conf" do
  source "site.conf.erb"
  notifies :restart, 'service[nginx]'
end
