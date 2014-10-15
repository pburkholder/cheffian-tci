#
# Cookbook Name:: chef_user
# Recipe:: default
#
# Copyright 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if node.attribute?('chef_user') && node['chef_user']['password']
  password = node['chef_user']['password']
else
  password = rand(36**8).to_s(36)
end

node.default['chef_user']['password'] = password

shadow_hash = password.crypt("$1$")

group "chef" do
  gid 2000
end

user "chef" do
  comment "Chef <training@getchef.com>"
  home "/home/chef"
  gid 2000
  password shadow_hash
  shell "/bin/bash"
  uid 2000
  supports :manage_home => true
end

template "/home/chef/.bash_profile" do
  source "bash_profile.erb"
  owner "chef"
  group "chef"
  mode "0644"
end

include_recipe "learnchef_sudo"
