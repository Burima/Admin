create table HouseReviews
(
HouseReviewID int IDENTITY(1,1) NOT NULL,
UserID int NOT NULL,
HouseID int NOT NULL,
Comments varchar(500),
Rating decimal(3,2),
CONSTRAINT PK_HouseReview PRIMARY KEY (HouseReviewID),
CONSTRAINT FK_HouseReviews_UserID FOREIGN KEY (UserID)
REFERENCES Users(UserID),
CONSTRAINT FK_HouseReviews_HouseID FOREIGN KEY (HouseID)
REFERENCES Houses(HouseID),
)