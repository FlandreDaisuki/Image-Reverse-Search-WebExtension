LOCALE_FILES := $(wildcard _locales/*/*)
JSCODE := options/options.js background.js

install-npm-tools:
	npm -g web-ext eslint prettier

install-vscode-tools:
	@code --install-extension dbaeumer.vscode-eslint
	@code --install-extension esbenp.prettier-vscode

lint:
	@prettier --config .prettierrc --write $(LOCALE_FILES) $(JSCODE)
	@eslint --fix $(JSCODE)

dev:
	@web-ext run --firefox $(shell which firefox) --browser-console --start-url about:addons

dev-en:
	@web-ext run --firefox $(shell which firefox) --browser-console --pref general.useragent.locale=en-GB --start-url about:addons
