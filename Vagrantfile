# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "niwashun/centos-6.5"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrantcloud.com/niwashun/centos-6.5"
 
# Jenkins master node
 config.vm.define :jenkmn do |hdnn_config|
    hdnn_config.vm.network "private_network", ip: "192.168.1.11"
    hdnn_config.vm.host_name = "jenkmnn"
    hdnn_config.vm.network "forwarded_port", guest: 80, host:8080
  end

#chef client - workstation dev
config.vm.define :dev do |dev_config|
  dev_config.vm.network "public_network", :bridge => 'en0: Ethernet'
  dev_config.vm.host_name = "dev"     
  dev_config.vm.provision "shell", path: "install_chef_solo.sh"
end
 
  #Hadoop Slave One
#  config.vm.define :hdslave1 do |hdslave1_config|
#   hdslave1_config.vm.network "private_network", ip: "192.268.1.13"
#   hdslave1_config.vm.host_name = "hdslave1"
#  end
 
  #Hadoop Slave Two
#  config.vm.define :hdslave2 do |hdslave2_config|
#   hdslave2_config.vm.network "private_network", ip: "192.268.1.14"
#   hdslave2_config.vm.host_name = "hdslave2"
#  end

#  config.vm.define :hdslave3 do |hdslave3_config|
#   hdslave3_config.vm.network "private_network", ip: "192.268.1.15"
#   hdslave3_config.vm.host_name = "hdslave3"
#  end

#  config.vm.define :hdslave4 do |hdslave4_config|
#   hdslave4_config.vm.network "private_network", ip: "192.268.1.16"
#   hdslave4_config.vm.host_name = "hdslave4"
#  end

#  config.vm.define :hdclient do |hdclient_config|
#   hdclient_config.vm.network "private_network", ip: "192.268.1.17"
#   hdclient_config.vm.host_name = "hdclient"
#  end

  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
