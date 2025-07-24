select ProductID as ÃËÑÊÊÔ¹¤éÒ,
		ProductName as ª×èÍÊÔ¹¤éÒ,
		UnitPrice as ÃÒ¤Ò,
		UnitsInStock as ¨Ó¹Ç¹,
		UnitPrice * UnitsInStock as [ÁÙÅ¤èÒÊÔ¹¤éÒ ·ÕèàËÅ×Í] -- Alias Name
from Products

select ProductID as ÃËÑÊÊÔ¹¤éÒ,
		ProductName as ª×èÍÊÔ¹¤éÒ,
		UnitsInStock + UnitsOnOrder as ¨Ó¹Ç¹ÊÔ¹¤éÒ¤§àËÅ×Í·Ñé§ËÁ´,
		ReorderLevel as ¨Ø´ÊÑè§«×éÍ
from Products
where (UnitsInStock + UnitsOnOrder) < ReorderLevel

select ProductID,ProductName,
		UnitPrice,ROUND(UnitPrice*0.07,2) as [Vat 7%]
from Products

select EmployeeID,
	TitleOfCourtesy+FirstName+space(1)+LastName as [Employees Name]
from Employees

select EmployeeID,
	TitleOfCourtesy+FirstName+' '+LastName as [Employees Name]
from Employees

--µéÍ§¡ÒÃ¤Ó¹Ç³ÃÒÂ¡ÒÃ¢ÒÂÊÔ¹¤éÒã¹ÃÒÂ¡ÒÃ·Õè 10250 ãªéµÒÃÒ§ [order details]
select OrderID,ProductID,UnitPrice,Quantity,Discount,
		UnitPrice* Quantity - ((UnitPrice * Quantity) * Discount) as NetPrice
from [Order Details]
where OrderID = 10250

select OrderID,ProductID,UnitPrice,Quantity,Discount,
		UnitPrice * Quantity * (1-Discount) as NetPrice
from [Order Details]
where OrderID = 10250

select OrderID,ProductID,UnitPrice,Quantity,Discount,
		round(UnitPrice * Quantity * (1-Discount),2) as NetPrice
from [Order Details]
where OrderID = 10250

-- ¡ÒÃãªé Aggregate Function

select COUNT(*) as ¨Ó¹Ç¹ÊÔ¹¤éÒ 
from Products
where UnitsInStock < 15

select COUNT(*) ¨Ó¹Ç¹ÊÔ¹¤éÒ -- µÃ§¹ÕéäÁèãÊè as ä´é
from Products
where UnitsInStock < 15

-- µéÍ§¡ÒÃ·ÃÒº¨Ó¹Ç¹¾¹Ñ¡§Ò¹
-- µéÍ§¡ÒÃ·ÃÒº¨Ó¹Ç¹ÅÙ¡¤éÒ¨Ò¡ brazil
-- µéÍ§¡ÒÃ·ÃÒº¨Ó¹Ç¹¢Í§ÊÔ¹¤éÒÃËÑÊ 10250
-- µéÍ§¡ÒÃ·ÃÒº¨Ó¹Ç¹ÊÔ¹¤éÒ·ÕèÊè§ä» japan

select COUNT(*) as ¨Ó¹Ç¹¾¹Ñ¡§Ò¹
from Employees

select Count(*) as ¨Ó¹Ç¹ 
from Customers
where Country = 'Brazil'

select count(*) as ¨Ó¹Ç¹ 
from [Order Details]
where OrderID = 10250

select count(*) as ¨Ó¹Ç¹
from Orders
where ShipCountry = 'Japan'

-- µéÍ§¡ÒÃÃÒ¤ÒÊÔ¹¤éÒ µèÓÊØ´ ÊÙ§ÊØ´ ¤èÒà©ÅÕèÂ
select min(UnitPrice) µèÓÊØ´,max(UnitPrice) ÊÙ§ÊØ´,AVg(UnitPrice) ¤èÒà©ÅÕèÂ
from Products
select min(UnitPrice) as µèÓÊØ´,max(UnitPrice) as ÊÙ§ÊØ´,AVg(UnitPrice) as ¤èÒà©ÅÕèÂ
from Products

-- µéÍ§¡ÒÃÃÒ¤Òà©ÅÕèÂ ÃÒ¤ÒÊÙ§ÊØ´ ÃÒ¤ÒµèÓÊØ´ ¢Í§ÊÔ¹¤éÒÃËÑÊ 5 ·Õè¢ÒÂä´é [Order Details]
select avg(UnitPrice) as ÃÒ¤Òà©ÅÕèÂ,max(UnitPrice) as ÊÙ§ÊØ´,min(UnitPrice) as µèÓÊØ´
from [Order Details]
where ProductID = 5

