bash "remove logstash old files" do
  code <<-EOC
    rm -rf #{node.robux.dirs.base_dir}/#{node.robux.dirs.scripts}/logstash.jar
    rm -rf #{node.robux.dirs.base_dir}/bin/logstash.conf
    rm -rf #{node.robux.dirs.base_dir}/bin/logstash.stop.sh
    rm -rf #{node.robux.dirs.base_dir}/bin/logstash.start.sh
  EOC
end

include_recipe "robux-logstash::install"
