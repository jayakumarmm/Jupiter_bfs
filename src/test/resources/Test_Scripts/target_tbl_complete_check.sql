select count(*) as cnt from 
(select clientID from banking.customers)a 
left join (select clientID from banking_staging.customers_stg) b
on a.clientID = b.clientID
where b.clientID is null