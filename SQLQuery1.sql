CREATE TABLE Publisher_tble (
  PublisherID INT NOT NULL,
  publishrename VARCHAR(50),
  PRIMARY KEY (PublisherID)
);

CREATE TABLE Category_tble (
  CategoryID INT NOT NULL,
  CategoryName VARCHAR(50),
  PRIMARY KEY (CategoryID)
);

CREATE TABLE Book_tble (
  BookID INT NOT NULL,
  Bookname VARCHAR(50),
  PublisherID INT NOT NULL,
  authourID INT NOT NULL,
  categoryID INT NOT NULL,
  BookPrice INT NOT NULL,
  PRIMARY KEY (BookID)
);

CREATE TABLE Student_tble (
  StudentID INT NOT NULL,
  StudenttName VARCHAR(50),
  PRIMARY KEY (StudentID)
);

CREATE TABLE Loan_tble (
  LoanID INT NOT NULL,
  StudentID INT NOT NULL,
  BookId INT NOT NULL,
  Date_of_Returned DATE NOT NULL,
  PRIMARY KEY (LoanID)
);

CREATE TABLE Author_tble (
  AuthorID INT NOT NULL,
  author_name VARCHAR(50),
  PRIMARY KEY (AuthorID)
);

 -- insert statements

insert into Author_tble  values (205,'William Shakespeare')
insert into Author_tble  values (206,'john Milton')

insert into Student_tble values (1,'Ali')
insert into Student_tble values (2,'Mohamed')

insert into Category_tble values (20,'novel')
insert into Category_tble values (30,'novel')


insert into Publisher_tble  values (11,'Amazon')
insert into Publisher_tble values (22,'PengunBook')

insert into Book_tble    values (211,'Four tragedies',11,205,20,150)
insert into Book_tble    values (213,'Lycidas',22,206,30,250)

insert into Loan_tble values (12,1,211,'7-8-2020')
insert into Loan_tble values (13,2,213,'8-8-2020')
--------------------------------
 
 --(1) How we can Returns a value if a condition is more, or another value if a condition is Less
 SELECT BookID, authourID, IIF(bookID>100, 'MORE', 'LESS')
FROM Book_tble;

 --(2)how Return the sum of the "bookprice" field in the "Book" table:
select sum (BookPrice) from Book_tble

 ----(3)how  the return to last entity  of the "loanID" field in the "Loan" table:
select Max (loanId) from Loan_tble

---(4) how  the return to first entity  of the "Date_of_Returned" field in the "loan" table:
select MIn (Date_of_Returned) from Loan_tble

---(5) how to Adds strings // how use concat 
select  concat (Bookname,' reiad library')  from Book_tble where publisherID=22

--- (6)to Return the average value for the "BookPrice" column in the "Book" table:
select AVG (BookPrice) from Book_tble

--(7) how to Return the number of categoryName in the "Category" table:
select count (CategoryName) from Category_tble

---(8)how to Returns the length of a string for book name in book table ?
SELECT LEN (Bookname) 
from Book_tble

---(9) How to extract a number of characters from a string (starting from left) from the student table
SELECT LEFT (StudenttName, 2) AS studenttName
FROM Student_tble;

--(10) how to  Converts a string to lower-case
SELECT LOWER(author_name) AS Lowerauthor_name
FROM Author_tble;

--(11) how to  Converts a string to upper-case
SELECT upper (author_name) AS upperauther_name
FROM Author_tble;

--(12) how to Returns the Unicode value for the first character of the input expression?
SELECT UNICODE(StudenttName) AS UnicodeStudenttName
FROM Student_tble;

--(13)how to Return the ASCII value of the first character in "CategoryName":
 SELECT ASCII(CategoryName) AS NumCodeOfFirstChar
FROM Category_tble;

--(14) how to Extract  3 characters from the "StudenttName" column, starting in position 1?
SELECT SUBSTRING(StudenttName, 1, 3) AS ExtractString
FROM Student_tble;

