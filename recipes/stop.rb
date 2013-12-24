bash "stopping logstash" do
  ignore_failure true
  user node.user
  group node.group
  code <<-EOC
    cd #{node.robux.dirs.base_dir}/bin
    chmod +x logstash.stop.sh
    ./logstash.stop.sh
  EOC
end
