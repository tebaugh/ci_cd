#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
User 'tdi' do
  action :create
  Comment "Test Driven Infrastructure"
  home "/home/tdi"
  manage_home true
end

package 'irssi' do
  action :install
end

directory '/home/tdi/.irssi' do 
  owner 'tdi'
  group 'tdi'
end

cookbook_file '/home/tdi/.irssi/config' do
  source 'irssi-config'
  owner 'tdi'
  group 'tdi'
end