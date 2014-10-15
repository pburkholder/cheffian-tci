#
# Cookbook Name:: learnchef_sudo
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
node.default['authorization']['sudo']['users'] = ["chef"]
node.default['authorization']['sudo']['passwordless'] = true

include_recipe "sudo::default"
