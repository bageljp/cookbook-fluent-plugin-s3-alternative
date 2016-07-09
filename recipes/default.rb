#
# Cookbook Name:: fluent-plugin-s3-alternative
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

git "/usr/local/src/fluent-plugin-s3-alternative" do
  user "#{node['fluent-plugin-s3-alternative']['user']}"
  group "#{node['fluent-plugin-s3-alternative']['group']}"
  repository "#{node['fluent-plugin-s3-alternative']['repo']['url']}"
  checkout_branch "gem-build-error"
  revision "gem-build-error"
  action :checkout
end

bash "install fluent-plugin-s3-alternative" do
  user "#{node['fluent-plugin-s3-alternative']['user']}"
  group "#{node['fluent-plugin-s3-alternative']['group']}"
  cwd "/usr/local/src/fluent-plugin-s3-alternative"
  code <<-EOC
    bundle install --path vendor/bundle
    #{node['fluent-plugin-s3-alternative']['path']['bin']}/gem build fluent-plugin-s3-alternative.gemspec
    #{node['fluent-plugin-s3-alternative']['path']['bin']}/fluent-gem install fluent-plugin-s3-alternative-0.0.1.gem
  EOC
  not_if "#{node['fluent-plugin-s3-alternative']['path']['bin']}/fluent-gem list | grep -q fluent-plugin-s3-alternative"
  notifies :restart, "service[td-agent]"
end

