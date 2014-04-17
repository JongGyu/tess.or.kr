SELECT seq, subject, name, content, filename, grp, regdate FROM bbs ORDER BY seq DESC;

INSERT INTO bbs( subject, content, filename, regdate)	
VALUES( 'test', 'test', 'test', sysdate() )	;

DELETE FROM bbs	WHERE seq = 18;	



SELECT seq, content, subject, year, month, day, regdate FROM calendar;




SELECT seq, subject, content, year, LPAD(month, 2, '0') AS month, LPAD(day, 2, '0') AS day, regdate	
 FROM calendar											
ORDER BY seq DESC	

INSERT INTO calendar(subject, content, year, month, day, regdate)	
VALUES('test', 'test', 			'2014', '4', 				'209', sysdate())

UPDATE calendar SET				
subject = 'けけけけけ', 
year = '2014',		
month = '04',		
day = '09'			
WHERE seq = 	5 	



SELECT * FROM album;
SELECT * FROM album   WHERE grp = 'test' GROUP BY seq DESC LIMIT 1;

INSERT INTO album(subject, typ, grp, photoname, regdate)	
VALUES('test', 'photo', 'asd', 'album.jpg', sysdate())

UPDATE album SET 			 typ = 'album'					WHERE seq = '5' 	




											