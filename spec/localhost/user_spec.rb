require 'spec_helper'

describe user('osx-ci-agent') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
end

describe cron do
  it { should have_entry('0 12 * * * /bin/bash -l -c /home/osx-ci-agent/bin/build').with_user('osx-ci-agent') }
end

describe file('/home/osx-ci-agent/bin/build') do
  it { should be_file }
  it { should be_mode 755 }
end
