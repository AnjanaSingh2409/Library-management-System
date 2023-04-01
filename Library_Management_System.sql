-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-10 17:09:48.498

show databases

use librarymanagement

show tables;

-- tables
-- Table: Author
CREATE TABLE Author (
    Id int NOT NULL,
    Name varchar(255) NULL,
    CONSTRAINT Author_pk PRIMARY KEY (Id)
);

-- Inserting data into Table: Author

Insert into Author Values(001, "R.N.Tagore");
Insert into Author Values(002, "Shakespeare");
Insert into Author Values(003, "Kalidas");

-- Check data in tables:
Select * from Author;

-- Table: Book
CREATE TABLE Book (
    Id int NOT NULL,
    Title varchar(255) NULL,
    Category_Id int NOT NULL,
    CONSTRAINT Book_pk PRIMARY KEY (Id)
);

-- Inserting data into Table: Book
Insert into Book Values(001,"Geetanjali",001);
Insert into Book Values(002,"The Merchant of Venice",002);
Insert into Book Values(003,"Chitra",002);
Insert into Book Values(004,"Shakuntala",002);
Insert into Book Values(005,"Bisarjan",002);

-- Check data in tables:
Select * from Book;

-- Table: Book_Author
CREATE TABLE Book_Author (
    Book_Id int NOT NULL,
    Author_Id int NOT NULL,
    CONSTRAINT Book_Author_pk PRIMARY KEY (Book_Id,Author_Id)
);

-- Inserting data into Table: Book_Author
Insert into Book_Author Values(001,001);
Insert into Book_Author Values(002,002);
Insert into Book_Author Values(003,001);
Insert into Book_Author Values(004,001);
Insert into Book_Author Values(005,001);

-- Check data in tables:
Select * from Book_Author;

-- Table: Book_Copy
CREATE TABLE Book_Copy (
    Id int NOT NULL,
    Year_Published int NULL,
    Book_Id int NOT NULL,
    Publisher_Id int NOT NULL,
    CONSTRAINT Book_Copy_pk PRIMARY KEY (Id)
);

-- Inserting data into Table:Book_Copy
Insert into Book_Copy Values(001,1913,001,001);
Insert into Book_Copy Values(002,1913,001,001);
Insert into Book_Copy Values(003,1596,002,002);
Insert into Book_Copy Values(004,1596,002,002);
Insert into Book_Copy Values(005,1913,003,001);
Insert into Book_Copy Values(006,1913,003,001);
Insert into Book_Copy Values(007,1791,004,001);
Insert into Book_Copy Values(008,1791,004,001);
Insert into Book_Copy Values(009,1912,005,001);
Insert into Book_Copy Values(010,1912,005,001);

-- Check data in tables:
Select * from Book_Copy;

-- Table: Borrower_Acount
CREATE TABLE Borrower_Acount (
    Card_no char(10) NOT NULL,
    First_name varchar(255) NULL,
    Last_name varchar(255) NULL,
    Status varchar(10) NULL,
    Email varchar(255) NULL,
    CONSTRAINT Borrower_Acount_pk PRIMARY KEY (Card_no)
);

-- Inserting data into table: Borrower_Acount
Insert into Borrower_Account Values(001,"Akshay","Kumar","Active","akshay@gmail.com");
Insert into Borrower_Account Values(002,"Bhushan","Dasar","Blocked","bhushan@gmail.com");
Insert into Borrower_Account Values(003,"Dinesh","Singh","Active","dinesh@gmail.com");
Insert into Borrower_Account Values(004,"Riya","Sharma","Blocked","riya@gmail.com");
Insert into Borrower_Account Values(005,"Sneha","Yadav","Active","sneha@gmail.com");

-- Check data in tables:
Select * from Borrower_Acount;

-- Table: Category
CREATE TABLE Category (
    Id int NOT NULL,
    Name varchar(255) NULL,
    CONSTRAINT Category_pk PRIMARY KEY (Id)
) COMMENT 'In our library, each book is assigned to a category. A book may belong to only one category';

-- Inserting data into table: Category
Insert into Category Values(001,"Poetic");
Insert into Category Values(002,"Play");
Insert into Category Values(003,"Literature");

