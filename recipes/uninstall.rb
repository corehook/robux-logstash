# install jdk and logstash.jar file
["openjdk-7-jdk","openjdk-7-jre"].each do |pack|
  package pack do
    action :remove
  end
end

bash "remove files" do
  ignore_failure true
  user node.user
  group node.group
  code <<-EOC
    sudo rm -rf #{node.robux.dirs.base_dir}/#{node.robux.dirs.scripts}/logstash.jar
    sudo rm -rf #{node.robux.dirs.base_dir}/bin/logstash.*
  EOC
end

include_recipe "robux-logstash::stop"
