name "server"
description "The Chef server and MCollective collective for the demo"
run_list "recipe[chef-server::default]", "recipe[chef-server-validator::default]"
