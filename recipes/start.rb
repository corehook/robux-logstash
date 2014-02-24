bash "starting logstash" do
  ignore_failure true
  user node.user
  group node.group
  code <<-EOC
    cd #{node.robux.dirs.logstash}
    chmod +x start.sh
    ./start.sh
    sleep 10
  EOC
end
