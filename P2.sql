-- select * from orders;

select custId,count(*) as OrderCount from orders group by custId;