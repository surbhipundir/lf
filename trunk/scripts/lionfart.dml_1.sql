delete from user_role;
delete from user;
delete from role;

insert into `role`(`ID`,`NAME`,`CREATED_BY`,`CREATED_DATE`,`MODIFIED_BY`,`MODIFIED_DATE`) 
  values (1,'Administrator','kcenturion',NOW(),null,NOW());
  
insert into `role`(`ID`,`NAME`,`CREATED_BY`,`CREATED_DATE`,`MODIFIED_BY`,`MODIFIED_DATE`) 
  values (2,'User','kcenturion',NOW(),null,NOW());
  
insert into `user`(`ID`,`USER_NAME`,`PASSWORD`,`EMAIL`,`FIRST_NAME`,`LAST_NAME`,`CREATED_BY`,`CREATED_DATE`,`MODIFIED_BY`,`MODIFIED_DATE`) 
  values (2,'test','test',null,null,null,'kcenturion',NOW(),null,null);

insert into `user_role`(`ID`,`USER_ID`,`ROLE_ID`,`CREATED_BY`,`CREATED_DATE`,`MODIFIED_BY`,`MODIFIED_DATE`) 
  values (2,2,1,'kcenturion',NOW(),null,null);
