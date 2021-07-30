# Tea Subscription Service


[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

# Table of contents

- [Usage](#usage)
- [Installation](#installation)
- [Contributing](#contributing)


# Usage
Tea Subscription is the backend engine of a subscription site site.  The app exposes and designs API endpoints to perform A customer will be abale to add a subscription to their account, deactivate an active subscription, and see all of their subscriptions.

## Subscription
1. Return all subscriptions of a specific customer;
 * GET `/api/v1/customers/:customer_id/subscriptions`
2. Return a specific subscription
 * GET `/api/v1/customers/:customer_id/subscriptions/:id`
3. Cancel or Reactivate a subscription
 * PATCH `/api/v1/customers/:customer_id/subscriptions/:id`

[(Back to top)](#table-of-contents)

## Local Install
1. Install Ruby (preferably, version >= 2.5.3)
2. clone repo to your local
3. run `bundle install`
4. run `rake db:{drop,create,migrate,seed}`
5. run `rails db:schema:dump`
6. run `rails s`
7. hit endpoints either from your browser or postman

### Run in Postman
From your terminal, follow the Local Installation, fork the Tea Subscription Collection, and hit run!
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/15385541-9c35e3bf-6002-4d3d-9969-0f3e66e346d7?action=collection%2Ffork&collection-url=entityId%3D15385541-9c35e3bf-6002-4d3d-9969-0f3e66e346d7%26entityType%3Dcollection%26workspaceId%3Dec3278fc-7240-4f76-b3a2-082ea0fa64ae)


# Contributing

[(Back to top)](#table-of-contents)

* Thank you to Turing School of Software and Design for the inspiration and direction in building this application
* Developed by Brisa Garcia Gonzales
  + [Git Hub](https://github.com/brisag) 
  + [LinkedIn](https://www.linkedin.com/in/brisa-garcia/) 

