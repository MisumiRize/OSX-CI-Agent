VAGRANT_VERSION = '1.7.2'

execute "rpm -Uvh https://dl.bintray.com/mitchellh/vagrant/vagrant_#{VAGRANT_VERSION}_x86_64.rpm" do
  not_if 'which vagrant'
end
