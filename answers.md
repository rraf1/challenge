/*------------------------------------------------------------------------------------------------------------------
--This challenge was made with 100 stores and 1000 items only due to the limitations of the free workspace provided
------------------------------------------------------------------------------------------------------------------*/
--
--1. Primary key definition and any other constraint or index suggestion
--A:Answer in script challenge/scripts/constraints.sql
--
--2. Your suggestion for table data management and data access considering the application usage
--A:Answer in script challenge/scripts/partitions.sql
--3. Your suggestion to avoid row contention at table level parameter because of high level of concurrency
--
--Besides the previously created partitions and indexes, we should be careful when designing new applications using those table,
--eg. if we need to update one row, we should only lock that specific row, we should also aim to have smaller faster transactions whenever possible
--We could also set parallelism at table level with ALTER TABLE item_loc_soh PARALLEL;
--
--4. Create a view that can be used at screen level to show only the required fields
--
--A:Answer in script challenge/scripts/view.sql
--
--5. Create a new table that associates user to existing dept(s)
--
--A:Answer in script challenge/scripts/user_dept.sql
--6. Create a package with procedure or function that can be invoked by store or all stores to save the item_loc_soh to a new table that will contain the same information plus the stock value per item/loc (unit_cost*stock_on_hand)
--A:Answer in script challenge/scripts/pkg_item_loc_soh.sql
--
--7. Create a data filter mechanism that can be used at screen level to filter out the data that user can see accordingly to dept association (created previously)
--
--A:Answer in script challenge/scripts/f_get_user_dept_soh.sql
--8. Create a pipeline function to be used in the location list of values (drop down)
--A:Answer in script challenge/scripts/ f_get_loc_list
--9. Looking into the following explain plan what should be your recommendation and implementation to improve the existing data model. 
--Please share your solution and the corresponding explain plan. Please take in consideration the way that user will use the app.
--
--A: To improve the existing data I'd recomend the creation of a hash partition using item_loc_soh.loc and the creation of indexes on both item_loc_soh.loc and item_loc_soh.dept.
--You can check my plan below, please remember that this challenge was done using only 100 000 records instead of the 10 000 000 due to tool limitations.
/*
Operation        | Options                      | Object               | Rows|Time|Cost|Bytes|Filter Predicates| Access Predicates|
SELECT STATEMENT |                              |                      | 1   |1   |2   |23   |                 |                  |
  PARTITION HASH | SINGLE                       |                      | 1   |1   |2   |23   |                 |                  |
    TABLE ACCESS | BY LOCAL INDEX ROWID BATCHED | ITEM_LOC_SOH         | 1   |1   |2   |23   |"DEPT" = 68      |                  |
      INDEX      | RANGE SCAN                   | IDX_ITEM_LOC_SOH_LOC | 1   |1   |1   |     |                 |"LOC" = 65        |*/
--
--10. Run the previous method that was created on 6. for all the stores from item_loc_soh to the history table. The entire migration should not take more than 15s to run (don't use parallel hint to solve it :)) 
--
--A:To improve the performance I would disable all constraints and indexes, if that's not enough I would create several jobs using dbms_scheduler to run multiple instances of the procedure (1 for each loc for example) simultaneously
--
-- 11. Please have a look into the AWR report (AWR.html) in attachment and let us know what is the problem that the AWR is highlighting and potential solution.
--
--A:I'm not familiar with AWR reports but there seems to be a concurrency issue, I would look for the processes causing it and change them accordingly.
