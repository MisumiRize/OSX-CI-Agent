VERSION = '2.2.0'

package 'which'
package 'git'
package 'make'
package 'openssl-devel'
package 'readline-devel'
package 'libffi-devel'

git '/usr/local/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'master'
end

execute "/usr/local/ruby-build/bin/ruby-build #{VERSION} /usr/local" do
  not_if "which ruby && ruby --version | grep #{Regexp.escape(VERSION)}"
end

%w(
  bundler
  faraday
).each do |gem|
  execute "gem install #{gem}" do
    not_if "gem list | grep #{gem}"
  end
end
