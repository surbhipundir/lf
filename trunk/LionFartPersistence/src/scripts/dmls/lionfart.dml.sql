insert into role
(role_id, role_name, createdBy, createdTime, modifiedBy, modifiedTime) VALUES
(1, 'Administrator', 'kcenturion', NOW(), NULL, NULL),
(2, 'QA', 'kcenturion', NOW(), NULL, NULL),
(3, 'Support', 'kcenturion', NOW(), NULL, NULL);

insert into user
(user_id, user_name, password, email, first_name, last_name, createdBy, createdTime, modifiedBy, modifiedTime) VALUES
(1, 'kcenturion', 'kcenturion', 'kcenturion@yahoo.com', 'Kenneth', 'Centurion', 'kcenturion', NOW(), NULL, NULL);

insert into user_role
(user_role_id, user_id, role_id, createdBy, createdTime, modifiedBy, modifiedTime) VALUES
(1, 1, 1, 'kcenturion', NOW(), NULL, NULL);
