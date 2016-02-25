source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh



# bundles from oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle rsync
antigen bundle python
#antigen bundle virtualenvwrapper
antigen bundle node
antigen bundle npm
antigen bundle rake
antigen bundle rvm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle command-not-found
antigen bundle history
antigen bundle tmux
antigen bundle vundle
antigen bundle sprunge
antigen bundle fabric

antigen-theme norm
antigen-apply

