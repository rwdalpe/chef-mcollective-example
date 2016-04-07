#
# Cookbook Name:: chef-server-validator
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "chef server user create" do
	command "chef-server-ctl user-create admin admin admin a@a.com 'password' --filename /imaginary_fileshare/admin.pem && touch /admin.exists"
	not_if "test -f /admin.exists"
end

execute "chef server org create" do
	command "chef-server-ctl org-create org org --association_user admin --filename /imaginary_fileshare/org-validator.pem && touch /org.exists"
	not_if "test -f /org.exists"
end

execute "chef server knife ssl fetch" do
	command "knife ssl fetch"
	not_if "test -d ~/.chef/trusted_certs"
end

execute "chef server knife upload cookbooks" do
	command "knife upload / --chef-repo-path /imaginary_fileshare/ -k /imaginary_fileshare/admin.pem -u admin -s https://$(hostname)/organizations/org"
end