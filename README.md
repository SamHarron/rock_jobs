Overview

RockJobs can help Countertop Companies track their Employee's Measurements at Different Job Locations. Each User/Employee is required to create an account or Log In with Google. The User will then be able to create/edit/delete a Location and/or create/edit/delete a Countertop Measurement taken at that Location. The User also has the ability to Update their Profile information. 

Installation

Fork and Clone this repository, and the run:
    bundle install
    rake db:migrate
    rake db:seed (Optional, to start with some data)

To start using the server run 
    rails s
    Click the link provided which will open up the application in your default browser.

To stop/kill the server
    Ctrl + c

Omniauth

    In Order to get the Google Omniauth to work properly, follow these steps.

    1. Set up an App in the Google Developer Console. 
        -complete the Oauth consent screen.

    2. Navigate to Credentials, + Create Credentials, and Oauth client ID. Then select web application as the type and enter a name.
        -Add an Authorized Redirect URIs and save/create.
        http://127.0.0.1:3000/auth/google_oauth2/callback

    3. Add a ‘.env’ file to your root directory and set the below Constants equal to your Credentials.**Also add the .env to the .gitignore file**
        GOOGLE_CLIENT_ID=YourClientID
        GOOGLE_CLIENT_SECRET=YourClientSecret

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'SamHarron'/rock_jobs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

The gem is available as open source under the terms of the MIT License.