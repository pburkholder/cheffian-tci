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


----
# Update

So I have the following VmWare approaches underway

1. This learnchef which uses the opscode bento box for 6.5, then uses kitchen to lay stuff down. Runs
1. $HOME/Projects/cheftraining which is a clone of https://github.com/learningchef/cheftraining.git, which is a Packer box build from Mischa, built myself with chefdk 0.3.0
1. $HOME/tmp/learningchef from `vagrant init learningchef/cheftraining` from https://vagrantcloud.com/learningchef/boxes/cheftraining Mischa, with chefdk 0.2.2

The second two are Ubuntu 14.04.1 with docker 1.2.0

Also, there's https://github.com/box-cutter/centos-vm.git, which has CentOs7, w Docker, and Docker 1.1.2 is supported in EPEL

What about Docker verions?
- 1.1.2 released 22 July 2014
- 1.2.0 released 22 August 2014
- Centos7 has 0.11.1
- Centos6 has 1.1.2 and 1.2.0 (testing, https://admin.fedoraproject.org/updates/docker-io-1.2.0-3.el6) according to https://apps.fedoraproject.org/packages/docker-io/overview/
- And testing can be enabled with: yum install <foo> --enablerepo=epel-testing according to http://fedoraproject.org/wiki/EPEL/testing

What about kernels
- 2.6.38+
- 3.8+ recommended
- Ubuntu 3.13 is on 14.04
- RHEL 6: 2.6.32-504 is RHEL 6.6
- RHEL 7: 3.10.0-123
