Select * from Employees 
Select EmployeeID,FirstName,LastName from Employees
-- ŕÇéšşĂĂˇŃ´ä´é
select * -- ˇŘĄ colum
from employees 
where City = 'London'

Select EmployeeID,FirstName,LastName from Employees
where city = 'London'

select * from Products
where UnitPrice<5

select * from Customers
where City = 'London' or City = 'Vancouver'

select * from Customers
where Country = 'USA'
			or City = 'Vancouver'

select CompanyName,ContactName,Phone from Customers
where Country = 'USA'
			or City = 'Vancouver'

select * from Products where UnitPrice >= 50 and UnitsInStock < 20

select * from Products where UnitPrice >= 50 or UnitsInStock < 20

select * from Products 
where UnitPrice >= 50 And UnitPrice <= 100

select * from Products 
where UnitPrice between 0 and 10 -- ĂĐËÇčŇ§ n ĄŃş n

select * from Customers
where Country = 'Brazil' or Country = 'Argentina' or Country = 'Mexico'

select * from Customers
where Country in ('Brazil','Argentina','Mexico')

select * from Customers
where not fax is null

select * from Customers
where not (City = 'London' or City = 'Vancouver')

select * from Employees  -- N šÓËšéŇ
where FirstName like 'N%'

select * from Employees   -- N Ĺ§ˇéŇÂ
where FirstName like '%N'

select * from Customers 
where Country like '%Land' -- Ĺ§ˇéŇÂ´éÇÂ Land

-- ľéÍ§ĄŇĂ˘éÍÁŮĹĹŮĄ¤éŇˇŐčÁŐŞ×čÍşĂÔÉŃˇ ÇčŇ chi
select * from Customers 
where CompanyName like '%chi%'

select * from Customers 
where CompanyName like '%nese%'

select * from Customers 
where CompanyName like '%ny%' or ContactName like '%ny%'

select * from Employees 
where FirstName like '_____'

select * from Employees -- ľŃÇˇŐč 2 ŕťçš a
where FirstName like '_a%'

select * from Employees -- ľŃÇˇŐč 2 ŕťçš a Ĺ§ˇéŇÂ t
where FirstName like '_a%t'

select * from Employees -- ˘Öéšľéš´éÇÂ a r s
where FirstName like '[ars]%'

select * from Employees -- ˘Öéšľéš´éÇÂ a śÖ§ m 
where FirstName like '[a-m]%'

-- ASC = Ascending šéÍÂäťÁŇĄ
-- DESC = Descending ÁŇĄäťšéÍÂ

select ProductID,ProductName,UnitPrice from Products -- ŕĂŐÂ§ĹÓ´Ńş ¨ŇĄÁŇĄäťšéÍÂ 
order by UnitPrice desc

select ProductID,ProductName,UnitPrice from Products -- ŕĂŐÂ§ĹÓ´Ńş
order by UnitPrice 

select CompanyName,ContactName from Customers -- ŕĂŐÂ§ĹÓ´Ńş ¨ŇĄšéÍÂäťÁŇĄ ËĂ×ÍŕĂŐÂ§ľŃÇÍŃĄÉĂ
order by ContactName Asc

select CategoryID,ProductName,UnitPrice from Products
order by CategoryID asc , UnitPrice Desc
