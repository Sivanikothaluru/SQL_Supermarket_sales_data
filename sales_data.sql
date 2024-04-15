use sales_data;

select * from sales_data;

select count(Quantity) as count_of_items,Product_type from sales_data 
group by Product_type;

select * from sales_data where branch = 1;

select concat("Dear user, Your Invoice ID is ",Invoice_ID," and your payment type is ",Payment_type) 
as message from sales_data;

select distinct(Date),Branch from sales_data 
order by Branch;

select min(Quantity), Branch from sales_data where date = '05-01-2019' 
group by Branch 
having min(Quantity)<6;

select Unit_price,Unit_price+15 as updated_price from sales_data
where Product_type='Health and beauty';

select avg(Rating), Product_type from sales_data 
group by Product_type;

select count(Invoice_ID),Payment_type from sales_data 
where Payment_type='Credit card' 
group by Payment_type;

select date,rating from sales_data where date between '01-01-2019' and '31-01-2019' order by rating;

select sum(Quantity),product_type,branch as total_products_sold 
from sales_data where product_type= 'Electronic accessories' 
and branch = 3;

select * from sales_data limit 10;

select day_of_order ,LPAD('*',num_of_transactions,'*') as num_of_transcations,total_sales
from (select dayname(str_to_date(date, '%d-%m-%Y')) as day_of_order,
		count(distinct invoice_ID) as num_of_transactions, 
        sum(total) as total_sales
	from sales_data
    group by day_of_order) sales_per_day
order by total_sales desc;

select s1.Invoice_ID as Buyer_ID, s2.total as total_price 
from sales_data s1,sales_data s2 
where s1.invoice_id=s2.invoice_id; 

alter table sales_data
rename column total to total_price;

insert into sales_data values('007-06-2002',1,'Gudur','Female','Foods and beverages',45.69,3,6.8535,143.9235,current_date(),'Cash',8);

select * from sales_data where City='Gudur';

delete from sales_data where city='Gudur';

create view buyer_view as
select city,Product_type,total_price,quantity,date from sales_data;

select * from buyer_view;