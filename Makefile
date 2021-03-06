prefix ?= /usr/local
bindir = $(prefix)/bin

install:
	cp terminal/.bash_profile ~/.bash_profile
	cp terminal/.bash_profile ~/.oh-my-zsh/custom/mick-custo-READONLY.zsh

	install git/git-catchup "$(bindir)/git-catchup"
	install git/git-catchup-2 "$(bindir)/git-catchup-2"
	install git/git-commit-workflow "$(bindir)/git-commit-workflow"
	install git/git-fix-lint.rb "$(bindir)/git-fix-lint"
	install git/git-hobby "$(bindir)/git-hobby"
	install git/git-readme "$(bindir)/git-readme"
	install git/git-rewrite-author "$(bindir)/git-rewrite-author"

	./git/install-gitconfig

	install bin/open-in-studio-code.sh "$(bindir)/opencode"

open: 
	open . -a 'Visual Studio Code'