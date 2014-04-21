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


						김단비,2-1반,여
						김현이,2-1반,여
						김효빈,2-1반,여
						류채은,2-1반,여
						박도연,2-1반,여
						전희진,2-1반,여
						장애진,2-1반,여
						김다인,2-1반,여
						김은지,2-1반,여
						이정현,2-1반,여
						설수빈,2-1반,여
						오혜빈,2-1반,여
						이다인,2-1반,여
						박소희,2-1반,여
						이주아,2-1반,여
						최민지,2-1반,여
						장현정,2-1반,여
						전영수,2-1반,여
						권재희,2-1반,여
						이인서,2-2반,여
						김채은,2-2반,여
						한승우,2-2반,여
						박선영,2-2반,여
						조수빈,2-2반,여
						손정아,2-2반,여
						전혜린,2-2반,여
						박수빈,2-2반,여
						이예림,2-2반,여
						유가영,2-2반,여
						김다혜,2-2반,여
						박솔비,2-3반,여
						김주희,2-3반,여
						김성민,2-3반,여
						김도연,2-3반,여
						최민지,2-3반,여
						최은혜,2-3반,여
						양정원,2-3반,여
						정현진,2-3반,여
						정복진,2-4반,남
						김승래,2-4반,남
						정대진,2-4반,남
						조대섭,2-4반,남
						위득희,2-4반,남
						엄찬호,2-4반,남
						최승현,2-4반,남
						양태환,2-4반,남
						나정은,2-4반,남
						김수용,2-5반,남
						김수빈,2-5반,남
						나종문,2-5반,남
						임형민,2-5반,남
						송광현,2-5반,남
						고영창,2-5반,남
						김선우,2-5반,남
						박준혁,2-5반,남
						권지혁,2-5반,남
						구성빈,2-6반,남
						임대현,2-6반,남
						안민수,2-6반,남
						김승재,2-6반,남
						김민찬,2-6반,남
						고현석,2-6반,남
						이한일,2-6반,남
						한상혁,2-6반,남
						이종범,2-6반,남
						신영진,2-6반,남
						박호진,2-6반,남
						김유한,2-6반,남
						한희민,2-6반,남
						
						
						<li class="">
							<span class=" ">김진태</span> | 2-7반 <span
								class=" ">| 남</span>
						</li>
						<li class="">
							<span class=" ">김태영</span> | 2-8반 <span
								class=" ">| 남</span>
						</li>
						<li class="">
							<span class=" ">김용빈</span> | 2-8반 <span
								class=" ">| 남</span>
						</li>
						<li class="">
							<span class=" ">박소윤</span> | 2-9반 <span
								class=" ">| 여</span>
						</li>
						<li class="">
							<span class=" ">김민경</span> | 2-9반 <span
								class=" ">| 여</span>
						</li>
						<li class="">
							<span class=" ">김소희</span> | 2-10반 <span
								class=" ">| 여</span>
						</li>
						<li class="">
							<span class=" ">강민규</span> | 교사반
						</li>
						<li class="">
							<span class=" ">이예련</span> | 교사반
						</li>
						<li class="">
							<span class=" ">김소형</span> | 교사반
						</li>
						<li class="">
							<span class=" ">정영문</span> <span
								class="text-primary">| 53년 6월</span>
						</li>
						<li class="">
							<span class=" ">장은복</span> <span
								class="text-primary">| 64년 7월</span>
						</li>
						<li class="">
							<span class=" ">강병기</span> <span
								class="text-primary">| 73년 6월</span>
						</li>
						<li class="">
							<span class=" ">김정근</span> <span
								class="text-primary">| 54년 7월</span>
						</li>
						<li class="">
							<span class=" ">김계숙</span> <span
								class="text-primary">| 62세</span>
						</li>
						<li class="">
							<span class=" ">김도영</span> <span
								class="text-primary">| 64년 6월</span>
						</li>
						<li class="">
							<span class=" ">김동수</span> <span
								class="text-primary">| 65년 11월</span>
						</li>
						<li class="">
							<span class=" ">김관수</span> <span
								class="text-primary">| 67년 1월</span>
						</li>
						<li class="">
							<span class=" ">김정호</span> <span
								class="">| 91년 9월</span>
						</li>
						<li class="">
							<span class=" ">박준호</span>
						</li>
						<li class="">
							<span class=" ">정기상</span> <span
								class="">| 58년</span>
						</li>
						<li class="">
							<span class=" ">김병규</span> <span
								class="">| 61년 8월</span>
						</li>
						<li class="">
							<span class=" ">임은영</span> <span
								class="">| 70년 9월</span>
						</li>
						<li class="">
							<span class=" ">조요셉</span> <span
								class="">| 8세</span>
						</li>
						<li class="">
							<span class=" ">김성민</span> <span
								class="">| 77년 11월</span>
						</li>
						<li class="">
							<span class=" ">박승용</span> <span
								class="">| 55년 3월</span>
						</li>
						<li class="">
							<span class=" ">최재영</span> <span
								class="">| 50세</span>
						</li>
						<li class="">
							<span class=" ">윤칠상</span>
						</li>
						<li class="">
							<span class=" ">오영진</span> <span
								class="">| 57년 6월</span>
						</li>
						<li class="">
							<span class=" ">최승필</span>
						</li>
						<li class="">
							<span class=" ">이현숙</span>
						</li>
						<li class="">
							<span class=" ">김종서</span> <span
								class="">| 59세</span>
						</li>
						<li class="">
							<span class=" ">이중재</span> <span
								class="">| 60세</span>
						</li>
						<li class="">
							<span class=" ">고영구</span> <span
								class="">| 66년 12월</span>
						</li>
						<li class="">
							<span class=" ">오용선</span> <span
								class="">| 62년 1월</span>
						</li>
						<li class="">
							<span class=" ">김종황</span>
						</li>
						<li class="">
							<span class=" ">유종호</span> <span
								class="">| 62년 8월</span>
						</li>
						<li class="">
							<span class=" ">고경진</span> <span
								class="">| 75년 9월</span>
						</li>
						<li class="">
							<span class=" ">이원종</span> <span
								class="">| 59년 1월</span>
						</li>
						<li class="">
							<span class=" ">심상길</span> <span
								class="">| 59년 5월</span>
						</li>
						<li class="">
							<span class=" ">박용운</span>
						</li>
						<li class="">
							<span class=" ">이양심</span>
						</li>
						<li class="">
							<span class=" ">홍태철</span>
						</li>
						<li class="">
							<span class=" ">김충경</span>
						</li>
						<li class="">
							<span class=" ">서희견</span> <span
								class="">| 54세</span>
						</li>
						<li class="">
							<span class=" ">허웅</span>
						</li>
						<li class="">
							<span class=" ">김영천</span> <span
								class="">| 56년 1월</span>
						</li>
						<li class="">
							<span class=" ">정원진</span>
						</li>
						<li class="">
							<span class=" ">오수민</span>
						</li>
						<li class="">
							<span class=" ">김기철</span> <span
								class="">| 56년 5월</span>
						</li>
						<li class="">
							<span class=" ">이원일</span> <span
								class="">| 60세</span>
						</li>
						<li class="">
							<span class=" ">한승석</span> <span
								class="">| 76년 10월</span>
						</li>
						<li class="">
							<span class=" ">고성태</span>
						</li>
						<li class="">
							<span class=" ">홍영대</span> <span
								class="">| 72년 6월</span>
						</li>
						<li class="">
							<span class=" ">변우복</span> <span
								class="">| 69년 10월</span>
						</li>
						<li class="">
							<span class=" ">정창진</span>
						</li>
						<li class="">
							<span class=" ">차은옥</span> <span
								class="">| 54년 6월</span>
						</li>
						<li class="">
							<span class=" ">박세웅</span>
						</li>
						<li class="">
							<span class=" ">김성묵</span> <span
								class="">| 38세</span>
						</li>
						<li class="">
							<span class=" ">황봉령</span>
						</li>
						<li class="">
							<span class=" ">최은수</span>
						</li>
						<li class="">
							<span class=" ">강봉길</span> <span
								class="">| 85년 11월</span>
						</li>
						<li class="">
							<span class=" ">김대현</span>
						</li>
						<li class="">
							<span class=" ">이태주</span> <span
								class="">| 45년 4월</span>
						</li>
						<li class="">
							<span class=" ">구본희</span> <span
								class="">| 78년 6월</span>
						</li>
						<li class="">
							<span class=" ">권상환</span>
						</li>
						<li class="">
							<span class=" ">전병삼</span>
						</li>
						<li class="">
							<span class=" ">최은수</span> <span
								class="">| 73년 5월</span>
						</li>
						<li class="">
							<span class=" ">양인석</span> <span
								class="">| 49세</span>
						</li>
						<li class="">
							<span class=" ">김종황</span> <span
								class="">| 55년 5월</span>
						</li>
						<li class="">
							<span class=" ">이종섭</span> <span
								class="">| 64년 10월</span>
						</li>
						<li class="">
							<span class=" ">왕봉영</span> <span
								class="">| 70년 8월</span>
						</li>
						<li class="">
							<span class=" ">양보성</span> <span
								class="">| 69년 9월</span>
						</li>
						<li class="">
							<span class=" ">김승재</span> <span
								class="">| 65년 9월</span>
						</li>
						<li class="">
							<span class=" ">양병옥</span>
						</li>
						<li class="">
							<span class=" ">박은경</span> <span
								class="">| 70년생</span>
						</li>
						<li class="">
							<span class=" ">강인환</span> <span
								class="">| 56년생</span>
						</li>
						<li class="">
							<span class=" ">윤호실</span> <span
								class="">| 55년생</span>
						</li>
						<li class="">
							<span class=" ">전지영</span> <span
								class="">| 08년생</span>
						</li>
						<li class="">
							<span class=" ">허영기</span> <span
								class="">| 68년생</span>
						</li>
						<li class="">
							<span class=" ">신영자</span> <span
								class="">| 43년생</span>
						</li>
						<li class="">
							<span class=" ">전영문</span> <span
								class="">| 53년생</span>
						</li>
						<li class="">
							<span class=" ">송기철</span> <span
								class="">| 95년생</span>
						</li>
						<li class="">
							<span class=" ">최찬열</span> <span
								class="">| 56년생</span>
						</li>
						<li class="">
							<span class=" ">김종임</span> <span
								class="">| 63년생</span>
						</li>
						<li class="">
							<span class=" ">이현숙</span> <span
								class="">| 45세</span>
						</li>
						<li class="">
							<span class=" ">심창화</span> <span
								class="">| 60세</span>
						</li>
						<li class="">
							<span class=" ">윤길옥</span> <span
								class="">| 48세</span>
						</li>
						<li class="">
							<span class=" ">이경보</span> <span
								class="">| 73년 5월</span>
						</li>
						<li class="">
							<span class=" ">신영자</span> <span
								class="">| 43년 9월</span>
						</li>
						<li class="">
							<span class=" ">권지영</span> <span
								class="">| 09년생</span>
						</li>
						<li class="">
							<span class=" ">이준석</span> <span
								class="">| 45년 11월</span>
						</li>
						<li class="">
							<span class=" ">손지태</span> <span
								class="">| 56년 9월</span>
						</li>
						<li class="">
							<span class=" ">이영재</span> <span
								class="">| 56세</span>
						</li>
						<li class="">
							<span class=" ">강혜성</span> <span
								class="">| 33세</span>
						</li>
						<li class="">
							<span class=" ">박찬길</span>
						</li>
						<li class="">
							<span class=" ">조준기</span>
						</li>
						<li class="">
							<span class=" ">노엘</span> <span
								class="">| 45세</span>
						</li>
						<li class="">
							<span class=" ">알렉스</span> <span
								class="">| 40세</span>
						</li>
						<li class="">
							<span class=" ">오의준</span> <span
								class="">| 21세</span>
						</li>
						<li class="">
							<span class=" ">박기호</span> <span
								class="">| 66년 8월</span>
						</li>
						<li class="">
							<span class=" ">이수진</span> <span
								class="">| 88년 10월</span>
						</li>
						<li class="">
							<span class=" ">송지철</span>
						</li>
						<li class="">
							<span class=" ">김종임</span>
						</li>
						<li class="">
							<span class=" ">김규찬</span> <span
								class="">| 52년생</span>
						</li>
						<li class=""><span class=" ">오용석</span>,56년생</span></li>
						<li class=""><span class=" ">박경남</span>,54년생</span></li>
						<li class=""><span class=" ">전영준</span>,62세</span></li>
						<li class=""><span class=" ">신정훈</span></li>
						<li class=""><span class=" ">김영호</span></li>
						<li class=""><span class=" ">박성용</span></li>
						<li class=""><span class=" ">유효실</span>,59세</span></li>
						<li class=""><span class=" ">서희근</span>,54세</span></li>
						<li class=""><span class=" ">김시연</span> | 2-1반 <span class=" ">| 여</span></li>