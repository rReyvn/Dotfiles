plasma-install:
	stow --verbose --target=$$HOME/ --restow plasma

plasma-uninstall:
	stow --verbose --target=$$HOME/ --delete plasma
