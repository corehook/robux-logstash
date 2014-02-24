# install jdk and logstash.jar file
["openjdk-7-jdk","openjdk-7-jre"].each do |pack|
  package pack
end

directory "#{node.robux.dirs.logstash}" do
  recursive true
  owner node.user
  group node.group
  action :create
end

cookbook_file "#{node.robux.dirs.logstash}/logstash.jar" do
  source "logstash.jar"
  owner node.user
  group node.group
  mode "0644"
  ignore_failure true
end

template "#{node.robux.dirs.logstash}/logstash.conf" do
  source 'logstash.conf.erb'
  owner node.user
  group node.group
  mode 0775
  variables({
    :env => "#{node.robux.rails_env}",
    :hostname => "#{node.hostname}",
    :elastic_host => "#{node.logstash.elastic_host}",
    :elastic_port => "#{node.logstash.elastic_port}",
    :elastic_cluster => "#{node.logstash.elastic_cluster}",
    :log_codec => "#{node.logstash.codec}",
    :log_file => "#{node.logstash.log_file}"
  })
end

template "#{node.robux.dirs.logstash}/start.sh" do
  source 'logstash.start.sh.erb'
  owner node.user
  group node.group
  ignore_failure true
  variables({
    :config_file => "logstash.conf",
    :log_file => "logstash.log",
    :jar_file => "logstash.jar"
  })
end

template "#{node.robux.dirs.logstash}/stop.sh" do
  source 'logstash.stop.sh.erb'
  owner node.user
  group node.group
  ignore_failure true
  variables({
    :config_file => "logstash.conf",
    :log_file => "logstash.log",
    :jar_file => "logstash.jar"
  })
end
