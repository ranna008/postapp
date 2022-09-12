# To run the application:
- after cloning or downloading the application file , open the system terminal .
- in terminal type run below command to add all the required gems present in the gem file.
-  "bundle install" 
- now, type below command to migrate all the tables to database.
-  "db:migrate"
- once it is done type below command in the command line to run in the local host
-   "Rails s" 
- so now on the ui side register yourself and then login .
- post login in the home click on post listings to see all the posts
- only the logged in user has the ability to create ,edit and delete his own posts ,he dont have access to edit or delete other User posts.
- only the logged in user has the ability to create ,edit and delete his own details ,he dont have access to edit or delete other User details.
- only users can create posts others can just see(not logged in)
# Ruby version
ruby "3.0.4"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
