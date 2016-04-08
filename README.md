# Chef MCollective Example & Lab

This is a naive example of creating a set up where [Chef][1] clients can be triggered and interrogated using [MCollective][2].

## Usage

### Install Vagrant and VirtualBox

Grab [Vagrant][3] and [VirtualBox][4] for your system and ensure that you can run both of them.

### Clone/Download the Repository and Get Submodules

This example uses a number of cookbooks to provision everything.
Librarian or Berkshelf is not set up; the necessary cookbooks are included as git submodules.

````
git clone https://github.com/rwdalpe/chef-mcollective-example.git
cd chef-mcollective-example
git submodule init
git submodule update
````

### `vagrant up` the `chef-server` VM

````
cd chef-server
vagrant up --provider virtualbox
````

### `vagrant up` the `chef-client` VM

````
cd chef-client
vagrant up --provider virtualbox
````

### Test Out MCollective and Chef!

````
cd chef-server
vagrant ssh
sudo mco ping
sudo mco rpc chef status
sudo mco rpc chef runonce
````

If you want to observe that the `chef-client` actually does run perform the following in another terminal at the same time.

````
cd chef-client
vagrant ssh
watch -n0.5 'ps aux | grep chef-client'
````

You should see the `chef-client` process pop into that view briefly once the run is triggered.

## Thanks & Recognition

Many thanks to the authors of the cookbooks, plugins, and other tools necessary for this demo.
Most of that work gets pulled into the repository, so I encourage you to check it out.
There are some things that are pulled directly onto the server/client and you might not otherwise notice.

In particular, [rottenbytes chef agent][5] is probably the most important part of this since that's how MCollective interfaces with Chef.
The [PuppetLabs MCollective Ohai facts plugin][6] is also pulled in behind the scenes.

[1]: https://www.chef.io/
[2]: https://docs.puppet.com/mcollective/
[3]: https://www.vagrantup.com/
[4]: https://www.virtualbox.org/wiki/Downloads
[5]: https://github.com/rottenbytes/mcollective/blob/master/plugins/agents/chef.rb
[6]: https://github.com/puppetlabs/mcollective-ohai-facts