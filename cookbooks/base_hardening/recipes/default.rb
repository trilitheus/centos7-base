#
# Cookbook Name:: base_hardening
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
case node['platform_family']
when 'rhel'
  include_recipe 'base_hardening::centos'
end
