RubyPlanet
======

Requirements
-----------------

* Ruby **2.5.1**
* Rails **5.2.0**

Installation
-----------------

```bash
git clone git@github.com:Mapsred/RubyPlanet.git
cd RubyPlanet
bundle install
bin/rails db:migrate RAILS_ENV=development

bin/rails server -b 0.0.0.0 -p 3000 -e development
```

Scenarios
---------

### Disconnected User

**Navigate :** At first, the user is not connected and can only see the content.
You can navigate freely and see the existing content lists or the details pages.

**Devise (User System) :** The user can connect to the website (or register) by clicking on ``Se connecter`` on the top right part of the navbar. 

 * **Connecting :** Enter your username and password to connect to the application
 * **Registering :** Click on ``Inscription`` under the form fields in the connexion page to be redirected to the registering page.
 You will need to enter an email, a password (at least 6 characters) and confirm the password before submiting.
 
### Connected User

* **Creating content :** Now that you are connected, you have more privileges. 
You can start creating content. First I recommend to create one (or more, as you see fit) ``Planets`` and ``Grades``. 
Once you are done, you can now create ``Astronauts`` and then ``Reports``.