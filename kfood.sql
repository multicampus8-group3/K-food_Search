show databases;

use kfood;

show tables;

desc member_table;
desc restaurant_table;
desc review_table;
desc ad_table;

-- usertype종류 -> admin / owner / normal / owner(jin) --

insert into member_table(userid, userpwd, username, usernation, favornation, favorstate, tel, usertype)
values('cookie', '1234', 'cookie', '미국', '한국', '서울', '010-1234-5678', 'owner(jin)');

insert into restaurant_table(resname, resadress, resgrade, rescontent, userid, resnation, resstate, restype, resimg, reshour, website)
values('HKOOK 한식예찬', '11 Rue Jonquoy, 75014 Paris, 프랑스', '5.0', 'rescontent', 'apple', '프랑스', '파리', 'restype', 'resimg', 'reshour', 'website');

insert into review_table(content, grade, userid, resno)
values('OMG', '4.0', 'pear', '4');

insert into ad_table(resno, bannerimg, userid, startdate, enddate, status)
values('2', 'koreanbbq.jpg', 'blueberry', '2022-04-18 10:13:42', '2022-04-28 10:13:42', '대기');

select * from member_table;
select * from restaurant_table;
select * from review_table;
select * from ad_table;

select format(resgrade, 1) from restaurant_table;

select resno, resname, resadress, format(resgrade,1) resgrade, 
		userid, resnation, resstate, date_format(writedate,'%Y-%m-%d') writedate
		from restaurant_table;

update member_table set username="이순신", userpwd="1234", favornation="일본", favorstate="대마도" where userid="apple";
update restaurant_table set resadress="11 Rue Jonquoy, 75014 Paris, 프랑스" where resname="HKOOK 한식예찬";
update ad_table set bannerimg="hs.jpg" where no="2";

update member_table set tel="010-4654-4876" where userid="test123";


ALTER TABLE restaurant_table CHANGE resgrade resgrade decimal(2,1);
ALTER TABLE restaurant_table CHANGE resgrade resgrade double;

select userid, username, usertype, tel, usernation, favornation, favorstate, writedate
		from member_table
		where userid like '%potato%'
		order by usertype;
        
select rev.no no, rev.userid userid, res.resname resname, rev.grade grade, 
		rev.content content, rev.writedate writedate
		from review_table as rev
		join restaurant_table as res
		on rev.resno = res.resno
			where rev.userid like '%goguma%'
		order by rev.no desc;        
        
        
update member_table set usertype='owner(jin)'
		where userid='mango';
        
drop table ad_table;