# install jdk and logstash.jar file
include_recipe "robux-logstash::install_packages"
include_recipe "robux-logstash::write_config"

puts "Write start and stop scripts"
template "#{node.robux.dirs.base_dir}/bin/logstash.start.sh" do
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

template "#{node.robux.dirs.base_dir}/bin/logstash.stop.sh" do
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
