<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />

<link rel="stylesheet" href="./css/jquery.mobile-1.4.0.css" />

<link rel="stylesheet" href="./css/defaultstyle.css" />

<script src="./js/jquery-1.9.1.min.js"></script>
<script src="./js/jquery.mobile-1.4.0.min.js"></script> 


<title>Sewol</title>
<style type="text/css">

.right { float: right; }

.sewool_header {
	background: #fff;
	border-color: #333!important;
}

.sewool_title {

}

.sewool_title_text {
	font-family:Georgia,dotum,'돋움',"Time New Roman",serif;
	color:#333;
	font-size:160%;
	font-weight: bold;
}

.content { 

	margin:30px auto; 
	width: 95%;

}

.content_header {
	background-color: #fff;
	margin-bottom: 10px;
	overflow: auto;
	
	text-align: center;
	margin: 0px auto;
	
	padding: 15px;
	
}

.title {
	font-family:Georgia,dotum,'돋움',"Time New Roman",serif;
	
	font-size: 100%;
	font-weight: bold;
	margin-top:10px;
	margin-bottom: 15px;
	
	
}

.content_header_people {
	display: table;
	
	font-size:120%;
	
	width: 100%;
	
	background-color:#fff;
	border: 1px #ddd solid;
	
	margin-bottom:15px;
	
}

.people_save { color: #428bca; }
.people_lost { color: #F3E216; }
.people_die { color: #a94442; }


.board {
	width: 100%;
	margin:0px;
}

.save {
	background-color:#f4f8fa;
}
.die {
	background-color:#fdf7f7;
}

.content_die {
	background-color:#fdf7f7;
	border:2px solid;
	border-color:#d9534f;
	padding:1%;
}

.content_save {
	background-color:#f4f8fa;
	border:2px solid;
	border-color:#5bc0de;
	padding:1%;
	
}

.save_text {
	color: #5bc0de;
}

.die_text {
	color: #d9534f;
}


.peoples {
  
  	display:-webkit-inline-box;
  	background:#f9f9f9;
  	padding:10px;
  	overflow:auto;
  	margin:1%;
  	font-size: 90%;
}

.news {
	display: -webkit-inline-box;
	margin-left:5%;
}

.menu_ul {
	display: -webkit-box;
	width:100%;
	
	font-size:95%;
	background-color:#fff;
	
	margin-bottom:10px;
}

.menu_li {
	padding: 1%;
	border:1px #ddd solid;
	color: #333;
	width: 50%;
	text-align: center;
	
}

.menu_li:HOVER {
	text-decoration:none;
	background-color:#eee;
	border-color:#eee #eee #ddd;
	
}


.menu_text {
	font-size: 120%;
	color: #333;
	font-weight: bold;
	padding:10px 15px;
}



.savesewol_div {
	width:100%;
	text-align: center;
	margin: 0px auto;
}

.news {
	margin: 10px;
}

.screen_img {
	width: 100%;
	max-width:100%;
	min-width: 180px;
	
	height: auto;
	

}

.message_name {
	vertical-align:bottom;	
	border-bottom-width:2px;
	border:1px #ddd solid;
	border-bottom:2px solid #ddd;
	padding:8px;
	line-height:1.4;
	text-align:left;
	font-weight:bold;
}

.message_content {
	border:1px solid #ddd;
	padding:8px;
	line-height:1.4;
	vertical-align:top;
	border-top:1px solid #ddd;
	box-sizing:border-box;
	border-color: gray;
	
	font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
	color:#333;
	background-color:#F7F7F7;

}


.messageTitle {
	font-size: 110%;
	font-weight: 400;
	line-height: 1;
	color: #999;
}


.write {
	vertical-align:bottom;	
	border-bottom-width:2px;
	border:1px #ddd solid;
	border-bottom:2px solid #ddd;
	padding:8px;
	line-height:1.4;
	text-align:left;
	font-weight:bold;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#people-search").keyup(function(){
		
		$(".peoples").css({ "display":"none" });
		
		for(var i = 1; i<=193; i++){
			if($("#people_val"+i).text() == $("#people-search").val() ){
				
				$(".peoples_"+i).css({ "display":"block" });
			}
		}
		
		if($("#people-search").val() == ""){
			$(".peoples").css({ "display":"block" });
		}
		
		
		$("#top_area").load(function(){
			
			alert($(this.contentWindow.document.body).height());
			
		});
		
		
	});
	
	
	
	
});

	



