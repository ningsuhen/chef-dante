def whyrun_supported?
  true
end

action :install do
  if platform_family?('debian')
    converge_by('link the libc') do
      link '/lib/x86_64-linux-gnu/libc.so' do
        to '/lib/x86_64-linux-gnu/libc.so.6'
      end
    end
  end
  converge_by('install dante server') do
    package 'dante-server' do
      action :install
    end
    directory new_resource.log_dir do
      owner 'root'
      group 'root'
      mode 00755
      action :create
    end
    puts new_resource.general_rules
    template '/etc/danted.conf' do
      source 'danted.conf.erb'
      cookbook 'dante'
      variables({
        'ipaddress' => node['ipaddress'],
        'port' => new_resource.port,
        'interface' => new_resource.interface,
        'method' => new_resource.method,
        'clientmethod' => new_resource.clientmethod,
        'log_file' => ::File.join(new_resource.log_dir, 'output.log'),
        'user_privileged' => new_resource.user_privileged,
        'user_notprivileged' => new_resource.user_notprivileged,
        'user_libwrap' => new_resource.user_libwrap,
        'compatibility' => new_resource.compatibility,
        'extensions' => new_resource.extensions,
        'connect_timeout' => new_resource.connect_timeout,
        'io_timeout' => new_resource.io_timeout,
        'srchost_rules' => new_resource.srchost_rules,
        'client_rules' => new_resource.client_rules,
        'general_rules' => new_resource.general_rules,
      })
      action :create
    end
  end
end

action :enable do
  converge_by('enable dante server') do
    service 'danted' do
      action [:enable, :start]
    end
  end
end