-- Check data in tables:
Select * from Category;

-- Table: Check_Out
CREATE TABLE Check_Out (
    Id int NOT NULL,
    Start_time timestamp NULL,
    End_time timestamp NULL,
    Is_returned boolean NULL,
    Book_Copy_Id int NOT NULL,
    Borrower_Acount_Card_no char(10) NOT NULL,
    CONSTRAINT Check_Out_pk PRIMARY KEY (Id)
);

-- Inerting data into table:Check_Out
Insert into Check_Out Values(001,'2022-12-03','2023-01-10', True, 005,001);
Insert into Check_Out Values(002,'2022-12-08','2023-01-11', True, 006,005);
Insert into Check_Out Values(003,'2022-12-15','2023-01-05', True, 005,003);
Insert into Check_Out(Id, Start_time, Is_returned, Book_Copy_Id, Borrower_Acount_Card_no) Values(004,'2022-12-23', False, 005,001);

-- Updating data into table:

Update Check_Out set Book_Copy_Id = '008' where Id = '003';
Update Check_Out set Book_Copy_Id = '003' where Id = '001';

-- Check data in tables:
Select * from Check_Out;

-- Table: Hold
CREATE TABLE Hold (
    Id int NOT NULL,
    Start_time timestamp NULL,
    End_time timestamp NULL,
    Book_Copy_Id int NOT NULL,
    Borrower_Acount_Card_no char(10) NOT NULL,
    CONSTRAINT Hold_pk PRIMARY KEY (Id)
);

-- Inserting data into table: Hold
Insert into Hold Values(001,'2022-12-03','2022-12-23',005,001);
Insert into Hold Values(002,'2022-12-05','2022-12-15',008,003);
Insert into Hold Values(003,'2022-12-10','2022-12-31',001,005);

-- Check data in tables:
Select * from Hold;

-- Table: Notifications
CREATE TABLE Notifications (
    Id int NOT NULL,
    Sent_at timestamp NULL,
    Type varchar(20) NULL,
    Borrower_Acount_Card_no char(10) NOT NULL,
    CONSTRAINT Notifications_pk PRIMARY KEY (Id)
);

-- Inserting data into table: Notificatios
Insert into Notifications Values(001,'2022-12-14 10:42:13',"Book is available",003);
Insert into Notifications Values(002,'2022-12-22 13:40:13',"Book is available",001);
Insert into Notifications Values(003,'2023-01-10 09:23',"Rem: Return Book",001);

-- Check data in tables:
Select * from Notifications;

-- Table: Publisher
CREATE TABLE Publisher (
    Id int NOT NULL,
    Name varchar(255) NOT NULL,
    CONSTRAINT Publisher_pk PRIMARY KEY (Id)
);

-- Inserting data into table: Publisher
Insert into Publisher Values(001, "R.N.Tagore");
Insert into Publisher Values(002, "Shakespeare");
Insert into Publisher Values(003, "Kalidas");

-- Table: Wait_list
CREATE TABLE Wait_list (
    Borrower_Id int NOT NULL,
    Book_Id int NOT NULL,
    Borrower_Acount_Card_no char(10) NOT NULL,
    CONSTRAINT Wait_list_pk PRIMARY KEY (Borrower_Id,Book_Id)
);

-- Inserting data into Tables: Wait_list
Insert into Wait_list Values(001,003,005);

-- Check data in tables:
Select * from Wait_list;

-- foreign keys
-- Reference: Book_Author_Author (table: Book_Author)
ALTER TABLE Book_Author ADD CONSTRAINT Book_Author_Author FOREIGN KEY Book_Author_Author (Author_Id)
    REFERENCES Author (Id);

-- Reference: Book_Author_Book (table: Book_Author)
ALTER TABLE Book_Author ADD CONSTRAINT Book_Author_Book FOREIGN KEY Book_Author_Book (Book_Id)
    REFERENCES Book (Id);

-- Reference: Book_Category (table: Book)
ALTER TABLE Book ADD CONSTRAINT Book_Category FOREIGN KEY Book_Category (Category_Id)
    REFERENCES Category (Id);

-- Reference: Book_Copy_Book (table: Book_Copy)
ALTER TABLE Book_Copy ADD CONSTRAINT Book_Copy_Book FOREIGN KEY Book_Copy_Book (Book_Id)
    REFERENCES Book (Id);

