require 'serverspec'

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end


describe file('/opt/chefdk') do
  it { should be_directory }
end

describe file('/etc/yum.repos.d/chef_stable.repo')

describe service('chef-server') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/hosts') do
  its(:content) { should match /127.0.0.1.*chef.server/ }
end
