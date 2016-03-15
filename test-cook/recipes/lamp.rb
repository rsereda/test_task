#
# Cookbook Name:: test-cook
# Recipe:: default
#
# Copyright 2016, Test for TC LTD
#
# All rights reserved - Do Not Redistribute

#Get secure credential
secure_config = data_bag_item('test_cook', 'lamp-credential')

# Install nginx and php and php-fpm 
package ['epel-release', 'nginx',  'php-fpm', 'php-mysql'  ] do
  action :install
end

template '/etc/nginx/conf.d' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0744'
end

file '/etc/ssl/server.com.key' do
  content secure_config['server.com.key']
  mode '0700'
  owner 'root'
  group 'root'
end

file '/etc/ssl/server.com.crt' do
  content secure_config['server.com.crt']
  mode '0700'
  owner 'root'
  group 'root'
end

service "nginx" do
  action :restart
end

mysql_service 'test' do
  port '3306'
  version '5.5'
  initial_root_password secure_config['mysql_passwd']
  action [:create, :start]
end


# add pplication
template '/usr/share/nginx/html' do
  source 'phpinfo.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '0744'
end



