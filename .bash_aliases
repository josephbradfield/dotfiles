#laravel aliases
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias mfs='./vendor/bin/sail artisan migrate:fresh --seed'
alias log='tail -f storage/logs/laravel.log'
alias vapor='vendor/bin/vapor '
alias pint='vendor/bin/pint'


alias grep='grep --color '

#docker aliases
alias dc='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build'
alias dcb='docker-compose up -d --build'
alias dcreset='docker-compose down && docker-compose up -d --build'
alias dcexec='docker-compose exec'
alias dcbash='docker-compose exec web /bin/bash'
