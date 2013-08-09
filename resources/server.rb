actions :install, :enable

default_action :install

attribute :log_dir, :kind_of => String, :default => '/var/log/danted'
attribute :user_privileged, :kind_of => String, :default => 'proxy'
attribute :user_notprivileged, :kind_of => String, :default => 'nobody'
attribute :user_libwrap, :kind_of => String, :default => 'nobody'
attribute :compatibility, :kind_of => String, :default => nil
attribute :extensions, :kind_of => Array, :default => Array.new
attribute :connect_timeout, :kind_of => Integer, :default => 30
attribute :io_timeout, :kind_of => Integer, :default => 0
attribute :srchost_rules, :kind_of => Array, :default => Array.new
attribute :clientmethod, :kind_of => String, :default => 'none'
attribute :method, :kind_of => String, :default => 'none'
attribute :port, :kind_of => Integer, :default => 1080
attribute :interface, :kind_of => String, :default => 'eth0'
attribute :client_rules, :kind_of => Array, :default => [
  {
    'type' => 'pass',
    'from' => '0.0.0.0/0',
    'to' => '0.0.0.0/0',
    'log' => 'error',
  }
]
attribute :general_rules, :kind_of => Array, :default => [
  {
    'type' => 'pass',
    'from' => '0.0.0.0/0',
    'to' => '0.0.0.0/0',
    'command' => 'bind connect udpassociate',
    'log' => 'error',
  },
  {
    'type' => 'block',
    'from' => '0.0.0.0/0',
    'to' => '127.0.0.0/8',
    'log' => 'connect error',
  },
]