-- ª×èÍ»ÃÐà·È áÅÐ¨Ó¹Ç¹ÅÙ¡¤éÒã¹áµèÅÐ»ÃÐà·È
select Country,Count(*) as [Num of Country] 
from Customers 
group by Country
-- àÃÕÂ§µÒÁ¤ÍÅÑèÁ·Õè 2 ä´é
select Country,Count(*) as [¨Ó¹Ç¹ÅÙ¡¤éÒ] 
from Customers 
group by Country
order by [¨Ó¹Ç¹ÅÙ¡¤éÒ] desc

-- ª×èÍ»ÃÐà·È àÁ×Í§áÅÐ¨Ó¹Ç¹ÅÙ¡¤éÒã¹áµèÅÐàÁ×Í§
select Country,City,Count(*) as [¨Ó¹Ç¹ÅÙ¡¤éÒ] 
from Customers 
group by Country,City
order by [¨Ó¹Ç¹ÅÙ¡¤éÒ] desc

-- µéÍ§¡ÒÃ¢éÍÁÙÅ¨Ó¹Ç¹ãºÊÑè§«×éÍ·ÕèÊè§ä»ã¹áµèÅÐ»ÃÐà·È -- order
select ShipCountry,ShipCity,count(*) as ¨Ó¹Ç¹ãºàÊÃç¨ 
from Orders
group by ShipCountry,ShipCity 
order by ¨Ó¹Ç¹ãºàÊÃç¨ desc


-- ª×èÍ»ÃÐà·È àÁ×Í§áÅÐ¨Ó¹Ç¹ÅÙ¡¤éÒã¹áµèÅÐàÁ×Í§ -- ·ÕèÁÕÅÙ¡¤éÒ¹éÍÂ¡ÇèÒ 5
select Country,City,Count(*) as [¨Ó¹Ç¹ÅÙ¡¤éÒ] 
from Customers 
group by Country,City
having COUNT(*) < 5
order by [¨Ó¹Ç¹ÅÙ¡¤éÒ] desc

-- ª×èÍ»ÃÐà·È àÁ×Í§áÅÐ¨Ó¹Ç¹ÅÙ¡¤éÒã¹áµèÅÐàÁ×Í§ -- ·ÕèÁÕÅÙ¡¤éÒÁÒ¡¡ÇèÒ 1
select Country,City,Count(*) as [¨Ó¹Ç¹ÅÙ¡¤éÒ] 
from Customers 
group by Country,City
having COUNT(*) > 1
order by [¨Ó¹Ç¹ÅÙ¡¤éÒ] desc


-- µéÍ§¡ÒÃ¢éÍÁÙÅ¨Ó¹Ç¹ãºÊÑè§«×éÍ·ÕèÊè§ä»ã¹áµèÅÐ»ÃÐà·È -- order  ÁÕÁÒ¡¡ÇèÒ100 ÃÒÂ¡ÒÃ
select ShipCountry,count(*) as ¨Ó¹Ç¹ãºàÊÃç¨ 
from Orders
group by ShipCountry
Having count(*) > 100
order by ¨Ó¹Ç¹ãºàÊÃç¨ desc

-- µéÍ§¡ÒÃ¨Ó¹Ç¹ãºÊÑè§«×éÍ·ÕèÊè§ä»ã¹áµèÅÐ»ÃÐà·Èà©¾ÒÐã¹»Õ 1997 
-- ã¹»ÃÐà·È·ÕèÁÕ¨Ó¹Ç¹¹éÍÂ¡ÇèÒ 5
select ShipCountry as »ÃÐà·È·ÕèÊè§ä» -- as ãªéáºº¹Õéä´é´éÇÂ
,count(*) as ¨Ó¹Ç¹ãºÊÑè§«×éÍ 
from Orders
where YEAR(OrderDate) = 1997
group by ShipCountry
having count(*) < 5

-- µéÍ§¡ÒÃÃËÑÊÊÔ¹¤éÒ ¨Ó¹Ç¹·Õè¢ÒÂä´é·Ñé§ËÁ´ ÃÒ¤ÒÊÙ§ÊØ´ µèÓÊØ´ ¤èÒà©ÅÕèÂ -- order detail
select ProductID,sum(Quantity) as ¨Ó¹Ç¹·Õè¢ÒÂä´é,
		max(UnitPrice) as ÃÒ¤ÒÊÙ§ÊØ´,
		min(UnitPrice) as ÃÒ¤ÒµèÓÊØ´,
		avg(UnitPrice) as ÃÒ¤ÒÃÒ¤Òà©ÅÕèÂ
from [Order Details]
group by ProductID
-- having min(UnitPrice) > 50
order by sum(Quantity) desc

-- µéÍ§¡ÒÃÃËÑÊãºÊÑè§«×éÍ áÅÐÂÍ´¢ÒÂÃÇÁã¹áµèÅÐãºÊÑè§«×éÍ -- order detail
select OrderID,sum(round(UnitPrice*Quantity*(1-Discount),2)) as TotalPrice
from [Order Details]
group by OrderID
order by 2 desc
