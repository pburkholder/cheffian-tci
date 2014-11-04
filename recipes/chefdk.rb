# encoding: utf-8
#
# Cookbook Name:: tci
# Recipe:: chefdk
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

package 'chefdk' do
  version node['tci']['chefdk']['version']
  action :install
end
