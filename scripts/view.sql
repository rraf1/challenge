--I can't understand what's meant by required fields since it was not mentioned previously so I'll just create a view that makes sense:
CREATE VIEW v_item_loc_soh as (
    SELECT i.item,
           i.item_desc,
           i.dept,
           l.loc,
           l.loc_desc,
           s.unit_cost,
           s.stock_on_hand
      FROM item i,
           loc l,
           item_loc_soh s
     WHERE s.item = i.item
       AND s.loc = l.loc );
