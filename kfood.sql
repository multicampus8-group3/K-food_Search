show databases;

use kfood;

show tables;

desc member_table;

insert into member_table(userid, userpwd, username, usernation, favornation, favorstate, tel, usertype)
values('apple', '1234', '홍길동', '한국', '미국', '텍사스', '010-1234-5678', 'owner');

-- usertype종류 -> admin / owner / normal --

select * from member_table;

