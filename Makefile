prefix ?= /usr/local
bindir = $(prefix)/bin

install:
	cp terminal/.bash_profile ~/.bash_profile
	cp terminal/.bash_profile ~/.oh-my-zsh/custom/mick-custo-READONLY.zsh

	install git/git-catchup "$(bindir)/git-catchup"
	install git/git-commit-workflow "$(bindir)/git-commit-workflow"
	install git/git-fix-lint.rb "$(bindir)/git-fix-lint"
	install git/git-readme "$(bindir)/git-readme"

	./git/install-gitconfig

open: 
	open -a 'Visual Studio Code'