CREATE TABLE user_dept (
    user varchar2(30),
    dept number(4),
    CONSTRAINT pk_user_dept PRIMARY KEY (user, dept),
    CONSTRAINT fk_item(item) FOREIGN KEY REFERENCES item(dept),
    --CONSTRAINT fk_user(user) FOREIGN KEY REFERENCES user(user) I'd also create this FK however since we have no users table I'll leave it commented
);
