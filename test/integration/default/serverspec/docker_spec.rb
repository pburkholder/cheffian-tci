require 'serverspec'

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end


describe file('/opt/chefdk') do
  it { should be_directory }
end

describe file('/etc/yum.repos.d/chef_stable.repo')

describe command('/usr/bin/chef-server-ctl status') do
  its(:exit_status) { should eq 0 }
end

describe file('/etc/hosts') do
  its(:content) { should match /127.0.0.1.*chef.server/ }
end
