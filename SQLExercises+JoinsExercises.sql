-- find all products--
 select * from products as p;
 
-- find all products that cost $1400
 select * from products where price = 1400;
 
-- find all products that cost $11.99 or $13.99
 select * from products where price = 11.99 or 13.99;
 
-- find all products that do NOT cost 11.99 - using NOT
 select * from products where not price = 11.99;
 
-- find  all products and sort them by price from greatest to least
 select * from products as p order by p.price desc;
 
-- find all employees who don't have a middle initial
 select * from employees where MiddleInitial is null;
 
-- find distinct product prices
 select distinct price from products;
 
-- find all employees whose first name starts with the letter ‘j’
 select * from employees where firstname like 'j%';
 
-- find all Macbooks --
 select * from products where name = 'macbook'; 
 
-- find all products that are on sale
 select * from products where onsale;
 
-- find the average price of all products --
 select avg(price) from products; 
 
-- find all Geek Squad employees who don't have a middle initial --
select * from employees as e where e.middleinitial is null and e.title = 'geek squad';
 
-- find all products from the products table whose stock level is in the range of 500 to 1200. Order by Price from least to greatest. **Try this with the between keyword** 
select * from products as p where p.StockLevel between 500 and 1200 order by price asc;
--------------------------------------------------------------------------------------------------
-- JOINS SECTION: 
-- joins: select all the computers from the products table: using the products table and the categories table, return the product name and the category name
select * from products as p 
LEFT JOIN categories as c 
on p.categoryID = c.categoryID 
where p.CategoryID = 1;

-- joins: find all product names, product prices, and products ratings that have a rating of 5
select p.name, p.price, r.rating from reviews as r
LEFT JOIN categories as c 
on p.categotyID = c.catergoryID
where p.categoryID = 1; 
-- this one 
 
-- joins: find the employee with the most total quantity sold.  
-- use the sum() function and group by
select e.firstname, e.lastname, sum(s.quantity) as total from sales as s
INNER JOIN employees as e 
on e.employeeID = s.employeeID
group by e.EmployeeID 
order by total desc
limit 1;

-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
select d.name as department, c.name as 'category' from departments as d
INNER JOIN categories as c 
on c.departmentID = d.departmentID 
where c.name = 'games' or c.name = 'appliances';

-- joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM()
select p.name, sum(s.quantity) as totalSold, 
sum(s.quantity * s.PricePerUnit) as 'total' from products as p
INNER JOIN sales as s 
on s.productID = p.productID where p.productID = 97;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
select p.name as 'roduct name', r.reviewer, r.rating, r.comment from reviews as r
INNER JOIN products as p on p.productID = r.productID
where p.productID = 857 and r.rating =1;

-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.employeeID, e.firstname, e.lastname, p.productID, p.name, sum(s.quantity) as 'total sold'
from sales as s INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;

