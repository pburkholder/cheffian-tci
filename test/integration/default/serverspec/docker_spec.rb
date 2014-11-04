require 'serverspec'

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end


describe file('/opt/chefdk') do
  it { should be_directory }
end
