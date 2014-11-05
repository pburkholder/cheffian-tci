
include_recipe 'tci::_packagecloud'

include_recipe 'tci::chefdk'
include_recipe 'tci::chef_server'

include_recipe 'tci::chef_user'
include_recipe 'tci::docker'

include_recipe 'tci::training'
