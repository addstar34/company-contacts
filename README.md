# README

"Build a Rails app which has companies and each company can have multiple contacts. Add the ability for a contact to be related to any other contact in that company.”

Tech Requirements:

* Ruby (>= 2.3.1), Rails, Postgresql

Features:

* Can create multiple companies
* From within a company can create multiple contacts
* Contacts can create relationships with other contacts (only within the same company)
* Relationships use callbacks to create/destroy the inverse relationship in the database
* Contacts can only destroy relationships if they are apart of that relationship
* Dependent destroy for companies and contacts so deleting a company will delete all contacts and all relationships
