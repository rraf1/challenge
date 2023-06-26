CREATE TABLE user_dept (
    user_id varchar2(30),
    dept     number(4),
    CONSTRAINT pk_user_dept PRIMARY KEY (user_id, dept),
    CONSTRAINT fk_item FOREIGN KEY (dept) REFERENCES item (dept)
    --CONSTRAINT fk_user(user_id) FOREIGN KEY REFERENCES user(user_id) I'd also create this FK however since we have no users table I'll leave it commented
);
