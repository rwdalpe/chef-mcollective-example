metadata	:name	=> "SimpleRPC Chef Client Agent",
	:description => "Agent to manage the chef client",
	:author      => "Nicolas Szalay",
	:license     => "Apache License 2.0",
	:version     => "1.0",
	:url         => "http://www.rottenbytes.info",
	:timeout     => 30

requires :mcollective => "2.0.0"

action "status", :description => "Current Chef client status" do
	display :always
	
	output :running,
		:description => "Is the Chef client running",
		:display_as => "Running",
		:default => false
	
	summarize do
		aggregate summary(:running)
	end
end

action "runonce", :description => "Run the Chef client once" do
	display :always
	
	output :status,
		:description => "Chef client exit code",
		:display_as => "Exit Code",
		:default => 0

	output :stdout,
		:description => "Chef client stdout",
		:display_as => "stdout",
		:default => ""

	output :stderr,
		:description => "Chef client stderr",
		:display_as => "stderr",
		:default => ""
end