-- Reference: Book_Copy_Publisher (table: Book_Copy)
ALTER TABLE Book_Copy ADD CONSTRAINT Book_Copy_Publisher FOREIGN KEY Book_Copy_Publisher (Publisher_Id)
    REFERENCES Publisher (Id);

-- Reference: Check_Out_Book_Copy (table: Check_Out)
ALTER TABLE Check_Out ADD CONSTRAINT Check_Out_Book_Copy FOREIGN KEY Check_Out_Book_Copy (Book_Copy_Id)
    REFERENCES Book_Copy (Id);

-- Reference: Check_Out_Borrower_Acount (table: Check_Out)
ALTER TABLE Check_Out ADD CONSTRAINT Check_Out_Borrower_Acount FOREIGN KEY Check_Out_Borrower_Acount (Borrower_Acount_Card_no)
    REFERENCES Borrower_Acount (Card_no);

-- Reference: Hold_Book_Copy (table: Hold)
ALTER TABLE Hold ADD CONSTRAINT Hold_Book_Copy FOREIGN KEY Hold_Book_Copy (Book_Copy_Id)
    REFERENCES Book_Copy (Id);

-- Reference: Hold_Borrower_Acount (table: Hold)
ALTER TABLE Hold ADD CONSTRAINT Hold_Borrower_Acount FOREIGN KEY Hold_Borrower_Acount (Borrower_Acount_Card_no)
    REFERENCES Borrower_Acount (Card_no);

-- Reference: Notifications_Borrower_Acount (table: Notifications)
ALTER TABLE Notifications ADD CONSTRAINT Notifications_Borrower_Acount FOREIGN KEY Notifications_Borrower_Acount (Borrower_Acount_Card_no)
    REFERENCES Borrower_Acount (Card_no);

-- Reference: Wait_list_Book (table: Wait_list)
ALTER TABLE Wait_list ADD CONSTRAINT Wait_list_Book FOREIGN KEY Wait_list_Book (Book_Id)
    REFERENCES Book (Id);

-- Reference: Wait_list_Borrower_Acount (table: Wait_list)
ALTER TABLE Wait_list ADD CONSTRAINT Wait_list_Borrower_Acount FOREIGN KEY Wait_list_Borrower_Acount (Borrower_Acount_Card_no)
    REFERENCES Borrower_Acount (Card_no);

-- Questions:-

use librarymanagement

-- 1. How many borrowers are there in the dataset?
Select count(*) from Borrower_Acount;

-- 2. How many books is issued per card in the Check_out table?
Select distinct(Borrower_Acount_Card_no), count(Book_Copy_Id)  from Check_Out group by Borrower_Acount_Card_no;

-- 3. Which book has highest number of borrowers?
-- select * from Check_Out;
-- Select * from Book;
-- Select * from Book_Copy;
-- Select Book_Copy_Id, Borrower_Acount_Card_no from Check_Out;
select distinct(B.Id) as Book_Id, Title, count(C.Id) as Copy_Id, count(Borrower_Acount_Card_no) as card_no from Book B left join Book_Copy C on B.Id=C.Book_Id left join Check_Out on Book_Copy_Id=C.Id group by B.Id;

-- 4. Which borrower has the maximum books?
Select distinct(Borrower_Acount_Card_No), count(Book_Copy_Id) from Check_Out group by Borrower_Acount_Card_No;

-- 5. Which borrower has not returned the book?Provide the book_copy_id which is yet to be return.
Select Borrower_Acount_Card_no, Book_Copy_Id from Check_Out where Is_returned= False;

-- 6. Which author wrote the maximum no of books?
Select A.Id as Author_Id, Name as Author_Name, count(Book_Id) from Author A left join Book_Author B on A.Id=B.Author_Id group by A.Id;

-- 7. Which category has the maximum number of books?
Select distinct(C.Id) as category_Id, Name as Category_Name, Count(B.Category_Id) from Category C left join Book B on C.Id=B.Category_Id group by C.Id;

-- 8.  How many Notification has sent by the Libraray management System?
select count(*) from Notifications;

-- End of file.

