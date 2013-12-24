["openjdk-7-jdk","openjdk-7-jre"].each do |pack|
  package pack
end

cookbook_file "#{node.robux.dirs.base_dir}/#{node.robux.dirs.scripts}/logstash.jar" do
  source "logstash.jar"
  owner node.user
  group node.group
  mode "0644"
  ignore_failure true
end
