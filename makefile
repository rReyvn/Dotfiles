plasma-install:
	stow --verbose --target=$$HOME/ --restow configs

plasma-uninstall:
	stow --verbose --target=$$HOME/ --delete configs
