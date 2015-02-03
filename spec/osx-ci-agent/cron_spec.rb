require 'spec_helper'

describe service('crond') do
  it { should be_running }
  it { should be_enabled }
end
