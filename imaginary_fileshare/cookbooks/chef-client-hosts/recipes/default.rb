#
# Cookbook Name:: chef-client-hosts
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

hostsfile_entry '192.168.33.10' do
	hostname 'chefserver'
	action :create
end