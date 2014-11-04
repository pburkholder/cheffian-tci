#
# Cookbook Name:: learnchef_docker
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

node.default['docker']['docker_daemon_timeout'] = 600
node.default['docker']['exec_driver'] = "lxc"

include_recipe "docker::default"

# TODO:  is there a better way?  a chefdk_gem resource, perhaps?
# action :nothin pending chefdk
execute "install kitchen-docker" do
  action :nothing
  command "/opt/chefdk/bin/chef gem install kitchen-docker"
  user "chef"
  group "chef"
  environment "HOME" => "/home/chef"
  ignore_failure true
end

# TODO:  is there a way to get a clean docker install without requiring this?
# action :nothing pending chefdk
execute "clean-up docker" do
  action :nothing
  command <<-EOH
    service docker stop
    rm -rf /var/lib/docker
    service docker start
  EOH
end

docker_image "centos" do
  cmd_timeout 3000
  ignore_failure true
end
