# TODO:  is there a better way?  a chefdk_gem resource, perhaps?
# action :nothin pending chefdk

ruby = '2.1.0'
home = '/home/chef'

execute "install kitchen-docker" do
  action :run
  command "/opt/chefdk/bin/chef gem install kitchen-docker"
  user "chef"
  group "chef"
  environment "HOME" => home
  ignore_failure true
  only_if do
    Dir.glob("#{home}/.chefdk/gem/ruby/#{ruby}/specifications/kitchen-docker*")
        .empty?
  end
end

# execute ""
