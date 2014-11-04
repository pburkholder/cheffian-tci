# encoding: utf-8

api_fqdn = node['tci']['chef-server']['api_fqdn']

execute 'prime_yum_cache' do
  action :nothing
  command %Q{yum -q makecache -y --disablerepo='*' --enablerepo='chef_stable'}
end

template '/etc/yum.repos.d/chef_stable.repo' do
  source 'yum_repo.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    centos_version: '6'
  })
  notifies :run, 'execute[prime_yum_cache]'
end

package 'chef-server' do
  action :install
  version node['tci']['chef-server']['version']
end

# cargo-culted from community chef-server::default
# create the chef-server etc directory
directory '/etc/chef-server' do
  owner 'root'
  group 'root'
  recursive true
  action :create
end

# create the initial chef-server config file
file '/etc/chef-server/chef-server.rb' do
  content "topology 'standalone'\napi_fqdn \"#{api_fqdn}\"\n"
  owner 'root'
  group 'root'
  action :create
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end

# reconfigure the installation
execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
  action :nothing
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
