Select * from Employees 
Select EmployeeID,FirstName,LastName from Employees
-- เว้นบรรทัดได้
select * -- ทุก colum
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
where UnitPrice between 0 and 10 -- ระหว่าง n กับ n

select * from Customers
where Country = 'Brazil' or Country = 'Argentina' or Country = 'Mexico'

select * from Customers
where Country in ('Brazil','Argentina','Mexico')

select * from Customers
where not fax is null

select * from Customers
where not (City = 'London' or City = 'Vancouver')

select * from Employees  -- N นำหน้า
where FirstName like 'N%'

select * from Employees   -- N ลงท้าย
where FirstName like '%N'

select * from Customers 
where Country like '%Land' -- ลงท้ายด้วย Land

-- ต้องการข้อมูลลูกค้าที่มีชื่อบริษัท ว่า chi
select * from Customers 
where CompanyName like '%chi%'

select * from Customers 
where CompanyName like '%nese%'

select * from Customers 
where CompanyName like '%ny%' or ContactName like '%ny%'

select * from Employees 
where FirstName like '_____'

select * from Employees -- ตัวที่ 2 เป็น a
where FirstName like '_a%'

select * from Employees -- ตัวที่ 2 เป็น a ลงท้าย t
where FirstName like '_a%t'

select * from Employees -- ขึ้นต้นด้วย a r s
where FirstName like '[ars]%'

select * from Employees -- ขึ้นต้นด้วย a ถึง m 
where FirstName like '[a-m]%'

-- ASC = Ascending น้อยไปมาก
-- DESC = Descending มากไปน้อย

select ProductID,ProductName,UnitPrice from Products -- เรียงลำดับ จากมากไปน้อย 
order by UnitPrice desc

select ProductID,ProductName,UnitPrice from Products -- เรียงลำดับ
order by UnitPrice 

select CompanyName,ContactName from Customers -- เรียงลำดับ จากน้อยไปมาก หรือเรียงตัวอักษร
order by ContactName Asc

select CategoryID,ProductName,UnitPrice from Products
order by CategoryID asc , UnitPrice Desc