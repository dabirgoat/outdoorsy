# README

Outdoor.sy

The Outdoor.sy app takes in user data and displays it back, with certain
optional ordering parameters.

* Ruby version : 3.1.2 (https://gorails.com/setup/osx/12-monterey)
* Rails version : 7.0.2.4 (^)

* Database creation & population

    -To persist data in PostgresSQL, we can use a few Rakefile commands built
     into Rails:

        //Navigate to wanderlust directory
        cd wanderlust

        //Drops any current instances of databases specified in ./config/database.yml
        rake db:drop

        //Creates databases as specified in ./config/database.yml
        rake db:create

        //Migrates existing schema, see ./db/migrate/ & ./db/schema.rb 
        rake db:migrate 

        //Populates our new databases with seed data from our input files, see ./db/seeds.rb
        rake db:seed 

* Displaying data

    -Now that we have data persisted in our database, we can run the getUsers() function 
     implemented in the OutdoorsyHelpers class in ./app/helpers/

    -We will be running our commands in rails console, so the first step is to initialize it:

        rails console
    
    -Next, we must instantiate an instance of OurdoorsyHelpers and assign it to a variable:

        helper = OutdoorsyHelpers.new
    
    -Finally, we can call our function in one of three ways:

        //Display all users stored in the table:
        helper.getUsers() 

        //Display all users sorted by full name in ascending order:
        helper.getUsers("name")

        //Display all users sorted by vehicle type in ascending order:
        helper.getUsers("vehicle")

* Retrospective

    This was my first time using Ruby on Rails, I enjoyed learning the basics quite a bit!
    In a production setting, the database as well as the application would likely be hosted
    on some sort of cloud provider. In this case I would likely leverage environment variables
    and secret keys to auth into the database instead of hosting it locally. Additionally, we would
    likely be using something like PostgreSQL instead of sqlite3.