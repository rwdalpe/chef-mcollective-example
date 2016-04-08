apt_package "mcollective" do
	:upgrade
end

directory "/usr/share/mcollective/plugins/mcollective/facts/" do
	owner "root"
	group "root"
	mode "0755"
	recursive true
	action :create
end

remote_file "/usr/share/mcollective/plugins/mcollective/facts/opscodeohai_facts.rb" do
	source "https://raw.githubusercontent.com/puppetlabs/mcollective-ohai-facts/master/facts/opscodeohai_facts.rb"
	owner "root"
	group "root"
	mode "0755"
	action :create
end

remote_file "/usr/share/mcollective/plugins/mcollective/facts/opscodeohai_facts.ddl" do
	source "https://raw.githubusercontent.com/puppetlabs/mcollective-ohai-facts/master/facts/opscodeohai_facts.ddl"
	owner "root"
	group "root"
	mode "0755"
	action :create
end

include_recipe "mcollective::chef-agent"

service "mcollective" do
  supports :restart => true, :status => true
  action   [:enable, :start]
end

template "/etc/mcollective/server.cfg" do
  source   "server.cfg.erb"
  mode     "0755"
  owner    "root"
  group    "root"
  notifies :restart, "service[mcollective]"
end

