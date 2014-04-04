puts "#{node.robux.dirs.base_dir}/app/log/logstash_#{node.robux.rails_env}.log"

template "#{node.robux.dirs.base_dir}/bin/logstash.conf" do
  source 'logstash.conf.erb'
  owner node.user
  group node.group
  mode 0775
  variables({
    :env => "#{node.robux.rails_env}",
    :hostname => "#{node.hostname}",
    :elastic_host => "#{node.logstash.elastic_host}",
    :elastic_cluster => "#{node.logstash.elastic_cluster}",
    :log_codec => "#{node.logstash.codec}",
    :log_file => "#{node.robux.dirs.base_dir}/app/log/logstash_#{node.robux.rails_env}.log"
  })
end
