require 'spec_helper'

describe package('mackerel-agent') do
  it { should be_installed }
end
