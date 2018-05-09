#
# Cookbook:: haproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'update_package' do
  action :update
end

package 'haproxy' do
  action :install
end


#file '/etc/haproxy/haproxy.cfg' do
#  content IO.read('/etc/haproxy.haproxy.org.cfg')
#  owner 'root'
#  group 'root'
#  mode '0644'
#  action :create
#end

cookbook_file '/etc/haproxy/haproxy.cfg' do
  source '/etc/haproxy/haproxy.org.cfg'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'cfg file configurstion' do
  command 'sed -i /errorfile 504 *504.http/r proxy.erb' /etc/haproxy/haproxy.cfg
  action :run
end

service 'haproxy' do
  action :start
end

