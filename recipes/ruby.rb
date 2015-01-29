VERSION = '2.2.0'

package 'git'
package 'make'
package 'openssl-devel'
package 'readline-devel'
package 'libffi-devel'

git '/usr/local/ruby/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'master'
end

execute "/usr/local/ruby/ruby-build/bin/ruby-build #{VERSION} /usr/local/ruby/versions/#{VERSION}" do
  not_if "test -e /usr/local/ruby/versions/#{VERSION}/bin/ruby"
end

file '/etc/profile.d/ruby.sh' do
  content "export PATH=\"/usr/local/ruby/versions/#{VERSION}/bin:$PATH\""
end

%w(
  bundler
  faraday
).each do |gem|
  execute "/usr/local/ruby/versions/#{VERSION}/bin/gem install #{gem}" do
    not_if "/usr/local/ruby/versions/#{VERSION}/bin/gem list | grep #{gem}"
  end
end
