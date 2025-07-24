select ProductID as �����Թ���,
		ProductName as �����Թ���,
		UnitPrice as �Ҥ�,
		UnitsInStock as �ӹǹ,
		UnitPrice * UnitsInStock as [��Ť���Թ��� ��������] -- Alias Name
from Products

select ProductID as �����Թ���,
		ProductName as �����Թ���,
		UnitsInStock + UnitsOnOrder as �ӹǹ�Թ��Ҥ�����ͷ�����,
		ReorderLevel as �ش��觫���
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

--��ͧ��äӹǳ��¡�â���Թ������¡�÷�� 10250 ����ҧ [order details]
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

-- ����� Aggregate Function

select COUNT(*) as �ӹǹ�Թ��� 
from Products
where UnitsInStock < 15

select COUNT(*) �ӹǹ�Թ��� -- �ç��������� as ��
from Products
where UnitsInStock < 15

-- ��ͧ��÷�Һ�ӹǹ��ѡ�ҹ
-- ��ͧ��÷�Һ�ӹǹ�١��Ҩҡ brazil
-- ��ͧ��÷�Һ�ӹǹ�ͧ�Թ������� 10250
-- ��ͧ��÷�Һ�ӹǹ�Թ��ҷ����� japan

select COUNT(*) as �ӹǹ��ѡ�ҹ
from Employees

select Count(*) as �ӹǹ 
from Customers
where Country = 'Brazil'

select count(*) as �ӹǹ 
from [Order Details]
where OrderID = 10250

select count(*) as �ӹǹ
from Orders
where ShipCountry = 'Japan'

-- ��ͧ����Ҥ��Թ��� ����ش �٧�ش ��������
select min(UnitPrice) ����ش,max(UnitPrice) �٧�ش,AVg(UnitPrice) ��������
from Products
select min(UnitPrice) as ����ش,max(UnitPrice) as �٧�ش,AVg(UnitPrice) as ��������
from Products

-- ��ͧ����Ҥ������ �Ҥ��٧�ش �Ҥҵ���ش �ͧ�Թ������� 5 ������� [Order Details]
select avg(UnitPrice) as �Ҥ������,max(UnitPrice) as �٧�ش,min(UnitPrice) as ����ش
from [Order Details]
where ProductID = 5

-- ���ͻ���� ��Шӹǹ�١�������л����
select Country,Count(*) as [Num of Country] 
from Customers 
group by Country
-- ���§������������ 2 ��
select Country,Count(*) as [�ӹǹ�١���] 
from Customers 
group by Country
order by [�ӹǹ�١���] desc

-- ���ͻ���� ���ͧ��Шӹǹ�١�����������ͧ
select Country,City,Count(*) as [�ӹǹ�١���] 
from Customers 
group by Country,City
order by [�ӹǹ�١���] desc

-- ��ͧ��â����Ũӹǹ���觫��ͷ���������л���� -- order
select ShipCountry,ShipCity,count(*) as �ӹǹ����� 
from Orders
group by ShipCountry,ShipCity 
order by �ӹǹ����� desc


-- ���ͻ���� ���ͧ��Шӹǹ�١�����������ͧ -- ������١��ҹ��¡��� 5
select Country,City,Count(*) as [�ӹǹ�١���] 
from Customers 
group by Country,City
having COUNT(*) < 5
order by [�ӹǹ�١���] desc

-- ���ͻ���� ���ͧ��Шӹǹ�١�����������ͧ -- ������١����ҡ���� 1
select Country,City,Count(*) as [�ӹǹ�١���] 
from Customers 
group by Country,City
having COUNT(*) > 1
order by [�ӹǹ�١���] desc


-- ��ͧ��â����Ũӹǹ���觫��ͷ���������л���� -- order  ���ҡ����100 ��¡��
select ShipCountry,count(*) as �ӹǹ����� 
from Orders
group by ShipCountry
Having count(*) > 100
order by �ӹǹ����� desc

-- ��ͧ��èӹǹ���觫��ͷ���������л����੾��㹻� 1997 
-- 㹻���ȷ���ըӹǹ���¡��� 5
select ShipCountry as ����ȷ����� -- as ��Ẻ��������
,count(*) as �ӹǹ���觫��� 
from Orders
where YEAR(OrderDate) = 1997
group by ShipCountry
having count(*) < 5

-- ��ͧ��������Թ��� �ӹǹ������������ �Ҥ��٧�ش ����ش �������� -- order detail
select ProductID,sum(Quantity) as �ӹǹ�������,
		max(UnitPrice) as �Ҥ��٧�ش,
		min(UnitPrice) as �Ҥҵ���ش,
		avg(UnitPrice) as �Ҥ��Ҥ������
from [Order Details]
group by ProductID
-- having min(UnitPrice) > 50
order by sum(Quantity) desc

-- ��ͧ����������觫��� ����ʹ��������������觫��� -- order detail
select OrderID,sum(round(UnitPrice*Quantity*(1-Discount),2)) as TotalPrice
from [Order Details]
group by OrderID
order by 2 desc
