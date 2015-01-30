USER_NAME = 'osx-ci-agent'

user USER_NAME

file "/var/spool/cron/#{USER_NAME}" do
  content "0 12 * * * /bin/bash -l -c /home/#{USER_NAME}/bin/build"
  mode '600'
  owner USER_NAME
  group USER_NAME
end

directory "/home/#{USER_NAME}/bin"

file "/home/#{USER_NAME}/bin/build" do
  content <<-FILE
#!/usr/bin/env ruby
puts 'foo'
  FILE
  mode '755'
  owner USER_NAME
  group USER_NAME
end
