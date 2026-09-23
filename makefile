config-install:
	stow --verbose --target=$$HOME/ --restow configs

config-uninstall:
	stow --verbose --target=$$HOME/ --delete configs