//파일 업로드 호출 스크립트
function messageWrite(){
     goExcelUploadAjaxLoad();  // 백그라운드 로드시킬 스크립트 호출
   
   	 var frm = $("#messageWrite");
	 frm.attr("action", "./sewoolAction.jsp");
	 frm.submit();
     
}

function goExcelUploadAjaxLoad(i, typ) {
     $(document).ajaxError(function(info, xhr) {
          if (xhr.status == 500)
               alert("error.");
          });

          $(function() {
        	
        	  var vForm = $("#messageWrite");        		  
        	 vForm.ajaxForm(FileuploadCallback);  // 완료 후 콜백 함수 호출
        	  
        	 
          });
        
}




</script>
</head>
<body>
	<div id="wrap">
		<div data-role="page" id="sewol">
			<header class="header" data-role="header">
				<div data-role="header" class="header sewool_header" data-theme="c" >
				
					<a href="./index.jsp" class="header_main" data-transition="slide" data-direction="reverse" 
						data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" data-ajax="false">
						<span class="header_main_left_ico">
							<span class="ui-btn-text">
								<span class="menu-bar a"></span>
								<span class="menu-bar b"></span>
								<span class="menu-bar c"></span>
							</span>
						</span>
					</a>
							
					<h1 class="sewool_title" role="heading" aria-level="1">
						<span class="sewool_title_text">세월호</span>
					</h1>
				</div>
			</header>
			
			
			
			
			<section class="content" data-role="content">
				<div class="menu">
					<ul class="menu_ul">
						<li class="menu_li"><a href="#sewol" class="menu_text" style="color: #333;" >현재상황</a></li>
						<li class="menu_li"><a href="#message" class="menu_text" style="color: #333;" >희망의 메세지</a></li>
					</ul>
				</div>
				
				<div id="savesewol_div">
					<iframe id="savesewol" src=" http://intropage.net/state_sewol/" scrolling="no" frameborder="0" allowtransparency="true" width="100%" height="1280px"  style="border: none; max-width: 100%; min-width: 180px; ">
						<p>출처:http://intropage.net/SaveSewol</p>
					</iframe>
					
				</div>
				<br>
				<br>
				<div class="content_header">
					
					<p class="title">'세월호' 실종자들의 무사귀환을 기원합니다.</p>
					
					<table class="content_header_people">
						<tr>
							<th>구조자</th>
							<th>실종자</th>
							<th>사망자</th>
						</tr>
						<tr>
							<td class="people_save">174</td>
							<td class="people_lost">238</td>
							<td class="people_die">64</td>
						</tr>
					</table>
				</div>
				
				<div>
					<span>	
						<input type="search" name="people-search" id="people-search" data-mini="true" />
					</span>
				</div>
				
				<br>
				<br>
				<div class="content_save">
					<p class="title" >
						<span class="save_text">구조자 명단</span>			
					</p>
						<div class="board " >
							<div class="peoples peoples_1"><span id="people_val1">김단비</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_2"><span id="people_val2">김현이</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_3"><span id="people_val3">김효빈</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_4"><span id="people_val4">류채은</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_5"><span id="people_val5">박도연</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_6"><span id="people_val6">전희진</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_7"><span id="people_val7">장애진</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_8"><span id="people_val8">김다인</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_9"><span id="people_val9">김은지</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_10"><span id="people_val10">이정현</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_11"><span id="people_val11">설수빈</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_12"><span id="people_val12">오혜빈</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_13"><span id="people_val13">이다인</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_14"><span id="people_val14">박소희</span> | 2-1반 <span class="">| 여</span></div>
							<div class="peoples peoples_15"><span id="people_val15">이주아</span> | 2-1반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_16"><span id="people_val16">최민지</span> | 2-1반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_17"><span id="people_val17">장현정</span> | 2-1반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_18"><span id="people_val18">전영수</span> | 2-1반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_19"><span id="people_val19">권재희</span> | 2-1반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_20"><span id="people_val20">이인서</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_21"><span id="people_val21">김채은</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_22"><span id="people_val22">한승우</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_23"><span id="people_val23">박선영</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_24"><span id="people_val24">조수빈</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_25"><span id="people_val25">손정아</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_26"><span id="people_val26">전혜린</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_27"><span id="people_val27">박수빈</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_28"><span id="people_val28">이예림</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_29"><span id="people_val29">유가영</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_30"><span id="people_val30">김다혜</span> | 2-2반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_31"><span id="people_val31">박솔비</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_32"><span id="people_val32">김주희</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_33"><span id="people_val33">김성민</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_34"><span id="people_val34">김도연</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_35"><span id="people_val35">최민지</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_36"><span id="people_val36">최은혜</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_37"><span id="people_val37">양정원</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_38"><span id="people_val38">정현진</span> | 2-3반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_39"><span id="people_val39">정복진</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_40"><span id="people_val40">김승래</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_41"><span id="people_val41">정대진</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_42"><span id="people_val42">조대섭</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_43"><span id="people_val43">위득희</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_44"><span id="people_val44">엄찬호</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_45"><span id="people_val45">최승현</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_46"><span id="people_val46">양태환</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_47"><span id="people_val47">나정은</span> | 2-4반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_48"><span id="people_val48">김수용</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_49"><span id="people_val49">김수빈</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_50"><span id="people_val50">나종문</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_51"><span id="people_val51">임형민</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_52"><span id="people_val52">송광현</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_53"><span id="people_val53">고영창</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_54"><span id="people_val54">김선우</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_55"><span id="people_val55">박준혁</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_56"><span id="people_val56">권지혁</span> | 2-5반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_57"><span id="people_val57">구성빈</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_58"><span id="people_val58">임대현</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_59"><span id="people_val59">안민수</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_60"><span id="people_val60">김승재</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_61"><span id="people_val61">김민찬</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_62"><span id="people_val62">고현석</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_63"><span id="people_val63">이한일</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_64"><span id="people_val64">한상혁</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_65"><span id="people_val65">이종범</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_66"><span id="people_val66">신영진</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_67"><span id="people_val67">박호진</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_68"><span id="people_val68">김유한</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_69"><span id="people_val69">한희민</span> | 2-6반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_70"><span id="people_val70">김진태</span> | 2-7반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_71"><span id="people_val71">김태영</span> | 2-8반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_72"><span id="people_val72">김용빈</span> | 2-8반 <span class=" ">| 남</span></div>
							<div class="peoples peoples_73"><span id="people_val73">박소윤</span> | 2-9반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_74"><span id="people_val74">김민경</span> | 2-9반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_75"><span id="people_val75">김소희</span> | 2-10반 <span class=" ">| 여</span></div>
							<div class="peoples peoples_76"><span id="people_val76">강민규</span> | 교사</div>
							<div class="peoples peoples_77"><span id="people_val77">이예련</span> | 교사</div>
							<div class="peoples peoples_78"><span id="people_val78">김소형</span> | 교사</div>
							<div class="peoples peoples_79"><span id="people_val79">정영문</span> <span class="">| 53년 6월</span></div>
							<div class="peoples peoples_80"><span id="people_val80">장은복</span> <span class="">| 64년 7월</span></div>
							<div class="peoples peoples_81"><span id="people_val81">강병기</span> <span class="">| 73년 6월</span></div>
							<div class="peoples peoples_82"><span id="people_val82">김정근</span> <span class="">| 54년 7월</span></div>
							<div class="peoples peoples_83"><span id="people_val83">김계숙</span> <span class="">| 62세</span></div>
							<div class="peoples peoples_84"><span id="people_val84">김도영</span><span class="">| 64년 6월</span></div>
							<div class="peoples peoples_85"><span id="people_val85">김동수</span><span class="">| 65년 11월</span></div>
							<div class="peoples peoples_86"><span id="people_val86">김관수</span><span class="">| 67년 1월</span></div>
							<div class="peoples peoples_87"><span id="people_val87">김정호</span><span class="">| 91년 9월</span></div>
							<div class="peoples peoples_88"><span id="people_val88">박준호</span></div>
							<div class="peoples peoples_89"><span id="people_val89">정기상</span><span class="">| 58년</span></div>
							<div class="peoples peoples_90"><span id="people_val90">김병규</span><span class="">| 61년 8월</span></div>
							<div class="peoples peoples_91"><span id="people_val91">임은영</span><span class="">| 70년 9월</span></div>
							<div class="peoples peoples_92"><span id="people_val92">조요셉</span><span class="">| 8세</span></div>
							<div class="peoples peoples_93"><span id="people_val93">김성민</span><span class="">| 77년 11월</span></div>
							<div class="peoples peoples_94"><span id="people_val94">박승용</span><span class="">| 55년 3월</span></div>
							<div class="peoples peoples_95"><span id="people_val95">최재영</span><span class="">| 50세</span></div>
							<div class="peoples peoples_96"><span id="people_val96">윤칠상</span></div>
							<div class="peoples peoples_97"><span id="people_val97">오영진</span><span class="">| 57년 6월</span></div>
							<div class="peoples peoples_98"><span id="people_val98">최승필</span></div>
							<div class="peoples peoples_99"><span id="people_val99">이현숙</span></div>
							<div class="peoples peoples_100"><span id="people_val100">김종서</span><span class="">| 59세</span></div>
							<div class="peoples peoples_101"><span id="people_val101">이중재</span> <span class="">| 60세</span></div>
							<div class="peoples peoples_102"><span id="people_val102">고영구</span> <span class="">| 66년 12월</span></div>
							<div class="peoples peoples_103"><span id="people_val103">오용선</span> <span class="">| 62년 1월</span></div>
							<div class="peoples peoples_104"><span id="people_val104">김종황</span></div>
							<div class="peoples peoples_105"><span id="people_val105">유종호</span> <span class="">| 62년 8월</span></div>
							<div class="peoples peoples_106"><span id="people_val106">고경진</span> <span class="">| 75년 9월</span></div>
							<div class="peoples peoples_107"><span id="people_val107">이원종</span> <span class="">| 59년 1월</span></div>
							<div class="peoples peoples_108"><span id="people_val108">심상길</span> <span class="">| 59년 5월</span></div>
							<div class="peoples peoples_109"><span id="people_val109">박용운</span></div>
							<div class="peoples peoples_110"><span id="people_val110">이양심</span></div>
							<div class="peoples peoples_111"><span id="people_val111">홍태철</span></div>
							<div class="peoples peoples_112"><span id="people_val112">김충경</span></div>
							<div class="peoples peoples_113"><span id="people_val113">서희견</span> <span class="">| 54세</span></div>
							<div class="peoples peoples_114"><span id="people_val114">허웅</span></div>
							<div class="peoples peoples_115"><span id="people_val115">김영천</span> <span class="">| 56년 1월</span></div>
							<div class="peoples peoples_116"><span id="people_val116">정원진</span></div>
							<div class="peoples peoples_117"><span id="people_val117">오수민</span></div>
							<div class="peoples peoples_118"><span id="people_val118">김기철</span> <span class="">| 56년 5월</span></div>
							<div class="peoples peoples_119"><span id="people_val119">이원일</span> <span class="">| 60세</span></div>
							<div class="peoples peoples_120"><span id="people_val120">한승석</span> <span class="">| 76년 10월</span></div>
							<div class="peoples peoples_121"><span id="people_val121">고성태</span></div>
							<div class="peoples peoples_122"><span id="people_val122">홍영대</span> <span class="">| 72년 6월</span></div>
							<div class="peoples peoples_123"><span id="people_val123">변우복</span> <span class="">| 69년 10월</span></div>
							<div class="peoples peoples_124"><span id="people_val124">정창진</span></div>
							<div class="peoples peoples_125"><span id="people_val125">차은옥</span> <span class="">| 54년 6월</span></div>
							<div class="peoples peoples_126"><span id="people_val126">박세웅</span></div>
							<div class="peoples peoples_127"><span id="people_val127">김성묵</span> <span class="">| 38세</span></div>
							<div class="peoples peoples_128"><span id="people_val128">황봉령</span></div>
							<div class="peoples peoples_129"><span id="people_val129">최은수</span></div>
							<div class="peoples peoples_130"><span id="people_val130">강봉길</span> <span class="">| 85년 11월</span></div>
							<div class="peoples peoples_131"><span id="people_val131">김대현</span></div>
							<div class="peoples peoples_132"><span id="people_val132">이태주</span> <span class="">| 45년 4월</span></div>
							<div class="peoples peoples_133"><span id="people_val133">구본희</span> <span class="">| 78년 6월</span></div>
							<div class="peoples peoples_134"><span id="people_val134">권상환</span></div>
							<div class="peoples peoples_135"><span id="people_val135">전병삼</span></div>
							<div class="peoples peoples_136"><span id="people_val136">최은수</span> <span class="">| 73년 5월</span></div>
							<div class="peoples peoples_137"><span id="people_val137">양인석</span> <span class="">| 49세</span></div>
							<div class="peoples peoples_138"><span id="people_val138">김종황</span> <span class="">| 55년 5월</span></div>
							<div class="peoples peoples_139"><span id="people_val139">이종섭</span> <span class="">| 64년 10월</span></div>
							<div class="peoples peoples_140"><span id="people_val140">왕봉영</span> <span class="">| 70년 8월</span></div>
							<div class="peoples peoples_141"><span id="people_val141">양보성</span> <span class="">| 69년 9월</span></div>
							<div class="peoples peoples_142"><span id="people_val142">김승재</span> <span class="">| 65년 9월</span></div>
							<div class="peoples peoples_143"><span id="people_val143">양병옥</span></div>
							<div class="peoples peoples_144"><span id="people_val144">박은경</span> <span class="">| 70년생</span></div>
							<div class="peoples peoples_145"><span id="people_val145">강인환</span> <span class="">| 56년생</span></div>
							<div class="peoples peoples_146"><span id="people_val146">윤호실</span> <span class="">| 55년생</span></div>
							<div class="peoples peoples_147"><span id="people_val147">전지영</span> <span class="">| 08년생</span></div>
							<div class="peoples peoples_148"><span id="people_val148">허영기</span> <span class="">| 68년생</span></div>
							<div class="peoples peoples_149"><span id="people_val149">신영자</span> <span class="">| 43년생</span></div>
							<div class="peoples peoples_150"><span id="people_val150">전영문</span> <span class="">| 53년생</span></div>
							<div class="peoples peoples_151"><span id="people_val151">송기철</span> <span class="">| 95년생</span></div>
							<div class="peoples peoples_152"><span id="people_val152">최찬열</span> <span class="">| 56년생</span></div>
							<div class="peoples peoples_153"><span id="people_val153">김종임</span><span class="">| 63년생</span></div>
							<div class="peoples peoples_154"><span id="people_val154">이현숙</span> <span class="">| 45세</span></div>
							<div class="peoples peoples_155"><span id="people_val155">심창화</span> <span class="">| 60세</span></div>
							<div class="peoples peoples_156"><span id="people_val156">윤길옥</span> <span class="">| 48세</span></div>
							<div class="peoples peoples_157"><span id="people_val157">이경보</span> <span class="">| 73년 5월</span></div>
							<div class="peoples peoples_158"><span id="people_val158">신영자</span> <span class="">| 43년 9월</span></div>
							<div class="peoples peoples_159"><span id="people_val159">권지영</span><span class="">| 09년생</span></div>
							<div class="peoples peoples_160"><span id="people_val160">이준석</span><span class="">| 45년 11월</span></div>
							<div class="peoples peoples_161"><span id="people_val161">손지태</span><span class="">| 56년 9월</span></div>
							<div class="peoples peoples_162"><span id="people_val162">이영재</span> <span class="">| 56세</span></div>
							<div class="peoples peoples_163"><span id="people_val163">강혜성</span><span	class="">| 33세</span></div>
							<div class="peoples peoples_164"><span id="people_val164">박찬길</span></div>
							<div class="peoples peoples_165"><span id="people_val165">조준기</span></div>
							<div class="peoples peoples_166"><span id="people_val166">노엘</span><span class="">| 45세</span></div>
							<div class="peoples peoples_167"><span id="people_val167">알렉스</span><span class="">| 40세</span></div>
							<div class="peoples peoples_168"><span id="people_val168">오의준</span><span class="">| 21세</span></div>
							<div class="peoples peoples_169"><span id="people_val169">박기호</span><span class="">| 66년 8월</span></div>
							<div class="peoples peoples_170"><span id="people_val170">이수진</span><span class="">| 88년 10월</span></div>
							<div class="peoples peoples_171"><span id="people_val171">송지철</span></div>
							<div class="peoples peoples_172"><span id="people_val172">김종임</span></div>
							<div class="peoples peoples_173"><span id="people_val173">김규찬</span><span class="">| 52년생</span></div>
							<div class="peoples peoples_174"><span id="people_val174">오용석</span><span class="">| 56년생</span></div>
							<div class="peoples peoples_175"><span id="people_val175">박경남</span><span class="">| 54년생</span></div>
							<div class="peoples peoples_176"><span id="people_val176">전영준</span><span class="">| 62세</span></div>
							<div class="peoples peoples_177"><span id="people_val177">신정훈</span></div>
							<div class="peoples peoples_178"><span id="people_val178">김영호</span></div>
							<div class="peoples peoples_179"><span id="people_val179">박성용</span></div>
							<div class="peoples peoples_180"><span id="people_val180">유효실</span><span class="">| 59세</span></div>
							<div class="peoples peoples_181"><span id="people_val181">서희근</span><span class="">| 54세</span></div>
							<div class="peoples peoples_182"><span id="people_val182">김시연</span> | 2-1반 <span class=" ">| 여</span></div>
						</div>
				</div>
				
				<br>
				<br>
				
				<div class="content_die">
					<p class="title" >
						<span class="die_text">사망자 명단</span> 
					</p>
					<div class="board" >
						<div class="peoples peoples_183"><span id="people_val183">박지영</span><span>| 22세</span><span>| 여</span></div>
						<div class="peoples peoples_184"><span id="people_val184">정차웅</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_185"><span id="people_val185">권오천</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_186"><span id="people_val186">임경빈</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_187"><span id="people_val187">이다운</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_188"><span id="people_val188">최예정</span><span> | 교사 </span><span>| 여</span></div>
						<div class="peoples peoples_189"><span id="people_val189">안준혁</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_190"><span id="people_val190">김주아</span><span> | 2학년 </span><span>| 남</span></div>
						<div class="peoples peoples_191"><span id="people_val191">남윤철</span><span> | 교사 </span><span>| 36세</span><span>| 남</span></div>
						<div class="peoples peoples_192"><span id="people_val192">유효실</span><span> | 29세 </span><span>| 남</span></div>
						<div class="peoples peoples_193"><span id="people_val193">이혜경</span><span> | 2학년 </span><span>| 여</span></div>
						
					</div>
				</div>
				<br>
				<br>
				<div>
					<p class="title" >뉴스 속보</p>
					<div class="news"><a href="http://news.kbs.co.kr/news/news24Pop.do"><img src="./sewol/kbs.png" style=" width: 265px;  height:81px;"></a></div>
					<div class="news"><a href="http://vod.sbs.co.kr/onair/onair_index.jsp?Channel=SBS"><img src="./sewol/sbs.png" style="width: 265px; height:81px;"></a></div>
					
				</div>
			</section>
			
		</div>
		<%
			Connection cn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				cn = DriverManager.getConnection("jdbc:mysql://tess.or.kr:3306/tessteam", "tessteam", "Ghksrud201428");
				
				
					String sql = 
							"SELECT seq, name, content, regdate	"+
							"FROM SEWOL_MESSAGE					"+
							"GROUP BY seq DESC LIMIT 10			";
						
					
					ps = cn.prepareStatement(sql);
					rs = ps.executeQuery();
		%>		
			
		<div data-role="page" id="message">
			
			<div data-role="header" class="header sewool_header" data-theme="c" >
					
				<a href="./index.jsp" class="header_main" data-transition="slide" data-direction="reverse" 
					data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" data-ajax="false">
					<span class="header_main_left_ico">
						<span class="ui-btn-text">
							<span class="menu-bar a"></span>
							<span class="menu-bar b"></span>
							<span class="menu-bar c"></span>
						</span>
					</span>
						</a>
								
						<h1 class="sewool_title" role="heading" aria-level="1">
							<span class="sewool_title_text">세월호</span>
						</h1>
			</div>
			
				
			<div data-role="content">
				<div class="menu">
					<ul class="menu_ul">
						<li class="menu_li"><a href="#sewol" class="menu_text">현재상황</a></li>
						<li class="menu_li"><a href="#message" class="menu_text">희망의 메세지</a></li>
					</ul>
				</div>
			
			
				<div>
					<img src="./sewol/message_cover.jpg" class="screen_img" >
					
					
					<div>
						<% while(rs.next()){%>
						<ul class="message_ul">
							<li class="message_name" ><%=rs.getString("name")%></li>
							<li class="message_content" ><%=rs.getString("content")%></li>
						</ul>
						<%} %>
					</div>
					<br>
					<br>
					<div class="write">
						<form name="messageWrite" action="./sewoolAction.jsp" method="post" data-ajax="false">
							<p class="messageTitle">희망의 메세지 남기기..</p>
							
							<input type="text" name="name" id="name"  placeholder="Name"/>
							<textarea name="content" id="content"></textarea>
							<button onclick="javascript:messageWrite.submit();"  data-role="button">보내기</button>
						</form>
					</div>
					
					
				
				</div>
			</div>
				
				
				
		</div>
		<%
				
			} catch (Exception e){
				e.printStackTrace();
				
			} finally {
				rs.close();
				ps.close();
				cn.close();  
			}
		
		%>
	</div>
	
	
	
	
</body>
<script type="text/javascript">
$(window).load(function(){
	
});
</script>
</html>

