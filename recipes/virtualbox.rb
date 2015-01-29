package 'gcc'
package 'kernel-devel'
package 'epel-release'
package 'dkms'

require 'open-uri'

file '/etc/yum.repos.d/virtualbox.repo' do
  content open('http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo').read
end

package 'VirtualBox-4.3'

execute '/etc/init.d/vboxdrv setup' do
  action :nothing
  subscribes :run, 'package[VirtualBox-4.3]', :immediately
end

service 'vboxdrv' do
  action [:start, :enable]
end
