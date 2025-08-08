local jdtls = require("jdtls")

local home = os.getenv("HOME")
local java_home = "/usr/lib/jvm/java-21-openjdk-21.0.8.0.9-1.el9.x86_64"

local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "build.gradle", "pom.xml", ".classpath" })
local lib_jars = vim.fn.glob(root_dir .. "/lib/*.jar", true, true)
-- All StarCCM+ JARs (recursively)
-- local starccm_jars = vim.fn.glob(
-- 	"/smsoft/starccm/18.06.007-R8/STAR-CCM+18.06.007-R8/star/lib/java/platform/modules/ext/*.jar",
-- 	true,
-- 	true
-- )

local config = {
	cmd = {
		java_home .. "/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux", -- mac: config_mac
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,

	settings = {
		java = {
			configuration = {
				sourcePath = { "src" },
			},
			project = {
				referencedLibraries = lib_jars,
			},
		},
	},
}
-- print("Using referenced libraries:")
-- print(vim.inspect(starccm_jars))

jdtls.start_or_attach(config)
