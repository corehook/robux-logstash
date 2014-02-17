bash "starting logstash" do
  ignore_failure true
  user node.user
  group node.group
  code <<-EOC
    cd #{node.robux.dirs.base_dir}/bin/
    chmod +x logstash.start.sh
    bash logstash.start.sh
    sleep 10
  EOC
end
