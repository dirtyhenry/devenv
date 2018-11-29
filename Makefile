install:
	cp terminal/.bash_profile ~/.bash_profile
	cp terminal/.bash_profile ~/.oh-my-zsh/custom/mick-custo-READONLY.zsh
	./git/install-gitconfig
	ln -f -s `pwd`/git/git-catchup ~/bin/
	ln -f -s `pwd`/git/git-commit-workflow ~/bin/
	ln -f -s `pwd`/git/git-readme ~/bin/
