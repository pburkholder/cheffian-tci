builds/ has box files

tar -tzf file.box:
Vagrantfile
disk-s001.vmdk
disk-s002.vmdk
disk-s003.vmdk
disk-s004.vmdk
disk-s005.vmdk
disk-s006.vmdk
disk-s007.vmdk
disk-s008.vmdk
disk-s009.vmdk
disk-s010.vmdk
disk-s011.vmdk
disk-s012.vmdk
disk-s013.vmdk
disk-s014.vmdk
disk-s015.vmdk
disk-s016.vmdk
disk-s017.vmdk
disk-s018.vmdk
disk-s019.vmdk
disk-s020.vmdk
disk-s021.vmdk
disk.vmdk
metadata.json
packer-centos-6.5-x86_64.nvram
packer-centos-6.5-x86_64.vmsd
packer-centos-6.5-x86_64.vmx
packer-centos-6.5-x86_64.vmxf


The .vmx is what's needed by VmWare Fusion to start something up with.

vagrant plugin install vagrant-vmware-fusion
vagrant plugin license vagrant-vmware-fusion ~/Downloads/license.lic
vagrant box add --name opscode-centos-6.5-vmware --provider vmware_desktop ./builds/opscode_centos-6.5_chef-provisionerless.box

----
Got sudo helper installed into MacOSX.
My VMware box didn't have vmware tools installed
Switched to original upstream

kitchen create
# kitchen converge; verify
# VAGRANT_CWD=./.kitchen/kitchen-vagrant/default
(cd special path; vagrant halt)

#vmrun clone .kitchen/kitchen-vagrant/learnchef-centos-65/.vagrant/machines/default/vmware_fusion/713fed99-7555-4345-8f24-1b42045e23bc/packer-centos-6.5-x86_64.vmx builds/learnchef.vmx full

source=$(vmrun list | grep $PWD)

vmrun clone $source builds/learnchef.vmx full


