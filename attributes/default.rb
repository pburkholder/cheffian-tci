default['tci']['chefdk']['version'] = '0.3.2'
default['tci']['chef-server']['version'] = '12.0.0_rc.5-1.el5'
default['tci']['chef-server']['api_fqdn'] = 'chef.server'

default['tci']['chef_user']['password'] = 'chef'
# OR:  password = rand(36**8).to_s(36)

default['docker']['docker_daemon_timeout'] = 600
default['docker']['exec_driver'] = "lxc"
default['docker']['version'] = '1.2.0-3.el6'
