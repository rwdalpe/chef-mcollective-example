#
# Cookbook Name:: puppetlabs-apt-repo
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt::default"

apt_repository "puppetlabs" do
	uri "https://apt.puppetlabs.com/"
	distribution node["lsb"]["codename"]
	components [ "main", "dependencies" ]
	key "https://apt.puppetlabs.com/pubkey.gpg"
	action :add
	notifies :run, "execute[apt-get update]", :immediately
end