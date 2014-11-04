name              'tci'
maintainer        'Peter Burkholde'
maintainer_email  'pburkholder@pobox.com'
license           'Apache 2.0'
description       'Installs and configures Teaching Chef Image'
version           '0.0.2'

%w(ubuntu debian centos redhat).each do |os|
  supports os
end

depends 'docker'
depends 'sudo'
