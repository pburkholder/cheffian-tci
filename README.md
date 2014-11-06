TCI: Teaching Chef Image
=======================

Introduction
------------

Make an image that can be instantiated in Vmware ESX (or other virtualization environments) that has _everything_ needed for Chef. As a training env or a sandbox.

How to use
----------

These instructions assume the box/TKTK.iso has been installed as a local VmWare guest. Fleshing out as ESX install or other cloud provider is yet to be done.

    ssh chef@(ip)

You should find:

1. Docker is running
1. chef-server is running
  * training_org is created
  * training user created
1. ChefDk installed at /opt/chefdk
  * Ruby is chefdk ruby
1. ~chef/.chef/ directory is provisioned with
  * knife.rb
  * chef_user.pem
  * validation-myorg.pem
1. knife client list returns only the chef_user
1. BERKSHELF_PATH is populated with a shit ton of cookbooks (no community site needed!)
1. Cache rpms on disk?
2. Make sure all potentially required gems are installed
3. Pico is installed 


How to build
------------

Notes still in progress here, use kitchen to build with the kitchen-vagrant and the vmware-vagrant plugins:

   kitchen converge
   # kitchen converge; verify
   # VAGRANT_CWD=./.kitchen/kitchen-vagrant/default
   (cd special path; vagrant halt)
   
Then vmrun to clone

   #vmrun clone .kitchen/kitchen-vagrant/learnchef-centos-65/.vagrant/machines/default/vmware_fusion/713fed99-7555-4345-8f24-1b42045e23bc/packer-centos-6.5-x86_64.vmx builds/learnchef.vmx full

   source=$(vmrun list | grep $PWD)

   vmrun clone $source builds/learnchef.vmx full

References
----------

* Nathen Harvey's AWS images for the Surge Introduction to Chef class: https://github.com/learnchef/introduction_to_chef/tree/master/instructor with chef-metall FTW
* Mischa Taylor's Learning Chef work at: https://github.com/learningchef/cheftraining.git, which is a Packer box build
