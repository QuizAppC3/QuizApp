# README

## Einmalig:
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev
sudo systemctl start postgresql

export DB_USERNAME=<euer wsl username>
export DB_PASSWORD=<beliebiges passwort>

sudo -u postgres createuser <euer wsl username> --superuser --pwprompt

export GEM_HOME="$HOME/.gem"

rails db:create

rails db:migrate

rails server


## Jedes mal wenn lokal deployed werden soll:


export DB_PASSWORD=<beliebiges passwort>

export GEM_HOME="$HOME/.gem"

rails server
