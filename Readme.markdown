# ERD

Idea - Similar to a forum thread
  - one to many memberships
  - one to many likes
  - one to many comments

  CRUD
  - show
  - new
  - create
  - destroy
  - index




User - Integrated with Devise gem
  - one to many memberships
  - one to many ideas - as the owner
  - one to many comments - as the author
  CRUD
  - create
  - destroy

Comments - Many of this will be posted on one idea board
  - many to one idea

# ERD - Association models

Memberships - this is purely an association model
  - many users to many ideas

Likes - this is purely an association model
  - many users to many ideas