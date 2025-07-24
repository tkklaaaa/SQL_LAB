select EmployeeID,TitleOfCourtesy,FirstName,LastName,City 
from Employees
where City = 'London';

select ProductID
from Products
where CategoryID in (1,2,4,8) and UnitPrice between 50 and 100;

select Country,City,CompanyName,ContactName,Phone
from Customers

select ProductID
from Products
where (CategoryID = 1 and UnitPrice <= 50) or (CategoryID = 8 and UnitPrice <= 75)

select CompanyName
from Customers
where Country = 'USA' and Fax is NULL
order by CompanyName asc