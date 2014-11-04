

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

sudo 'chef' do
  user 'chef'
  nopasswd true
end
