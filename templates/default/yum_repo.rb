[chef_stable]
name=chef_stable
baseurl=https://packagecloud.io/chef/stable/el/<%= centos_version %>/$basearch
repo_gpgcheck=0
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
