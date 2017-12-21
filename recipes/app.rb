#
# Cookbook Name:: webserver
# Recipe:: app
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file 'KroolCountry.png' do
  path '/usr/share/nginx/html/KroolCountry.png'
  source 'KroolCountry.png'
  mode '0644'
end

template 'index.html' do
  path   '/usr/share/nginx/html/index.html'
  source 'index.html.erb'
  mode '0644'
  variables({
    servername: node['hostname']
  })
end
