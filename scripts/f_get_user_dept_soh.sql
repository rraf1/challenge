--I'm not sure what's meant by "filter mechanism" so I'll just create a function that returns the data available to a given user/store
CREATE OR REPLACE FUNCTION f_get_user_dept_soh (p_user user_dept.user%TYPE
                                                p_loc  loc.loc%TYPE) 
  RETURN SYS_REFCURSOR AS
BEGIN
  RETURN SELECT *
           FROM item_loc_soh s,
                user_dept    u
          WHERE u.user = p_user
            AND s.loc  = p_loc
            AND s.dept = u.dept;
END f_get_user_dept_soh;
