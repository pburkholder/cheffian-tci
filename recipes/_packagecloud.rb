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
  notifies :run, 'execute[prime_yum_cache]', :immediately
end
