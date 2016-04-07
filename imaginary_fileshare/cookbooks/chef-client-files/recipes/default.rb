#
# Cookbook Name:: chef-client-files
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "/etc/chef/validation.pem" do
	owner "root"
	group "root"
	mode 0755
	content ::File.open("/imaginary_fileshare/org-validator.pem").read
	action :create
end