#
# Cookbook Name:: mcollective
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
apt_package "mcollective-client" do
	:upgrade
end

template "/etc/mcollective/client.cfg" do
  source   "client.cfg.erb"
  mode     "0755"
  owner    "root"
  group    "root"
end

include_recipe "mcollective::chef-agent"