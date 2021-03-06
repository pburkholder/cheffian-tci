# Encoding: utf-8
require_relative 'spec_helper'

describe 'tci::docker' do
  let :chef_run do
    ChefSpec::Runner.new do |node|
      node.set['docker']['binary']['dependency_packages'] =  %w(procps xz-utils)
    end.converge(described_recipe)
  end

  before do
    stub_command('mountpoint -q /sys/fs/cgroup').and_return(true)
  end

  it 'should do converge' do
    expect(chef_run).to be
  end
end

describe 'tci::chefdk' do
  let :chef_run do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'should converge for chefdk' do
    expect(chef_run).to be
  end
end
