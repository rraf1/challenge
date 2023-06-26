--I'm not sure what's meant by "filter mechanism" so I'll just create a procedure that returns the data available to a given user/store
CREATE OR REPLACE PROCEDURE p_get_user_dept_soh (p_user_id     user_dept.user_id%TYPE,
                                                 p_loc         loc.loc%TYPE,
                                                 p_data OUT    sys_refcursor)
IS
BEGIN
  OPEN p_data FOR
    SELECT s.*
      FROM item_loc_soh s,
           user_dept    u
     WHERE u.user_id = p_user_id
       AND s.loc     = p_loc
       AND s.dept    = u.dept;
END p_get_user_dept_soh;
