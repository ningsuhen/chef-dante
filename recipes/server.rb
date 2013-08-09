dante_server 'server' do
  action [:install, :enable]
  log_dir node['dante']['server']['log_dir']
end
