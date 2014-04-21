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
	font-family:Georgia,dotum,'����',"Time New Roman",serif;
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
	font-family:Georgia,dotum,'����',"Time New Roman",serif;
	
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

	



//���� ���ε� ȣ�� ��ũ��Ʈ
function messageWrite(){
     goExcelUploadAjaxLoad();  // ��׶��� �ε��ų ��ũ��Ʈ ȣ��
   
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
        	 vForm.ajaxForm(FileuploadCallback);  // �Ϸ� �� �ݹ� �Լ� ȣ��
        	  
        	 
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
						<span class="sewool_title_text">����ȣ</span>
					</h1>
				</div>
			</header>
			
			
			
			
			<section class="content" data-role="content">
				<div class="menu">
					<ul class="menu_ul">
						<li class="menu_li"><a href="#sewol" class="menu_text" style="color: #333;" >�����Ȳ</a></li>
						<li class="menu_li"><a href="#message" class="menu_text" style="color: #333;" >����� �޼���</a></li>
					</ul>
				</div>
				
				<div id="savesewol_div">
					<iframe id="savesewol" src=" http://intropage.net/state_sewol/" scrolling="no" frameborder="0" allowtransparency="true" width="100%" height="1280px"  style="border: none; max-width: 100%; min-width: 180px; ">
						<p>��ó:http://intropage.net/SaveSewol</p>
					</iframe>
					
				</div>
				<br>
				<br>
				<div class="content_header">
					
					<p class="title">'����ȣ' �����ڵ��� �����ȯ�� ����մϴ�.</p>
					
					<table class="content_header_people">
						<tr>
							<th>������</th>
							<th>������</th>
							<th>�����</th>
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
						<span class="save_text">������ ���</span>			
					</p>
						<div class="board " >
							<div class="peoples peoples_1"><span id="people_val1">��ܺ�</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_2"><span id="people_val2">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_3"><span id="people_val3">��ȿ��</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_4"><span id="people_val4">��ä��</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_5"><span id="people_val5">�ڵ���</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_6"><span id="people_val6">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_7"><span id="people_val7">�����</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_8"><span id="people_val8">�����</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_9"><span id="people_val9">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_10"><span id="people_val10">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_11"><span id="people_val11">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_12"><span id="people_val12">������</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_13"><span id="people_val13">�̴���</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_14"><span id="people_val14">�ڼ���</span> | 2-1�� <span class="">| ��</span></div>
							<div class="peoples peoples_15"><span id="people_val15">���־�</span> | 2-1�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_16"><span id="people_val16">�ֹ���</span> | 2-1�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_17"><span id="people_val17">������</span> | 2-1�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_18"><span id="people_val18">������</span> | 2-1�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_19"><span id="people_val19">������</span> | 2-1�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_20"><span id="people_val20">���μ�</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_21"><span id="people_val21">��ä��</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_22"><span id="people_val22">�ѽ¿�</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_23"><span id="people_val23">�ڼ���</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_24"><span id="people_val24">������</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_25"><span id="people_val25">������</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_26"><span id="people_val26">������</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_27"><span id="people_val27">�ڼ���</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_28"><span id="people_val28">�̿���</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_29"><span id="people_val29">������</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_30"><span id="people_val30">�����</span> | 2-2�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_31"><span id="people_val31">�ڼֺ�</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_32"><span id="people_val32">������</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_33"><span id="people_val33">�輺��</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_34"><span id="people_val34">�赵��</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_35"><span id="people_val35">�ֹ���</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_36"><span id="people_val36">������</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_37"><span id="people_val37">������</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_38"><span id="people_val38">������</span> | 2-3�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_39"><span id="people_val39">������</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_40"><span id="people_val40">��·�</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_41"><span id="people_val41">������</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_42"><span id="people_val42">���뼷</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_43"><span id="people_val43">������</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_44"><span id="people_val44">����ȣ</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_45"><span id="people_val45">�ֽ���</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_46"><span id="people_val46">����ȯ</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_47"><span id="people_val47">������</span> | 2-4�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_48"><span id="people_val48">�����</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_49"><span id="people_val49">�����</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_50"><span id="people_val50">������</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_51"><span id="people_val51">������</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_52"><span id="people_val52">�۱���</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_53"><span id="people_val53">��â</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_54"><span id="people_val54">�輱��</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_55"><span id="people_val55">������</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_56"><span id="people_val56">������</span> | 2-5�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_57"><span id="people_val57">������</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_58"><span id="people_val58">�Ӵ���</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_59"><span id="people_val59">�ȹμ�</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_60"><span id="people_val60">�����</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_61"><span id="people_val61">�����</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_62"><span id="people_val62">������</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_63"><span id="people_val63">������</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_64"><span id="people_val64">�ѻ���</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_65"><span id="people_val65">������</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_66"><span id="people_val66">�ſ���</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_67"><span id="people_val67">��ȣ��</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_68"><span id="people_val68">������</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_69"><span id="people_val69">�����</span> | 2-6�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_70"><span id="people_val70">������</span> | 2-7�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_71"><span id="people_val71">���¿�</span> | 2-8�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_72"><span id="people_val72">����</span> | 2-8�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_73"><span id="people_val73">�ڼ���</span> | 2-9�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_74"><span id="people_val74">��ΰ�</span> | 2-9�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_75"><span id="people_val75">�����</span> | 2-10�� <span class=" ">| ��</span></div>
							<div class="peoples peoples_76"><span id="people_val76">���α�</span> | ����</div>
							<div class="peoples peoples_77"><span id="people_val77">�̿���</span> | ����</div>
							<div class="peoples peoples_78"><span id="people_val78">�����</span> | ����</div>
							<div class="peoples peoples_79"><span id="people_val79">������</span> <span class="">| 53�� 6��</span></div>
							<div class="peoples peoples_80"><span id="people_val80">������</span> <span class="">| 64�� 7��</span></div>
							<div class="peoples peoples_81"><span id="people_val81">������</span> <span class="">| 73�� 6��</span></div>
							<div class="peoples peoples_82"><span id="people_val82">������</span> <span class="">| 54�� 7��</span></div>
							<div class="peoples peoples_83"><span id="people_val83">����</span> <span class="">| 62��</span></div>
							<div class="peoples peoples_84"><span id="people_val84">�赵��</span><span class="">| 64�� 6��</span></div>
							<div class="peoples peoples_85"><span id="people_val85">�赿��</span><span class="">| 65�� 11��</span></div>
							<div class="peoples peoples_86"><span id="people_val86">�����</span><span class="">| 67�� 1��</span></div>
							<div class="peoples peoples_87"><span id="people_val87">����ȣ</span><span class="">| 91�� 9��</span></div>
							<div class="peoples peoples_88"><span id="people_val88">����ȣ</span></div>
							<div class="peoples peoples_89"><span id="people_val89">�����</span><span class="">| 58��</span></div>
							<div class="peoples peoples_90"><span id="people_val90">�躴��</span><span class="">| 61�� 8��</span></div>
							<div class="peoples peoples_91"><span id="people_val91">������</span><span class="">| 70�� 9��</span></div>
							<div class="peoples peoples_92"><span id="people_val92">�����</span><span class="">| 8��</span></div>
							<div class="peoples peoples_93"><span id="people_val93">�輺��</span><span class="">| 77�� 11��</span></div>
							<div class="peoples peoples_94"><span id="people_val94">�ڽ¿�</span><span class="">| 55�� 3��</span></div>
							<div class="peoples peoples_95"><span id="people_val95">���翵</span><span class="">| 50��</span></div>
							<div class="peoples peoples_96"><span id="people_val96">��ĥ��</span></div>
							<div class="peoples peoples_97"><span id="people_val97">������</span><span class="">| 57�� 6��</span></div>
							<div class="peoples peoples_98"><span id="people_val98">�ֽ���</span></div>
							<div class="peoples peoples_99"><span id="people_val99">������</span></div>
							<div class="peoples peoples_100"><span id="people_val100">������</span><span class="">| 59��</span></div>
							<div class="peoples peoples_101"><span id="people_val101">������</span> <span class="">| 60��</span></div>
							<div class="peoples peoples_102"><span id="people_val102">����</span> <span class="">| 66�� 12��</span></div>
							<div class="peoples peoples_103"><span id="people_val103">���뼱</span> <span class="">| 62�� 1��</span></div>
							<div class="peoples peoples_104"><span id="people_val104">����Ȳ</span></div>
							<div class="peoples peoples_105"><span id="people_val105">����ȣ</span> <span class="">| 62�� 8��</span></div>
							<div class="peoples peoples_106"><span id="people_val106">�����</span> <span class="">| 75�� 9��</span></div>
							<div class="peoples peoples_107"><span id="people_val107">�̿���</span> <span class="">| 59�� 1��</span></div>
							<div class="peoples peoples_108"><span id="people_val108">�ɻ��</span> <span class="">| 59�� 5��</span></div>
							<div class="peoples peoples_109"><span id="people_val109">�ڿ��</span></div>
							<div class="peoples peoples_110"><span id="people_val110">�̾��</span></div>
							<div class="peoples peoples_111"><span id="people_val111">ȫ��ö</span></div>
							<div class="peoples peoples_112"><span id="people_val112">�����</span></div>
							<div class="peoples peoples_113"><span id="people_val113">�����</span> <span class="">| 54��</span></div>
							<div class="peoples peoples_114"><span id="people_val114">���</span></div>
							<div class="peoples peoples_115"><span id="people_val115">�迵õ</span> <span class="">| 56�� 1��</span></div>
							<div class="peoples peoples_116"><span id="people_val116">������</span></div>
							<div class="peoples peoples_117"><span id="people_val117">������</span></div>
							<div class="peoples peoples_118"><span id="people_val118">���ö</span> <span class="">| 56�� 5��</span></div>
							<div class="peoples peoples_119"><span id="people_val119">�̿���</span> <span class="">| 60��</span></div>
							<div class="peoples peoples_120"><span id="people_val120">�ѽ¼�</span> <span class="">| 76�� 10��</span></div>
							<div class="peoples peoples_121"><span id="people_val121">����</span></div>
							<div class="peoples peoples_122"><span id="people_val122">ȫ����</span> <span class="">| 72�� 6��</span></div>
							<div class="peoples peoples_123"><span id="people_val123">���캹</span> <span class="">| 69�� 10��</span></div>
							<div class="peoples peoples_124"><span id="people_val124">��â��</span></div>
							<div class="peoples peoples_125"><span id="people_val125">������</span> <span class="">| 54�� 6��</span></div>
							<div class="peoples peoples_126"><span id="people_val126">�ڼ���</span></div>
							<div class="peoples peoples_127"><span id="people_val127">�輺��</span> <span class="">| 38��</span></div>
							<div class="peoples peoples_128"><span id="people_val128">Ȳ����</span></div>
							<div class="peoples peoples_129"><span id="people_val129">������</span></div>
							<div class="peoples peoples_130"><span id="people_val130">������</span> <span class="">| 85�� 11��</span></div>
							<div class="peoples peoples_131"><span id="people_val131">�����</span></div>
							<div class="peoples peoples_132"><span id="people_val132">������</span> <span class="">| 45�� 4��</span></div>
							<div class="peoples peoples_133"><span id="people_val133">������</span> <span class="">| 78�� 6��</span></div>
							<div class="peoples peoples_134"><span id="people_val134">�ǻ�ȯ</span></div>
							<div class="peoples peoples_135"><span id="people_val135">������</span></div>
							<div class="peoples peoples_136"><span id="people_val136">������</span> <span class="">| 73�� 5��</span></div>
							<div class="peoples peoples_137"><span id="people_val137">���μ�</span> <span class="">| 49��</span></div>
							<div class="peoples peoples_138"><span id="people_val138">����Ȳ</span> <span class="">| 55�� 5��</span></div>
							<div class="peoples peoples_139"><span id="people_val139">������</span> <span class="">| 64�� 10��</span></div>
							<div class="peoples peoples_140"><span id="people_val140">�պ���</span> <span class="">| 70�� 8��</span></div>
							<div class="peoples peoples_141"><span id="people_val141">�纸��</span> <span class="">| 69�� 9��</span></div>
							<div class="peoples peoples_142"><span id="people_val142">�����</span> <span class="">| 65�� 9��</span></div>
							<div class="peoples peoples_143"><span id="people_val143">�纴��</span></div>
							<div class="peoples peoples_144"><span id="people_val144">������</span> <span class="">| 70���</span></div>
							<div class="peoples peoples_145"><span id="people_val145">����ȯ</span> <span class="">| 56���</span></div>
							<div class="peoples peoples_146"><span id="people_val146">��ȣ��</span> <span class="">| 55���</span></div>
							<div class="peoples peoples_147"><span id="people_val147">������</span> <span class="">| 08���</span></div>
							<div class="peoples peoples_148"><span id="people_val148">�㿵��</span> <span class="">| 68���</span></div>
							<div class="peoples peoples_149"><span id="people_val149">�ſ���</span> <span class="">| 43���</span></div>
							<div class="peoples peoples_150"><span id="people_val150">������</span> <span class="">| 53���</span></div>
							<div class="peoples peoples_151"><span id="people_val151">�۱�ö</span> <span class="">| 95���</span></div>
							<div class="peoples peoples_152"><span id="people_val152">������</span> <span class="">| 56���</span></div>
							<div class="peoples peoples_153"><span id="people_val153">������</span><span class="">| 63���</span></div>
							<div class="peoples peoples_154"><span id="people_val154">������</span> <span class="">| 45��</span></div>
							<div class="peoples peoples_155"><span id="people_val155">��âȭ</span> <span class="">| 60��</span></div>
							<div class="peoples peoples_156"><span id="people_val156">�����</span> <span class="">| 48��</span></div>
							<div class="peoples peoples_157"><span id="people_val157">�̰溸</span> <span class="">| 73�� 5��</span></div>
							<div class="peoples peoples_158"><span id="people_val158">�ſ���</span> <span class="">| 43�� 9��</span></div>
							<div class="peoples peoples_159"><span id="people_val159">������</span><span class="">| 09���</span></div>
							<div class="peoples peoples_160"><span id="people_val160">���ؼ�</span><span class="">| 45�� 11��</span></div>
							<div class="peoples peoples_161"><span id="people_val161">������</span><span class="">| 56�� 9��</span></div>
							<div class="peoples peoples_162"><span id="people_val162">�̿���</span> <span class="">| 56��</span></div>
							<div class="peoples peoples_163"><span id="people_val163">������</span><span	class="">| 33��</span></div>
							<div class="peoples peoples_164"><span id="people_val164">������</span></div>
							<div class="peoples peoples_165"><span id="people_val165">���ر�</span></div>
							<div class="peoples peoples_166"><span id="people_val166">�뿤</span><span class="">| 45��</span></div>
							<div class="peoples peoples_167"><span id="people_val167">�˷���</span><span class="">| 40��</span></div>
							<div class="peoples peoples_168"><span id="people_val168">������</span><span class="">| 21��</span></div>
							<div class="peoples peoples_169"><span id="people_val169">�ڱ�ȣ</span><span class="">| 66�� 8��</span></div>
							<div class="peoples peoples_170"><span id="people_val170">�̼���</span><span class="">| 88�� 10��</span></div>
							<div class="peoples peoples_171"><span id="people_val171">����ö</span></div>
							<div class="peoples peoples_172"><span id="people_val172">������</span></div>
							<div class="peoples peoples_173"><span id="people_val173">�����</span><span class="">| 52���</span></div>
							<div class="peoples peoples_174"><span id="people_val174">���뼮</span><span class="">| 56���</span></div>
							<div class="peoples peoples_175"><span id="people_val175">�ڰ泲</span><span class="">| 54���</span></div>
							<div class="peoples peoples_176"><span id="people_val176">������</span><span class="">| 62��</span></div>
							<div class="peoples peoples_177"><span id="people_val177">������</span></div>
							<div class="peoples peoples_178"><span id="people_val178">�迵ȣ</span></div>
							<div class="peoples peoples_179"><span id="people_val179">�ڼ���</span></div>
							<div class="peoples peoples_180"><span id="people_val180">��ȿ��</span><span class="">| 59��</span></div>
							<div class="peoples peoples_181"><span id="people_val181">�����</span><span class="">| 54��</span></div>
							<div class="peoples peoples_182"><span id="people_val182">��ÿ�</span> | 2-1�� <span class=" ">| ��</span></div>
						</div>
				</div>
				
				<br>
				<br>
				
				<div class="content_die">
					<p class="title" >
						<span class="die_text">����� ���</span> 
					</p>
					<div class="board" >
						<div class="peoples peoples_183"><span id="people_val183">������</span><span>| 22��</span><span>| ��</span></div>
						<div class="peoples peoples_184"><span id="people_val184">������</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_185"><span id="people_val185">�ǿ�õ</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_186"><span id="people_val186">�Ӱ��</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_187"><span id="people_val187">�̴ٿ�</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_188"><span id="people_val188">�ֿ���</span><span> | ���� </span><span>| ��</span></div>
						<div class="peoples peoples_189"><span id="people_val189">������</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_190"><span id="people_val190">���־�</span><span> | 2�г� </span><span>| ��</span></div>
						<div class="peoples peoples_191"><span id="people_val191">����ö</span><span> | ���� </span><span>| 36��</span><span>| ��</span></div>
						<div class="peoples peoples_192"><span id="people_val192">��ȿ��</span><span> | 29�� </span><span>| ��</span></div>
						<div class="peoples peoples_193"><span id="people_val193">������</span><span> | 2�г� </span><span>| ��</span></div>
						
					</div>
				</div>
				<br>
				<br>
				<div>
					<p class="title" >���� �Ӻ�</p>
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
							<span class="sewool_title_text">����ȣ</span>
						</h1>
			</div>
			
				
			<div data-role="content">
				<div class="menu">
					<ul class="menu_ul">
						<li class="menu_li"><a href="#sewol" class="menu_text">�����Ȳ</a></li>
						<li class="menu_li"><a href="#message" class="menu_text">����� �޼���</a></li>
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
							<p class="messageTitle">����� �޼��� �����..</p>
							
							<input type="text" name="name" id="name"  placeholder="Name"/>
							<textarea name="content" id="content"></textarea>
							<button onclick="javascript:messageWrite.submit();"  data-role="button">������</button>
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

