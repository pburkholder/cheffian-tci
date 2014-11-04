# encoding: utf-8
#
# Cookbook Name:: tci
# Recipe:: chefdk
#
# Copyright (c) 2014 The Authors, All Rights Reserved.


chef_dk 'chef_dk' do
  version node['tci']['chefdk']['version']
  global_shell_init true
  action :install
end
