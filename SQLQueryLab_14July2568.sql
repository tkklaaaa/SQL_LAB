select ProductID as รหัสสินค้า,
		ProductName as ชื่อสินค้า,
		UnitPrice as ราคา,
		UnitsInStock as จำนวน,
		UnitPrice * UnitsInStock as [มูลค่าสินค้า ที่เหลือ] -- Alias Name
from Products

select ProductID as รหัสสินค้า,
		ProductName as ชื่อสินค้า,
		UnitsInStock + UnitsOnOrder as จำนวนสินค้าคงเหลือทั้งหมด,
		ReorderLevel as จุดสั่งซื้อ
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

--ต้องการคำนวณรายการขายสินค้าในรายการที่ 10250 ใช้ตาราง [order details]
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

-- การใช้ Aggregate Function

select COUNT(*) as จำนวนสินค้า 
from Products
where UnitsInStock < 15

select COUNT(*) จำนวนสินค้า -- ตรงนี้ไม่ใส่ as ได้
from Products
where UnitsInStock < 15

-- ต้องการทราบจำนวนพนักงาน
-- ต้องการทราบจำนวนลูกค้าจาก brazil
-- ต้องการทราบจำนวนของสินค้ารหัส 10250
-- ต้องการทราบจำนวนสินค้าที่ส่งไป japan

select COUNT(*) as จำนวนพนักงาน
from Employees

select Count(*) as จำนวน 
from Customers
where Country = 'Brazil'

select count(*) as จำนวน 
from [Order Details]
where OrderID = 10250

select count(*) as จำนวน
from Orders
where ShipCountry = 'Japan'

-- ต้องการราคาสินค้า ต่ำสุด สูงสุด ค่าเฉลี่ย
select min(UnitPrice) ต่ำสุด,max(UnitPrice) สูงสุด,AVg(UnitPrice) ค่าเฉลี่ย
from Products
select min(UnitPrice) as ต่ำสุด,max(UnitPrice) as สูงสุด,AVg(UnitPrice) as ค่าเฉลี่ย
from Products

-- ต้องการราคาเฉลี่ย ราคาสูงสุด ราคาต่ำสุด ของสินค้ารหัส 5 ที่ขายได้ [Order Details]
select avg(UnitPrice) as ราคาเฉลี่ย,max(UnitPrice) as สูงสุด,min(UnitPrice) as ต่ำสุด
from [Order Details]
where ProductID = 5

-- ชื่อประเทศ และจำนวนลูกค้าในแต่ละประเทศ
select Country,Count(*) as [Num of Country] 
from Customers 
group by Country
-- เรียงตามคอลั่มที่ 2 ได้
select Country,Count(*) as [จำนวนลูกค้า] 
from Customers 
group by Country
order by [จำนวนลูกค้า] desc

-- ชื่อประเทศ เมืองและจำนวนลูกค้าในแต่ละเมือง
select Country,City,Count(*) as [จำนวนลูกค้า] 
from Customers 
group by Country,City
order by [จำนวนลูกค้า] desc

-- ต้องการข้อมูลจำนวนใบสั่งซื้อที่ส่งไปในแต่ละประเทศ -- order
select ShipCountry,ShipCity,count(*) as จำนวนใบเสร็จ 
from Orders
group by ShipCountry,ShipCity 
order by จำนวนใบเสร็จ desc


-- ชื่อประเทศ เมืองและจำนวนลูกค้าในแต่ละเมือง -- ที่มีลูกค้าน้อยกว่า 5
select Country,City,Count(*) as [จำนวนลูกค้า] 
from Customers 
group by Country,City
having COUNT(*) < 5
order by [จำนวนลูกค้า] desc

-- ชื่อประเทศ เมืองและจำนวนลูกค้าในแต่ละเมือง -- ที่มีลูกค้ามากกว่า 1
select Country,City,Count(*) as [จำนวนลูกค้า] 
from Customers 
group by Country,City
having COUNT(*) > 1
order by [จำนวนลูกค้า] desc


-- ต้องการข้อมูลจำนวนใบสั่งซื้อที่ส่งไปในแต่ละประเทศ -- order  มีมากกว่า100 รายการ
select ShipCountry,count(*) as จำนวนใบเสร็จ 
from Orders
group by ShipCountry
Having count(*) > 100
order by จำนวนใบเสร็จ desc

-- ต้องการจำนวนใบสั่งซื้อที่ส่งไปในแต่ละประเทศเฉพาะในปี 1997 
-- ในประเทศที่มีจำนวนน้อยกว่า 5
select ShipCountry as ประเทศที่ส่งไป -- as ใช้แบบนี้ได้ด้วย
,count(*) as จำนวนใบสั่งซื้อ 
from Orders
where YEAR(OrderDate) = 1997
group by ShipCountry
having count(*) < 5

-- ต้องการรหัสสินค้า จำนวนที่ขายได้ทั้งหมด ราคาสูงสุด ต่ำสุด ค่าเฉลี่ย -- order detail
select ProductID,sum(Quantity) as จำนวนที่ขายได้,
		max(UnitPrice) as ราคาสูงสุด,
		min(UnitPrice) as ราคาต่ำสุด,
		avg(UnitPrice) as ราคาราคาเฉลี่ย
from [Order Details]
group by ProductID
-- having min(UnitPrice) > 50
order by sum(Quantity) desc

-- ต้องการรหัสใบสั่งซื้อ และยอดขายรวมในแต่ละใบสั่งซื้อ -- order detail
select OrderID,sum(round(UnitPrice*Quantity*(1-Discount),2)) as TotalPrice
from [Order Details]
group by OrderID
order by 2 desc
