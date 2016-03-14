#
# Cookbook Name:: test-cook
# Recipe:: default
#
# Copyright 2016, Thomas_Cook
#
# All rights reserved - Do Not Redistribute


package ['java-1.7.0-openjdk',  'tomcat'   ] do
  action :install
end


remote_file /usr/share/tomcat/webapps/jencins.war do
  source "http://mirrors.jenkins-ci.org/war-rc/2.0/jenkins.war"
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create_if_missing
end

service "tomcat" do
  action :restart
end


execute 'expect script' do
  command 'iptables -A INPUT -p tcp -m tcp --dport 8080 -j DROP'
end




