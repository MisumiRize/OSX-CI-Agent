require 'spec_helper'

describe package('VirtualBox-4.3') do
  it { should be_installed }
end

describe service('vboxdrv') do
  it { should be_running }
  it { should be_enabled }
end
