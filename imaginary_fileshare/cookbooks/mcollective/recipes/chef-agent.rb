directory "/usr/share/mcollective/plugins/mcollective/agent/" do
	owner "root"
	group "root"
	mode "0755"
	recursive true
	action :create
end

cookbook_file "/usr/share/mcollective/plugins/mcollective/agent/chef.ddl" do
	source "chef.ddl"
	owner "root"
	group "root"
	mode "0755"
	action :create
end

remote_file "/usr/share/mcollective/plugins/mcollective/agent/chef.rb" do
	source "https://raw.githubusercontent.com/rottenbytes/mcollective/master/plugins/agents/chef.rb"
	owner "root"
	group "root"
	mode "0755"
	action :create
end