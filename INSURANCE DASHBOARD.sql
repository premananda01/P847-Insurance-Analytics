select `Account Exe Id`,`employee name`,
sum(`new budget`) as `Total New`,
sum(`Cross sell bugdet`) as `Total Cross Sell`,
Sum(`Renewal Budget`) as `Total Renewal`
from `individual budget`
group by `Account Exe Id`,`employee name`;

--- TARGET FY

select 
sum(`new budget`) as `Total New`,
sum(`Cross sell bugdet`) as `Total Cross Sell`,
Sum(`Renewal Budget`) as `Total Renewal`
from `individual budget`;

--- PLACED ACHIVEMENT

select income_class,
sum(round(amount)) as Achivement      
from (
select income_class,amount  from brokerage
union all
select income_class,Amount from fees) as Combined
group by income_class;

--- INVOICE ACHIVEMENT

select income_class,
sum(amount) as `Invoice Achivement`
from invoice
group by income_class;


--- NO. OF MEETINGS BY ACCOUNT EXECUTIVE

select `account executive`, count(meeting_date) as `Count No Of Meeting`
from meeting
group by `Account Executive`;


--- CHANGE DATE DATATYPE


ALTER TABLE meeting
ADD COLUMN meeting_date_new DATE;

UPDATE meeting
SET meeting_date_new = STR_TO_DATE(meeting_date, '%m/%d/%Y');

alter table meeting drop column meeting_date;


--- NO. OF MEETINGS BY YEAR

SELECT
    count(case when year(meeting_date_new)=2019 then 1 end) as '2019',
    count(case when year(meeting_date_new)=2020 then 1 end) as '2020'
FROM meeting;


--- NO OF INVOICE BY ACCOUNT EXECUTIVE

select `Account Executive`,income_class,count(invoice_number)
from invoice
group by `Account Executive`,income_class
order by count(invoice_number);

--- TOP 4 OPEN OPPORTUNITY BY REVENUE

select opportunity_name,sum(revenue_amount) as Revenue_Amount
from opportunity
group by opportunity_name
order by revenue_amount desc
limit 4;


--- PRODUCT GROUP DISTRIBUTION


select product_group,count(product_group) as `Product Distribution`
from opportunity
group by product_group;


