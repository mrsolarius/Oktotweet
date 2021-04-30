# ReadMe Oktotweet
## Introduction
Oktotweet est un clone de twitter ecrit en ruby avec le framework Rails.
### Feature
- Gestion des utilisateurs (ajouter / modifier / supprimer un utilisateur) ;
- Authentification des Utilisateurs ;
- Possibilité d’ajout de tweets ;
- Possibilité de suppression de ses propres tweets ;
- Visualisation de l’ensemble des tweets de l’utilisateurs ;
- Un système de suivi permettant à un utilisateur connecté de suivre ou d’arrêter de suivre un
  autre utilisateur ;
- Des hashtags peuvent être ajouté aux tweets et la visualisation de ceux-ci se font
  directement dans le tweet.
  
## Installation
### Environnement
Afin de faire tourner octotweet, nous vous recommandons de posséder les dépendances suivantes :
- **ruby 2.7 ;**
- **Rails 6.0.3.1 ;**

Quant aux autres dépendances nécessaires, nous possédions les suivantes :
- **yarn 1.22.10 ;**
- **node 12.21.0 ;**

### Installation des paquets
#### Installer ruby
Mise à jour des packets :
```sh
sudo apt-get update
```

Installation des dépendances nécessaires :
```sh
sudo apt-get install curl git gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev g++ libpq-dev
```


Installer et mettre en place rbenv :
```sh
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL
```
Télécharger ruby-build plugin dans le dossier des plugins ruby de rbenv
```sh
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```
Installer ruby 2.7.0 :
```sh
  rbenv install 2.7.0
  rbenv global 2.7.0
```

la commande : "`ruby -v`" doit alors afficher la version 2.7.0

installer bundler
```sh
  gem install bundler
```

#### Installer rails
(Cette opération nécessite l'installation de ruby finalisée)
Lancer les commandes suivantes :
```sh
  gem install rails -v 6.1.3.1
  rbenv rehash
```

Enfin rails est installé :
```sh
rails -v
```

#### installer node, npm et yarn:
```sh
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - sudo apt -y install 
sudo apt -y install nodejs
sudo npm install -g npm
sudo npm install -g yarn
```
#### Lancement de octotweet :
Extraire le dossier envoyé par mails ou cloner le dépot: 
```sh
git clone https://github.com/mrsolarius/Oktotweet.git
```

Placer vous dans le dossier Oktotweet
```shell
cd Oktotweet
```

Executer les commandes suivantes :
```sh
yarn install
bundle install
rake db:migrate
rake db:seed
bundle exec rails webpacker:install:react
bin/rails server
```
Puis connectez-vous à votre navigateur avec l'adresse :
[localhost:3000](http://localhost:3000)

Attention la première connexion sera un peut long du à la compilation de webpack