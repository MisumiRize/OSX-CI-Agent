require 'spec_helper'

describe user('osx-ci-agent') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
end

describe cron do
  it { should have_entry('0 4 * * * /bin/bash -l -c "/home/osx-ci-agent/bin/run_ci"').with_user('osx-ci-agent') }
end

describe file('/home/osx-ci-agent/bin/run_ci') do
  it { should be_file }
  it { should be_mode 755 }
end

describe file('/home/osx-ci-agent/.bashrc') do
  it { should be_file }
  it { should contain 'export PATH=/usr/local/bin:$PATH' }
end
