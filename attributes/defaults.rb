node.default[:hostname] = node.hostname
node.default[:project_dir] = "#{node.robux.dirs.base_dir}/#{node.robux.dirs.app}"
node.default[:scripts_dir] = "#{node.robux.dirs.base_dir}/#{node.robux.dirs.scripts}"
