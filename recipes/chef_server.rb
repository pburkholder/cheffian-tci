# encoding: utf-8

api_fqdn = node['tci']['chef-server']['api_fqdn']

execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end

package 'chef-server-core' do
  action :install
  version node['tci']['chef-server']['version']
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end

ruby_block 'ensure node can resolve API FQDN' do
  block do
    fe = Chef::Util::FileEdit.new('/etc/hosts')
    fe.insert_line_if_no_match(/#{api_fqdn}/,
      "127.0.0.1 #{api_fqdn}")
    fe.write_file
  end
  not_if { Resolv.getaddress(api_fqdn) rescue false } # host resolves
end

file '/etc/opscode/chef-server.rb' do
  content "topology \"standalone\"\napi_fqdn \"#{api_fqdn}\"\n"
  owner 'root'
  group 'root'
  action :create
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end
