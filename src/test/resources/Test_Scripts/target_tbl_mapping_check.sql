select count(*) from banking.customers where branchid not in (select branchid from banking.branch)