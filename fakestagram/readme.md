# what goes in to instagram?


1.) User names? 
2.) Photos? - For... intents and purposes we just work with url's
3.) likes?  1 person, 1 like. 
4.) HashTags.
5.) followers.
6.) following.
7.) Comments.

##Try and write a schema! 

Create table Users (id, username, created_at)
Creat table photos (id, photo, like_id, user_id, hashtag, comment_id)
comments (id, user_id, comment, photo_id)
Followers (id. )

## Here's the Schema! 
Users - ID, Username, Created Time. 
Photos - id, image, users id, created time,
Comments - id, Comment, comment-time, photo_id, user_id

Likes - id, photo_id, user_id(unique) 

-- Relationship Troubles

Follows

follower_id, followee_id, Created_at