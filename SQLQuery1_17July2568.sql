Select * from Employees 
Select EmployeeID,FirstName,LastName from Employees
-- ��鹺�÷Ѵ��
select * -- �ء colum
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
where UnitPrice between 0 and 10 -- �����ҧ n �Ѻ n

select * from Customers
where Country = 'Brazil' or Country = 'Argentina' or Country = 'Mexico'

select * from Customers
where Country in ('Brazil','Argentina','Mexico')

select * from Customers
where not fax is null

select * from Customers
where not (City = 'London' or City = 'Vancouver')

select * from Employees  -- N ��˹��
where FirstName like 'N%'

select * from Employees   -- N ŧ����
where FirstName like '%N'

select * from Customers 
where Country like '%Land' -- ŧ���´��� Land

-- ��ͧ��â������١��ҷ���ժ��ͺ���ѷ ��� chi
select * from Customers 
where CompanyName like '%chi%'

select * from Customers 
where CompanyName like '%nese%'

select * from Customers 
where CompanyName like '%ny%' or ContactName like '%ny%'

select * from Employees 
where FirstName like '_____'

select * from Employees -- ��Ƿ�� 2 �� a
where FirstName like '_a%'

select * from Employees -- ��Ƿ�� 2 �� a ŧ���� t
where FirstName like '_a%t'

select * from Employees -- ��鹵鹴��� a r s
where FirstName like '[ars]%'

select * from Employees -- ��鹵鹴��� a �֧ m 
where FirstName like '[a-m]%'

-- ASC = Ascending ������ҡ
-- DESC = Descending �ҡ仹���

select ProductID,ProductName,UnitPrice from Products -- ���§�ӴѺ �ҡ�ҡ仹��� 
order by UnitPrice desc

select ProductID,ProductName,UnitPrice from Products -- ���§�ӴѺ
order by UnitPrice 

select CompanyName,ContactName from Customers -- ���§�ӴѺ �ҡ������ҡ �������§����ѡ��
order by ContactName Asc

select CategoryID,ProductName,UnitPrice from Products
order by CategoryID asc , UnitPrice Desc