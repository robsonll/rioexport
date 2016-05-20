Rioexport
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is supported by developers who purchase our RailsApps tutorials.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.5
- Rails 4.2.6

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------


Installing Ruby and Rails
-----------------------------

$ sudo apt-get update
$ sudo apt-get install curl
$ sudo apt-get install nodejs

Instalaremos agora o RVM, logo em seguida o Ruby e definir a versão padrão.

$ gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
$ source ~/.rvm/scripts/rvm
$ rvm requirements
$ rvm install ruby 2.1.1
$ rvm use ruby 2.1.1 --default

Vamos verificar as versões do Ruby e Gem.

$ ruby -v
$ gem -v

Se Tudo correu bem até aqui, vamos finalmente instalar o Rails e o Git.

$ gem install rails
$ sudo apt-get install git
$ echo "source \$HOME/.rvm/scripts/rvm" >> ~/.bashrc

MySql Server/Client
-------------------------------------

$ sudo apt install mysql-server mysql-client
$ sudo apt-get install libmysqlclient-dev

Configurando c9
---------------------

mysql-ctl install
mysql-ctl cli

* mysql change password:
    mysql -u root -p
    use mysql;
    update user set password=PASSWORD('your_new_password') where User='username';
    flush privileges;

rake db:create
rake db:migrate

* working with posgresql in c9
        # Set Up Postgresql on Cloud9 Online IDE
        
        ## Start Postgresql on Cloud9 
        
        Type `sudo service postgresql start`
        
        ## Set Up User
        
        A default Postgres installation has a user account with the following information: 
        
        Username: `username`
        
        Password: `password`
        
        There are 2 problems to solve with the Cloud9 (C9) Postgres installation:
        
        1. The Postgres on C9 doesn't have `password` as the password for the root user
        2. The Postgres on C9 is encoded in ASCII instead of UTF8
        
        To fix #1, do the following:
        
        Type `sudo sudo -u postgres psql` into the console, which will bring you into the Postgres interactive terminal
        
        Then, you type `ALTER USER postgres WITH PASSWORD 'password';`.  It should spit out `ALTER ROLE` if you did it right.
        
        To fix #2, do the following: 
        
        Copy and paste these commands into the Postgres interactive terminal one by one:
        
        `UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';`
        
        `DROP DATABASE template1;`
        
        `CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';`
        
        `UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';`
        
        `\c template1`
        
        `VACUUM FREEZE;`
        
        `UPDATE pg_database SET datallowconn = FALSE WHERE datname = 'template1';`
        
        Once your done, just type `\q` to get out of the Postgres interactive terminal
        
        ## Set Up Rails Databases
         
        Type `rake db:create:all`

Heroku Toolbelt
-------------------------

wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

* configurar as variaveis de ambiente no heroku

    $ heroku config:add ADMIN_NAME='First User'
    $ heroku config:add ADMIN_EMAIL='user@example.com' ADMIN_PASSWORD='changeme'
    $ heroku config:add GMAIL_USERNAME='myname@gmail.com' GMAIL_PASSWORD='secret'
    $ heroku config:add DOMAIN_NAME='example.com'

Problemas conhecidos
----------------------------------
- rake assets:precompile - TypeError: no implicit conversion of nil into String
    commentar config.mailer_sender in config/initilalizers/devise.rb

rails s -b $IP -p $PORT
