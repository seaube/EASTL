# WARNING: this is for publishing to Seaubes internal bazel registry. Your experience may vary.
def main [] {
	let bazel_registry_dir = $env.FILE_PWD | path join '../bazel_registry';

	if not ($bazel_registry_dir | path exists) {
		print $"WARN: ($bazel_registry_dir) does not exist - will not update bazel registry";
		return
	}

	cd $bazel_registry_dir;
	git pull;
	nu 'tools/add_module.nu' 'git@github.com:seaube/EASTL.git';
}
