# Hold onto aliases
export resugen="$HOME/dev/resugen"
export dev="$HOME/dev"
export levo="$dev/airwolf"
export dotfiles="$dev/dotfiles"
export comfort="$dev/comfort"
export rakemkv="$dev/rakemkv"
export transcode="$dev/transcode"
export bewdnyc="$dev/BEWD_NYC_6"
export bewd="$dev/bewd"
export octopress="$dev/octopress"
export blackjack="$dev/blackjack"
export ga="$HOME/ga"
export schoolkeep="$dev/schoolkeep"
export learn="$dev/learn"
export whetstone="$dev/whetstone"
export skilledup="$dev/skilledup-academy"
export sag="sudo apt-get"

# Directory Aliases
alias dev='cd $dev'
alias rsg='cd $resugen'
alias levo='cd $levo'
alias cmft='cd $comfort'
alias dot='cd $dotfiles'
alias rkv='cd $rakemkv'
alias trans='cd $transcode'
alias bclss='cd $bewdnyc'
alias bewd='cd $bewd'
alias octo='cd $octopress'
alias bjck='cd $blackjack'
alias ga='cd $ga'
alias sk='cd $schoolkeep'
alias lrn='cd $learn'
alias whet='cd $whetstone'
alias skl='cd $skilledup'

# Command Line Programs
alias txg='tar xvzf'
alias txb='tar xvjf'
alias txt='tar xvf'

# Display
alias adsp='xrandr --auto'
alias edspoff='xrandr --output eDP1 --off'
alias ldspoff='xrandr --output LVD1 -off'

# Apt
alias sag='$sag'
alias sai='$sag install'
alias saud='$sag update'
alias saug='$sag upgrade'
alias sadu='$sag dist-upgrade'
alias saar='$sag autoremove'
alias update='saud && saug -y && saar -y'
alias full-update='saud && sadu -y && saar -y'

# Git aliases
alias gwin="git shortlog -n -s"
alias gcb="git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f 3"
alias rmorig='find . -type f -name *.orig -exec rm -f {} \;'

# Bundler
alias bx='bundle exec'
alias bspec='bundle exec rspec'

# Misc Aliases
alias resp=". ~/.bash_profile"
alias ls="ls --color"