--(15) how Extract 5 characters from the text in the "Author Name" column (starting from right)?
SELECT RIGHT(author_name, 10) AS ExtractString
FROM Author_tble;

--(16) how to Reverse the text in BookName?
SELECT REVERSE(Bookname)
FROM Book_tble;

--(17)how to Repeat the text in publishername two times? 
SELECT REPLICATE(publishrename, 2)
FROM Publisher_tble;

--(18) how to Extract 5 characters from the text in the "Booktable" column (starting from left) ?
SELECT LEFT(Bookname,5 ) AS ExtractString
FROM Book_tble;

--(19) How we can Returns a value if a condition is more, or another value if a condition is Less? 
SELECT BookPrice, authourID, IIF(bookPrice>200, 'MORE', 'LESS')
FROM Book_tble;

SELECT LOWER(StudenttName) AS Lowerstudentname
FROM Student_tble;
 ----------------------------------------------------------------------------------

 --	Select Statements using Sub Query 

 select  BookID,Bookname,PublisherID,categoryID,authourID,BookPrice
 from  Book_tble
 where BookID IN (select BookID from Book_tble where BookID=211)
order by 
Bookname;


select LoanID 
from Loan_tble
where LoanID in (select LoanID from Loan_tble where LoanID>12);


select Bookname,
 (select AVG(BookPrice)from Book_tble) 
 from Book_tble

 SELECT * 
   FROM Publisher_tble
   WHERE PublisherID IN (SELECT PublisherID
         FROM Publisher_tble 
         WHERE PublisherID = 22) ;


---Select Statements using Count and Group Functions --

select StudentID,COUNT(*) from Student_tble
group by StudentID

select count (Book_tble.categoryID),author_name
from   Book_tble join Category_tble
on Book_tble.categoryID=Category_tble.CategoryID
join Author_tble
on  Book_tble.authourID=Author_tble.AuthorID
group by author_name


----- Select Statements using Different Joins 

select BookID,Bookname from Book_tble

select bookname,author_name
from   Book_tble,Author_tble
where Book_tble.authourID=Author_tble.AuthorID

select bookname,categoryName,author_name
from   Book_tble,Category_tble,Author_tble
where Book_tble.categoryID=Category_tble.CategoryID
and Book_tble.authourID=Author_tble.AuthorID

select bookname,categoryName,author_name
from Book_tble join Category_tble 
on Book_tble.categoryID=Category_tble.CategoryID
join Author_tble
on Book_tble.authourID=Author_tble.AuthorID

select * from Book_tble  right join  Category_tble
on Book_tble.categoryID=Category_tble.CategoryID

select * from  Category_tble left join  Book_tble
on Book_tble.categoryID=Category_tble.CategoryID

select * from  Category_tble left join  Book_tble
on Book_tble.categoryID=Category_tble.CategoryID
where BookID is not  null 

select * from Loan_tble full join Student_tble
on Student_tble.StudentID=Student_tble.StudentID

select * from Loan_tble self join Student_tble
on Student_tble.StudentID=Student_tble.StudentID

SELECT Book_tble.BookID
FROM Book_tble

 ---  update 

 update Author_tble set author_name='Ahmed shawky'
 where author_name='William Shakespeare'

 update Category_tble set CategoryName='film'
 where CategoryName='novel'

 update Publisher_tble set publishrename='Egybest'
 where publishrename='Amazon'
 
 update Student_tble set StudenttName='Ahmed'
 where StudenttName='Ali'

 update Loan_tble set LoanID=14
 where LoanID=12


----- delet

delete from Loan_tble
where LoanID=14

delete from Student_tble
where StudenttName='ahmed'

delete from Book_tble
where categoryID=20

delete from Category_tble
where  CategoryID=20

delete from Publisher_tble
where publishrename='Egybest'








 


