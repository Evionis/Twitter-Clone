-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema twitterclone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS twitterclone DEFAULT CHARACTER SET utf8 ;
USE twitterclone ;

-- -----------------------------------------------------
-- Table twitterclone.User
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.User ;

CREATE TABLE IF NOT EXISTS twitterclone.User (
  user_id INT NOT NULL,
  screen_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table twitterclone.Tweet
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.Tweet ;

CREATE TABLE IF NOT EXISTS twitterclone.Tweet (
  tweet_id INT NOT NULL,
  text VARCHAR(280) NOT NULL,
  tweet_time DATETIME NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (tweet_id),
  INDEX fk_Tweet_User1_idx (user_id ASC),
  CONSTRAINT fk_Tweet_User1
    FOREIGN KEY (user_id)
    REFERENCES twitterclone.User (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table twitterclone.Reply
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.Reply ;

CREATE TABLE IF NOT EXISTS twitterclone.Reply (
  reply_id INT NOT NULL,
  user_id INT NOT NULL,
  reply_text VARCHAR(280) NOT NULL,
  reply_time DATETIME NOT NULL,
  tweet_id INT NOT NULL,
  PRIMARY KEY (reply_id),
  INDEX fk_Reply_Tweet1_idx (tweet_id ASC),
  CONSTRAINT fk_Reply_Tweet1
    FOREIGN KEY (tweet_id)
    REFERENCES twitterclone.Tweet (tweet_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table twitterclone.Follower
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.Follower ;

CREATE TABLE IF NOT EXISTS twitterclone.Follower (
  follow_id INT NOT NULL,
  follower_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (follow_id),
  INDEX fk_Follower_User1_idx (user_id ASC),
  CONSTRAINT fk_Follower_User1
    FOREIGN KEY (user_id)
    REFERENCES twitterclone.User (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table twitterclone.Retweet
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.Retweet ;

CREATE TABLE IF NOT EXISTS twitterclone.Retweet (
  retweet_id INT NOT NULL,
  user_id INT NOT NULL,
  tweet_id INT NOT NULL,
  PRIMARY KEY (retweet_id),
  INDEX fk_Retweet_Tweet1_idx (tweet_id ASC),
  CONSTRAINT fk_Retweet_Tweet1
    FOREIGN KEY (tweet_id)
    REFERENCES twitterclone.Tweet (tweet_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table twitterclone.Favorite
-- -----------------------------------------------------
DROP TABLE IF EXISTS twitterclone.Favorite ;

CREATE TABLE IF NOT EXISTS twitterclone.Favorite (
  favorite_id INT NOT NULL,
  user_id INT NOT NULL,
  tweet_id INT NOT NULL,
  PRIMARY KEY (favorite_id),
  INDEX fk_Favorite_Tweet1_idx (tweet_id ASC),
  CONSTRAINT fk_Favorite_Tweet1
    FOREIGN KEY (tweet_id)
    REFERENCES twitterclone.Tweet (tweet_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO User(user_id, screen_name) VALUES
(1,"Noah Anderson"),
(2,"Frank Canovatchel"),
(3,"John Doe"),
(4,"Jean Doe"),
(5,"Mystery");

INSERT INTO Follower(follow_id, follower_id, user_id) VALUES
(1,1,2),
(2,1,5),
(3,2,3),
(4,2,4),
(5,3,2),
(6,4,2),
(7,5,2);

INSERT INTO Tweet(tweet_id, text, tweet_time, user_id) VALUES
(1,"Hello World!",'2020-04-25 12:20:00',1),
(2,"It's great to see the platform getting started.",'2020-04-25 12:23:00',1),
(3,"$50 Paypal",'2020-04-25 12:24:00',2),
(4,"At no additional cost to you!",'2020-04-25 12:24:50',2),
(5,"Hello all.",'2020-04-25 12:25:20',3),
(6,"Greetings everyone.",'2020-04-25 12:26:00',4),
(7,"Good to see everyone here.",'2020-04-25 12:28:30',5);

INSERT INTO Reply(reply_id, user_id, reply_text, reply_time, tweet_id) VALUES
(1,1,"I can hook you up for a 15 on this assignment!",'2020-04-25 12:25:00',3),
(2,5,"Not a chance.",'2020-04-25 12:25:20',3),
(3,4,"Good to hear.",'2020-04-25 12:27:00',4);

INSERT INTO Retweet(retweet_id, user_id, tweet_id) VALUES
(1,1,3),
(2,4,4),
(3,5,1);

INSERT INTO Favorite(favorite_id, user_id, tweet_id) VALUES
(1,1,3),
(2,1,4),
(3,4,4),
(4,5,1),
(5,5,6),
(6,5,7);