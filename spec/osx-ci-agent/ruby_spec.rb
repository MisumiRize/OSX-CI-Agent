require 'spec_helper'

VERSION = '2.2.0'

describe command('bash -l -c "which ruby"') do
  its(:stdout) { should match %r|/usr/local/bin/ruby| }
end

describe command("/usr/local/bin/ruby --version") do
  its(:stdout) { should match %r|#{VERSION}| }
end

describe command("/usr/local/bin/gem list") do
  its(:stdout) { should match /bundler/ }
  its(:stdout) { should match /faraday/ }
end
