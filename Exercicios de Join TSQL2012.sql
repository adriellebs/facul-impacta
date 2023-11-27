--Exercicios de Join TSQL2012

use TSQL2012;

/*select top 10 * from Sales.Orders
select top 10 * from Sales.Customers
select top 0 * from HR.Employees
select top 10 * from Sales.Shippers
*/

-----1-----
select  orderid,
		orderdate,
		contactname,
		country
from Sales.Orders as Ord
inner join Sales.Customers as C
on Ord.custid = C.custid

-----2-----
select Ord.orderdate,
	   C.contactname,
	   firstname + ' ' + lastname as 'Nome Completo Empregado',
	   Emp.country
from Sales.Orders as Ord
inner join Sales.Customers as C
on Ord.custid = C.custid
inner join HR.Employees as Emp
on Ord.empid = Emp.empid 
where Emp.country like 'UK'

-----3-----
select  orderid,
		orderdate,
		contactname,
		firstname + ' ' + lastname as 'Nome Completo Empregado',
		C.country
from Sales.Orders as Ord
inner join Sales.Customers as C
on Ord.custid = C.custid
inner join HR.Employees as Emp
on Ord.empid = Emp.empid
where C.country like 'Brazil'
order by orderdate asc

-----4-----
select  orderid,
		orderdate,
		contactname,
		firstname + ' ' + lastname as 'Nome Completo Empregado',
		Emp.country,
		Shp.companyname
from Sales.Orders as Ord
inner join Sales.Customers as C
on Ord.custid = C.custid
inner join HR.Employees as Emp
on Ord.empid = Emp.empid
inner join Sales.Shippers as Shp
on Ord.shipperid = Shp.shipperid
where 
Emp.country like 'USA'
and 
Shp.companyname like 'Shipper ETYNR' 
or 
Shp.companyname like 'Shipper GVSUA'
order by orderid asc 

-----5-----
/*
select top 1 * from Sales.OrderDetails orderid e productid
select top 1 * from Production.Products productid, supplierid, categoryid
select top 1 * from Production.Suppliers supplierid
select top 1 * from Production.Categories categoryid
*/

--select  Prod.*, Cat.*
select Prod.productname, Cat.categoryname, Prod.unitprice
from Production.Products as Prod
inner join Production.Categories as Cat
on Prod.categoryid = Cat.categoryid
where Cat.categoryname like 'Beverages' and Prod.unitprice < 30
order by Prod.unitprice desc 


