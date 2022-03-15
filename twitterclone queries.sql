USE twitterclone;

# Users
SELECT user_id as 'User ID', screen_name as 'Screen Name' FROM User
ORDER BY user_id;

# User 1 Tweets + Retweets
SELECT user_id as 'User ID', screen_name as 'Screen Name', text as 'Text', tweet_time as 'Time' FROM
(
SELECT User.user_id, screen_name, text, tweet_time FROM User
JOIN Tweet ON User.user_id = Tweet.user_id
WHERE Tweet.user_id = 1
UNION
SELECT User.user_id, screen_name, text, tweet_time FROM User
JOIN Tweet ON User.user_id = Tweet.user_id
JOIN Retweet ON Tweet.tweet_id = Retweet.tweet_id
WHERE Retweet.user_id = 1
)
RESULTS ORDER BY tweet_time;

# User 1 Timeline
SELECT user_id as 'User ID', screen_name as 'Screen Name', text as 'Text', tweet_time as 'Time' FROM
(
SELECT User.user_id, screen_name, text, tweet_time FROM User
JOIN Follower ON User.user_id = Follower.User_id
JOIN Tweet ON User.user_id = Tweet.user_id
WHERE Follower.follower_id = 1
UNION
SELECT User.user_id, screen_name, text, tweet_time FROM User
JOIN Tweet ON User.user_id = Tweet.user_id
JOIN Retweet ON Tweet.tweet_id = Retweet.tweet_id
WHERE Retweet.user_id IN (SELECT user_id FROM Follower WHERE follower_id = 1)
)
RESULTS ORDER BY tweet_time;

# User 1 Following
SELECT Follower.user_id as 'User ID', screen_name as 'Screen Name' FROM User
JOIN Follower ON User.user_id = Follower.User_id
WHERE Follower.follower_id = 1;

# User 1 Following Number
SELECT Count(*) as 'Following' FROM User
JOIN Follower ON User.user_id = Follower.User_id
WHERE Follower.follower_id = 1;

# User 2 Followers
SELECT Follower.follower_id as 'User ID', (SELECT screen_name FROM User WHERE user_id = Follower.follower_id) as 'Screen Name' FROM Follower
WHERE Follower.user_id = 2;

# User 2 Follower Number
SELECT Count(*) as 'Followers' FROM Follower
WHERE Follower.user_id = 2;

# User 1 Favorited Tweets
SELECT User.user_id as 'User ID', screen_name as 'Screen Name', text as 'Text', tweet_time as 'Time' FROM User
JOIN Tweet ON User.user_id = Tweet.user_id
JOIN Favorite ON Tweet.tweet_id = Favorite.tweet_id
WHERE Favorite.user_id = 1;

# Tweet 4 Favorited Number
SELECT Count(*) as 'Favorites' FROM User
JOIN Tweet ON User.user_id = Tweet.user_id
JOIN Favorite ON Tweet.tweet_id = Favorite.tweet_id
WHERE Favorite.tweet_id = 4;

# Sample Inserts
INSERT INTO User(user_id, screen_name) VALUES(6,"Your Name");
SELECT * FROM User;

INSERT INTO Follower(follow_id, follower_id, user_id) VALUES
(8,6,1),
(9,6,2);
SELECT * FROM Follower;

INSERT INTO Tweet(tweet_id, text, tweet_time, user_id) VALUES (8,"I'm a bit late to the party!",'2020-04-27 07:10:00',6);
SELECT * FROM Tweet;

INSERT INTO Reply(reply_id, user_id, reply_text, reply_time, tweet_id) VALUES (4,6,"I've heard this one before",'2020-04-27 8:15:00',3);
SELECT * FROM Reply;

INSERT INTO Retweet(retweet_id, user_id, tweet_id) VALUES (4,6,3);
SELECT * FROM Retweet;

INSERT INTO Favorite(favorite_id, user_id, tweet_id) VALUES (7,6,3);
SELECT * FROM Favorite;

# Sample Deletes
DELETE FROM User where user_id = 6;
SELECT * FROM User;

DELETE FROM Follower where follower_id = 6;
SELECT * FROM Follower;

# Technically not necessary due to cascade
DELETE FROM Tweet where user_id = 6;
SELECT * FROM Tweet;

DELETE FROM Reply where user_id = 6;
SELECT * FROM Reply;

DELETE FROM Retweet where user_id = 6;
SELECT * FROM Retweet;

DELETE FROM Favorite where user_id = 6;
SELECT * FROM Favorite;
