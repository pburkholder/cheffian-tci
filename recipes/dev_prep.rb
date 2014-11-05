# TODO:  is there a better way?  a chefdk_gem resource, perhaps?
# action :nothin pending chefdk

ruby = '2.1.0'
home = '/home/chef'
chef_dir = '/home/chef/.chef'

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

directory chef_dir do
  user 'chef'
  group 'chef'
  mode '0700'
end

# user create USERNAME FIRST_NAME [MIDDLE_NAME] LAST_NAME EMAIL PASSWORD
execute 'create training user' do
  creates "#{chef_dir}/training.pem"
  command "chef-server-ctl user-create training Chef Training training@getchef.com StirItUp -f #{chef_dir}/training.pem"
end

# org create ORG_SHORT_NAME ORG_FULL_NAME -a USERNAME
execute 'create training org' do
  creates "#{chef_dir}/training_org.pem"
  command "chef-server-ctl org-create training_org training_org -a training -f -f #{chef_dir}/training_org.pem"
end

template 'knife.rb' do
  action :nothing
end
