# AZCrowdfunding

This repository contains the work of Ángeles Aldunate and Alfonso Zúñiga, who were given the task of creating a 
crowdfunding web application for the Web Technologies course dictated in the fall of 2018.What follows is a simple 
report on the progress that the team has achieved in the third assignment, alongside a list of possible bugs that the 
user might encounter along the way.

## Progress

For this assignment every feature that was solicited has been integrated, including the implementation of all forms 
necessary to populate the database, access to special pages for admin users to administrate the website, views 
dedicated to show relevant information in an orderly fashion using bootstrap, such as the user profile, project pages, 
projects search, etc.

Also, the usage of the paperclip gem allows the user to be able to download projects and users photos from their main 
pages. 

A notification is presented to the user every time an action is completed, indicating if the result was successful.

A basic version of the funding process was implemented, in which the user contributes to the project or finances a 
promise and the sum is automatically added to the project collected amount. Further improvements will come in future 
assignments.

And finally, an admin user can now mark a project as outstanding, and this will be shown in the carousel present in 
the home page. Also, in the admin users page, an admin can now designate a user as admin.

## Possible Bugs

As the team is still learning, the user may encounter a bug or two along the way. This may include (but shouldn't after 
the intense debugging the team has made) dead links, buttons with routes wrongly specified, the site crushing when faced
with malicious input, etc.
