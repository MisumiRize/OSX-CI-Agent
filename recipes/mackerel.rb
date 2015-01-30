file '/etc/yum.repos.d/mackerel.repo' do
  content <<-REPO
[mackerel]
name=mackerel-agent
baseurl=http://yum.mackerel.io/centos/$basearch
gpgcheck=1
gpgkey=https://mackerel.io/assets/files/GPG-KEY-mackerel
  REPO
end

package 'mackerel-agent'
