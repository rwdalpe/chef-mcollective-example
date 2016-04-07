#
# Cookbook Name:: activemq-custom-config
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

version = node['activemq']['version']
activemq_home = "#{node['activemq']['home']}/apache-activemq-#{version}"

template "#{activemq_home}/conf/activemq.xml" do
  source   'activemq.xml.erb'
  mode     '0755'
  owner    'root'
  group    'root'
  notifies :restart, 'service[activemq]'
end