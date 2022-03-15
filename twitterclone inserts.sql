USE twitterclone;

INSERT INTO User(user_id, screen_name) VALUES
(1,"Noah Anderson"),
(2,"Frank Canovatchel"),
(3,"John Doe"),
(4,"Jean Doe"),
(5,"Mystery");

SELECT * FROM User;

INSERT INTO Follower(follow_id, follower_id, user_id) VALUES
(1,1,2),
(2,1,5),
(3,2,3),
(4,2,4),
(5,3,2),
(6,4,2),
(7,5,2);

SELECT * FROM Follower;

INSERT INTO Tweet(tweet_id, text, tweet_time, user_id) VALUES
(1,"Hello World!",'2020-04-25 12:20:00',1),
(2,"It's great to see the platform getting started.",'2020-04-25 12:23:00',1),
(3,"$50 Paypal",'2020-04-25 12:24:00',2),
(4,"At no additional cost to you!",'2020-04-25 12:24:50',2),
(5,"Hello all.",'2020-04-25 12:25:20',3),
(6,"Greetings everyone.",'2020-04-25 12:26:00',4),
(7,"Good to see everyone here.",'2020-04-25 12:28:30',5);

SELECT * FROM Tweet;

INSERT INTO Reply(reply_id, user_id, reply_text, reply_time, tweet_id) VALUES
(1,1,"I can hook you up for a 15 on this assignment!",'2020-04-25 12:25:00',3),
(2,5,"Not a chance.",'2020-04-25 12:25:20',3),
(3,4,"Good to hear.",'2020-04-25 12:27:00',4);

SELECT * FROM Reply;

INSERT INTO Retweet(retweet_id, user_id, tweet_id) VALUES
(1,1,3),
(2,4,4),
(3,5,1);

SELECT * FROM Retweet;

INSERT INTO Favorite(favorite_id, user_id, tweet_id) VALUES
(1,1,3),
(2,1,4),
(3,4,4),
(4,5,1),
(5,5,6),
(6,5,7);

SELECT * FROM Favorite;
