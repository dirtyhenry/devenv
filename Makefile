prefix ?= /usr/local
bindir = $(prefix)/bin

install:
	cp terminal/.bash_profile ~/.bash_profile
	cp terminal/.bash_profile ~/.oh-my-zsh/custom/mick-custo-READONLY.zsh

	install git/git-catchup "$(bindir)/git-catchup"
	install git/git-commit-workflow "$(bindir)/git-commit-workflow"
	install git/git-readme "$(bindir)/git-readme"

	./git/install-gitconfig
