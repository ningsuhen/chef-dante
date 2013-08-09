require 'minitest/spec'

describe 'dante::server' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'creates /etc/danted.conf' do
    file('/etc/danted.conf').must_exist
  end
end
