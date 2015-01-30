require 'spec_helper'

describe package('gcc') do
  it { should be_installed }
end
