ssh-add -D >/dev/null 2>&1 ; ssh-add -K >/dev/null 2>&1
export CLICOLOR=1

if [ -f ~/.profile ]; then
  source ~/.profile
fi
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

alias ssh='sshrc'
alias lg_vagrant='VM_MEMORY_GB=16 VM_CPU_COUNT=4 vagrant'
alias md_vagrant='VM_MEMORY_GB=8 VM_CPU_COUNT=2 vagrant'
alias vagrant_destroy='VAGRANT_IGNORE_TRIGGERS=true vagrant destroy'
alias aws_login='aws sso login --profile demos'
alias clear_branches="git branch | grep 'dev_\|qa_' | xargs -L1 git branch -D"
alias flush="sudo pkill -HUP -x mDNSResponder"
alias ll="ls -alhp"
alias grep='grep --color=always'
alias cc='ddev drush ev "drupal_flush_all_caches();" ; ddev drush cr'
alias addrole="ddev drush user:role:add 'administrator' islandora"
alias BI='ddev drush migrate:batch-import --user=1';
alias BIT='ddev drush migrate:batch-import --user=1 --group=isi__test_ingest';
alias RB='ddev drush migrate:rollback --user=1';
alias RBT='ddev drush migrate:rollback --user=1 --group=isi__test_ingest';
alias MR='ddev drush migrate-reset';
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
