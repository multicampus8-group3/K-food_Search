show databases;

use kfood;

show tables;

desc member_table;
desc restaurant_table;
desc review_table;
desc ad_table;
desc member_reserv;
desc member_favorite;

-- usertype종류 -> admin / owner / normal / owner(jin) --

insert into member_table(userid, userpwd, username, usernation, favornation, favorstate, tel, usertype)
values('cookie', '1234', 'cookie', '미국', '한국', '서울', '010-1234-5678', 'owner(jin)');

insert into restaurant_table(resname, resadress, resgrade, rescontent, userid, resnation, resstate, restype, resimg, reshour, website)
values('HKOOK 한식예찬', '11 Rue Jonquoy, 75014 Paris, 프랑스', '5.0', 'rescontent', 'apple', '프랑스', '파리', 'restype', 'resimg', 'reshour', 'website');

insert into review_table(content, grade, userid, resno)
values('어느 날 나무꾼은 평상시와 같이 나무를 하러 산으로 갔습니다. 그때, 산에서 번쩍거리는 커다란 황금을 발견했습니다. “와! 신난다. 이제 나는 부자가 되는 거야!” 순간 나무꾼은 그의 부인이 수다쟁이라는 사실을 떠올렸습니다. ‘아차! 이를 어쩌지? 이 황금덩어리를 보면 부인은 동네방네 떠들 거고…그럼 도둑이 들어와서 이 황금 덩이를 훔쳐 갈지 몰라.', '4.5', 'goguma', '2');

insert into member_reserv(userid, resno, reservdate, reservtime, reservp, status)
values('goguma', '5', '2022-04-18', '10:00', '2', 'apply');

insert into member_favorite(userid, resno)
values('goguma', '5');

insert into ad_table(resno, bannerimg, userid, startdate, enddate, status)
values('2', 'koreanbbq.jpg', 'blueberry', '2022-04-18 10:13:42', '2022-04-28 10:13:42', '대기');

select * from member_table;
select * from restaurant_table;
select * from review_table;
select * from ad_table;
select * from member_reserv;
select * from member_favorite;

select format(resgrade, 1) from restaurant_table;

select resno, resname, resadress, format(resgrade,1) resgrade, 
		userid, resnation, resstate, date_format(writedate,'%Y-%m-%d') writedate
		from restaurant_table;

update member_table set username="이순신", userpwd="1234", favornation="일본", favorstate="대마도" where userid="apple";
update restaurant_table set resadress="11 Rue Jonquoy, 75014 Paris, 프랑스" where resname="HKOOK 한식예찬";
update ad_table set bannerimg="hs.jpg" where no="2";

update member_reserv set status="apply" where userid="goguma";


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