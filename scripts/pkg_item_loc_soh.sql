CREATE OR REPLACE PACKAGE pkg_item_loc_soh 
AS
  PROCEDURE p_snapshot_item_loc_soh(p_loc loc.loc%TYPE);
  --
END pkg_item_loc_soh;
/
CREATE OR REPLACE PACKAGE BODY pkg_item_loc_soh 
AS
  PROCEDURE p_snapshot_item_loc_soh(p_loc loc.loc%TYPE)
  IS
  BEGIN
     INSERT INTO item_loc_soh_hist 
       (SELECT s.*, 
               s.unit_cost*stock_on_hand AS loc_soh_value 
          FROM item_loc_soh s 
        WHERE s.loc = coalesce(p_loc, s.loc));
  --
  END p_snapshot_item_loc_soh;
  --
END pkg_item_loc_soh;
/
