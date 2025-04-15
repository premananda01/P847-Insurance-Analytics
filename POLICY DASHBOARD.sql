--- TOTAL POLICY

select count(`policy id`) as `Total Policy`
from `policy details`;


--- STATUS WISE POLICY COUNT


select status,count(`policy id`) as `Count Status`
from `policy details`
group by Status;


--- TOTAL CUSTOMER

select count(`customer id`) as `Total Customer`
from `customer information`;


--- AGE BUCKET WISE POLICY COUNT

select
case
when age between 18 and 25 then '18-25'
when age between 26 and 45 then '26-45'
when age between 46 and 65 then '46-65'
when age between 66 and 85 then '66-85'
else age
end as `Age Bucket`,
count(`Policy ID`) as `Count Of Policy Id`
from `customer information` join `policy details`
on `customer information`.`Customer ID`=`policy details`.`Customer ID`
group by `Age Bucket`;


--- GENDER WISE POLICY COUNT

select Gender,count(`Policy ID`) as `Count Of Policy Id`
from `customer information` join `policy details`
on `customer information`.`Customer ID`=`policy details`.`Customer ID`
group by Gender;


--- POLICY TYPE WISE POLICY COUNT

select `policy type`,count(`policy id`) as `Policy Count`
from `policy details`
group by `Policy Type`;

--- POLICY EXPIRE THIS(2025) YEAR

select
count(case when year(`policy end date`)=2025 then 1 end) as `Count Of Policy Expire In 2025`
from `policy details`;

--- CLAIM STATUS WISE POLICY COUNT

select `claim status`,count(`policy id`) as `Policy Count`
from claims	
group by `Claim Status`;

--- PAYMENT  STATUS WISE POLICY COUNT

select `payment status`,count(`policy id`) as `Policy Count`
from `payment history`
group by `Payment Status`;

--- TOTAL CLAIM AMOUNT

select sum(`claim amount`) as `Total Claim Amount`
from claims;
