#
# Cookbook Name:: webserver
# Recipe:: lb
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['webserver']['lb']['config_to_remove'].each do |configs|
  file configs do
    action :delete
  end
end

template 'load-balancer.conf' do
  path   "#{node['nginx']['dir']}/conf.d/load-balancer.conf"
  source 'load-balancer.conf.erb'
  notifies :reload, 'service[nginx]', :delayed
  mode '0644'
  variables({
    app_nodes: node['webserver']['lb']['app_nodes']
  })
end
