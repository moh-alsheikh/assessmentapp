# README

This README would normally document whatever steps are necessary to get the
assessment application up and running.

* Ruby version 3.1.2

* Rails version 7.0.2 Hotwire

* Frontend framework tailwindcss

* System dependencies
  
  - devise
  - redis

* Configuration

* Database creation

  `rails db:setup'

* How to run the test suite

* Deployment instructions

* API instructions
  - #### USER LOGIN & GET THE TOKEN

    `curl -v -H "Accept: application/json" -H "Content-type: application/json" -d ' {"email":"teacher@example.com","password":"12345678"}'  http://localhost:3000/api/v1/login.json`
  - #### GET ALL QUIZZES

    `curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d ' {"user_token":"zeC4q6z9c5xhaU_xGdXj"}' http://localhost:3000/api/v1/quizzes`
  - #### GET QUIZ

    `curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d ' {"user_token":"zeC4q6z9c5xhaU_xGdXj"}' http://localhost:3000/api/v1/quizzes/46`
  - #### POST QUIZ ANSWER

    `curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"user_token":"zeC4q6z9c5xhaU_xGdXj", "user_id": 1, "quiz_question_id": 53, "quiz_question_option_id": 67 }' http://localhost:3000/api/v1/quiz_user_answers`
  - #### LOGOUT THE USER

    `curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"user_token":"3raB1HVVDDG9Hju9Szxs"}' http://localhost:3000/api/v1/logout`

