
insert into `role`(`ROLE_ID`,`NAME`,`CREATED_BY`,`CREATED_TIME`,`MODIFIED_BY`,`MODIFIED_TIME`) 
  values (1,'Administrator','kcenturion',NOW(),null,NOW());
  
insert into `role`(`ROLE_ID`,`NAME`,`CREATED_BY`,`CREATED_TIME`,`MODIFIED_BY`,`MODIFIED_TIME`) 
  values (2,'User','kcenturion',NOW(),null,NOW());
  
insert into `user`(`USER_ID`,`USER_NAME`,`PASSWORD`,`EMAIL`,`FIRST_NAME`,`LAST_NAME`,`CREATED_BY`,`CREATED_TIME`,`MODIFIED_BY`,`MODIFIED_TIME`) 
  values (2,'kcenturion','SET YOUR PASSWORD HERE',null,null,null,'kcenturion',NOW(),null,null);

