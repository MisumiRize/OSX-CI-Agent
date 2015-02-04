USER_NAME = 'osx-ci-agent'

user USER_NAME

file "/var/spool/cron/#{USER_NAME}" do
  content "0 4 * * * /bin/bash -l -c \"/home/#{USER_NAME}/bin/run_ci\"\n"
  mode '600'
  owner USER_NAME
  group USER_NAME
end

directory "/home/#{USER_NAME}/bin" do
  owner USER_NAME
  group USER_NAME
end

remote_file "/home/#{USER_NAME}/.bashrc" do
  source 'files/.bashrc'
  owner USER_NAME
  group USER_NAME
end

remote_file "/home/#{USER_NAME}/bin/run_ci" do
  source 'files/run_ci'
  mode '755'
  owner USER_NAME
  group USER_NAME
end
