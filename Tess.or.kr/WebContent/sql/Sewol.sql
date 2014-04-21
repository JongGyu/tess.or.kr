DROP TABLE SEWOL;


CREATE TABLE SEWOL_PEOPLES(
	die int not null default 0,
	lost int not null default 0,
	save int not null default 0
);

SELECT *  FROM SEWOL_PEOPLES;

INSERT INTO SEWOL_PEOPLES(save, lost, die) VALUES (179, 271, 25);



DROP TABLE SEWOL_SAVEPEOPLES;

CREATE TABLE SEWOL_SAVEPEOPLES (
	seq	int not null primary key auto_increment,
	name varchar(100) not null,
	age int not null default 0,
	sex varchar(2) not null,
	grp varchar(200) 
);

SELECT  * FROM SEWOL_SAVEPEOPLES;

INSERT INTO SEWOL_SAVEPEOPLES(name, age, sex, grp) 
VALUES ();



DROP TABLE SEWOL_MESSAGE;

CREATE TABLE SEWOL_MESSAGE (
	seq int not null primary key auto_increment,
	name varchar(200) not null,
	content text,
	regdate varchar(20)
);

SELECT seq, name, content, regdate FROM SEWOL_MESSAGE;


						��ܺ�,2-1��,��
						������,2-1��,��
						��ȿ��,2-1��,��
						��ä��,2-1��,��
						�ڵ���,2-1��,��
						������,2-1��,��
						�����,2-1��,��
						�����,2-1��,��
						������,2-1��,��
						������,2-1��,��
						������,2-1��,��
						������,2-1��,��
						�̴���,2-1��,��
						�ڼ���,2-1��,��
						���־�,2-1��,��
						�ֹ���,2-1��,��
						������,2-1��,��
						������,2-1��,��
						������,2-1��,��
						���μ�,2-2��,��
						��ä��,2-2��,��
						�ѽ¿�,2-2��,��
						�ڼ���,2-2��,��
						������,2-2��,��
						������,2-2��,��
						������,2-2��,��
						�ڼ���,2-2��,��
						�̿���,2-2��,��
						������,2-2��,��
						�����,2-2��,��
						�ڼֺ�,2-3��,��
						������,2-3��,��
						�輺��,2-3��,��
						�赵��,2-3��,��
						�ֹ���,2-3��,��
						������,2-3��,��
						������,2-3��,��
						������,2-3��,��
						������,2-4��,��
						��·�,2-4��,��
						������,2-4��,��
						���뼷,2-4��,��
						������,2-4��,��
						����ȣ,2-4��,��
						�ֽ���,2-4��,��
						����ȯ,2-4��,��
						������,2-4��,��
						�����,2-5��,��
						�����,2-5��,��
						������,2-5��,��
						������,2-5��,��
						�۱���,2-5��,��
						��â,2-5��,��
						�輱��,2-5��,��
						������,2-5��,��
						������,2-5��,��
						������,2-6��,��
						�Ӵ���,2-6��,��
						�ȹμ�,2-6��,��
						�����,2-6��,��
						�����,2-6��,��
						������,2-6��,��
						������,2-6��,��
						�ѻ���,2-6��,��
						������,2-6��,��
						�ſ���,2-6��,��
						��ȣ��,2-6��,��
						������,2-6��,��
						�����,2-6��,��
						
						
						<li class="">
							<span class=" ">������</span> | 2-7�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">���¿�</span> | 2-8�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">����</span> | 2-8�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">�ڼ���</span> | 2-9�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">��ΰ�</span> | 2-9�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> | 2-10�� <span
								class=" ">| ��</span>
						</li>
						<li class="">
							<span class=" ">���α�</span> | �����
						</li>
						<li class="">
							<span class=" ">�̿���</span> | �����
						</li>
						<li class="">
							<span class=" ">�����</span> | �����
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="text-primary">| 53�� 6��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="text-primary">| 64�� 7��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="text-primary">| 73�� 6��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="text-primary">| 54�� 7��</span>
						</li>
						<li class="">
							<span class=" ">����</span> <span
								class="text-primary">| 62��</span>
						</li>
						<li class="">
							<span class=" ">�赵��</span> <span
								class="text-primary">| 64�� 6��</span>
						</li>
						<li class="">
							<span class=" ">�赿��</span> <span
								class="text-primary">| 65�� 11��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="text-primary">| 67�� 1��</span>
						</li>
						<li class="">
							<span class=" ">����ȣ</span> <span
								class="">| 91�� 9��</span>
						</li>
						<li class="">
							<span class=" ">����ȣ</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 58��</span>
						</li>
						<li class="">
							<span class=" ">�躴��</span> <span
								class="">| 61�� 8��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 70�� 9��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 8��</span>
						</li>
						<li class="">
							<span class=" ">�輺��</span> <span
								class="">| 77�� 11��</span>
						</li>
						<li class="">
							<span class=" ">�ڽ¿�</span> <span
								class="">| 55�� 3��</span>
						</li>
						<li class="">
							<span class=" ">���翵</span> <span
								class="">| 50��</span>
						</li>
						<li class="">
							<span class=" ">��ĥ��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 57�� 6��</span>
						</li>
						<li class="">
							<span class=" ">�ֽ���</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 59��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 60��</span>
						</li>
						<li class="">
							<span class=" ">����</span> <span
								class="">| 66�� 12��</span>
						</li>
						<li class="">
							<span class=" ">���뼱</span> <span
								class="">| 62�� 1��</span>
						</li>
						<li class="">
							<span class=" ">����Ȳ</span>
						</li>
						<li class="">
							<span class=" ">����ȣ</span> <span
								class="">| 62�� 8��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 75�� 9��</span>
						</li>
						<li class="">
							<span class=" ">�̿���</span> <span
								class="">| 59�� 1��</span>
						</li>
						<li class="">
							<span class=" ">�ɻ��</span> <span
								class="">| 59�� 5��</span>
						</li>
						<li class="">
							<span class=" ">�ڿ��</span>
						</li>
						<li class="">
							<span class=" ">�̾��</span>
						</li>
						<li class="">
							<span class=" ">ȫ��ö</span>
						</li>
						<li class="">
							<span class=" ">�����</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 54��</span>
						</li>
						<li class="">
							<span class=" ">���</span>
						</li>
						<li class="">
							<span class=" ">�迵õ</span> <span
								class="">| 56�� 1��</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">���ö</span> <span
								class="">| 56�� 5��</span>
						</li>
						<li class="">
							<span class=" ">�̿���</span> <span
								class="">| 60��</span>
						</li>
						<li class="">
							<span class=" ">�ѽ¼�</span> <span
								class="">| 76�� 10��</span>
						</li>
						<li class="">
							<span class=" ">����</span>
						</li>
						<li class="">
							<span class=" ">ȫ����</span> <span
								class="">| 72�� 6��</span>
						</li>
						<li class="">
							<span class=" ">���캹</span> <span
								class="">| 69�� 10��</span>
						</li>
						<li class="">
							<span class=" ">��â��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 54�� 6��</span>
						</li>
						<li class="">
							<span class=" ">�ڼ���</span>
						</li>
						<li class="">
							<span class=" ">�輺��</span> <span
								class="">| 38��</span>
						</li>
						<li class="">
							<span class=" ">Ȳ����</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 85�� 11��</span>
						</li>
						<li class="">
							<span class=" ">�����</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 45�� 4��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 78�� 6��</span>
						</li>
						<li class="">
							<span class=" ">�ǻ�ȯ</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 73�� 5��</span>
						</li>
						<li class="">
							<span class=" ">���μ�</span> <span
								class="">| 49��</span>
						</li>
						<li class="">
							<span class=" ">����Ȳ</span> <span
								class="">| 55�� 5��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 64�� 10��</span>
						</li>
						<li class="">
							<span class=" ">�պ���</span> <span
								class="">| 70�� 8��</span>
						</li>
						<li class="">
							<span class=" ">�纸��</span> <span
								class="">| 69�� 9��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 65�� 9��</span>
						</li>
						<li class="">
							<span class=" ">�纴��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 70���</span>
						</li>
						<li class="">
							<span class=" ">����ȯ</span> <span
								class="">| 56���</span>
						</li>
						<li class="">
							<span class=" ">��ȣ��</span> <span
								class="">| 55���</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 08���</span>
						</li>
						<li class="">
							<span class=" ">�㿵��</span> <span
								class="">| 68���</span>
						</li>
						<li class="">
							<span class=" ">�ſ���</span> <span
								class="">| 43���</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 53���</span>
						</li>
						<li class="">
							<span class=" ">�۱�ö</span> <span
								class="">| 95���</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 56���</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 63���</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 45��</span>
						</li>
						<li class="">
							<span class=" ">��âȭ</span> <span
								class="">| 60��</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 48��</span>
						</li>
						<li class="">
							<span class=" ">�̰溸</span> <span
								class="">| 73�� 5��</span>
						</li>
						<li class="">
							<span class=" ">�ſ���</span> <span
								class="">| 43�� 9��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 09���</span>
						</li>
						<li class="">
							<span class=" ">���ؼ�</span> <span
								class="">| 45�� 11��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 56�� 9��</span>
						</li>
						<li class="">
							<span class=" ">�̿���</span> <span
								class="">| 56��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 33��</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">���ر�</span>
						</li>
						<li class="">
							<span class=" ">�뿤</span> <span
								class="">| 45��</span>
						</li>
						<li class="">
							<span class=" ">�˷���</span> <span
								class="">| 40��</span>
						</li>
						<li class="">
							<span class=" ">������</span> <span
								class="">| 21��</span>
						</li>
						<li class="">
							<span class=" ">�ڱ�ȣ</span> <span
								class="">| 66�� 8��</span>
						</li>
						<li class="">
							<span class=" ">�̼���</span> <span
								class="">| 88�� 10��</span>
						</li>
						<li class="">
							<span class=" ">����ö</span>
						</li>
						<li class="">
							<span class=" ">������</span>
						</li>
						<li class="">
							<span class=" ">�����</span> <span
								class="">| 52���</span>
						</li>
						<li class=""><span class=" ">���뼮</span>,56���</span></li>
						<li class=""><span class=" ">�ڰ泲</span>,54���</span></li>
						<li class=""><span class=" ">������</span>,62��</span></li>
						<li class=""><span class=" ">������</span></li>
						<li class=""><span class=" ">�迵ȣ</span></li>
						<li class=""><span class=" ">�ڼ���</span></li>
						<li class=""><span class=" ">��ȿ��</span>,59��</span></li>
						<li class=""><span class=" ">�����</span>,54��</span></li>
						<li class=""><span class=" ">��ÿ�</span> | 2-1�� <span class=" ">| ��</span></li>