
<%@page import="DTO.AlbumBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DTO.ScheduleBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.BbsBean"%>
<%
	
	String ToolOn = "false";
	if(session.getAttribute("adminTool") != null){
		ToolOn = (String) session.getAttribute("adminTool");
	}
	String actionGroup = request.getParameter("actionGroup");
	if(request.getParameter("actionGroup") == null){ actionGroup = "null"; }
	
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=edge,chrome=1″>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./css/jquery.mobile-1.4.0.css" />
<link rel="stylesheet" href="./css/calendar.css" />
<link rel="stylesheet" href="./css/album.css" />
<link rel="stylesheet" href="./css/defaultstyle.css" />
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/jquery.mobile-1.4.0.min.js"></script> 
<script src="./js/calendar.js"></script>
<script src="./js/album.js"></script>
<script src="./js/jquery.form.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var WshShell = new ActiveXObject("WScript.Shell");
    Desktoptemp = WshShell.Specialfolders("Desktop");
    var sName = WshShell.CreateShortcut(Desktoptemp + "Tess.url");
    sName.TargetPath = "http://tess.or.kr/";
    sName.Save();
	
	
});

window.addEventListener("load",function(){
 setTimeout(scrollTo,0,0,1);
 },false);
 
function adminmodeAction(){
	
	$(".mainImage").css({ "display":"none" });
	$("#adminLogin").css({ "display":"block" });
	
	
}

function adminmodeAction_on(){
	var password  = $("#pw").val();
	
	if(password != "Tess201428"){ alert("인증 실패하였습니다."); }
	
	if(password != null){
		location.href="Admin?password="+password;
		
	}
}



</script>
<title>청소년봉사단</title>
</head>
<body>
<div class="wrap">
	<!--  Index main Page---------------------------------------------------------------------------------------------- -->
	<div data-role="page" id="main">
		<div data-role="header" class="header main" data-theme="c" >
			<a href="#menu" class="header_main" data-transition="slide" data-direction="reverse" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a">
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
					
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="logo_text_big"><a href="./index.jsp" style="color:#00A551 " data-ajax="false">TESS</a></span>
			</h1>
		</div>
		
		<div data-role="content">
			
			<div class="mainImage">
				<a onclick="javascript:adminmodeAction();">
					<img class="main_img" src="./images/sewol_main.jpg" border="0">
				</a>
			</div>
			
			<div  id="adminLogin" >
		     	<input type="password" placeholder="Password" id="pw">
		     	<button data-role="button" data-mini="true" onclick="javascript:adminmodeAction_on();">Login</button>
		     </div>
			
			
			<ul data-role="listview"  class="ui-listview main_ul">
		        <li data-theme="c" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-hover-c ui-icon-arrow-r">
		        	<div class="ui-btn-inner ui-li" aria-hidden="true">
		       			<div class="ui-btn-text">
		          			<a href="BbsServlet?actionGroup=bbs&actionMode=LIST&grp=notice#bbs" class="ui-link-inherit" data-ajax="false">
		            			<h3 class="ui-li-heading content_text link_notice">공지사항</h3>
		          			</a>
		        		</div>
		       	 		<span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span>
		        	</div>
		        </li>
		        
		        <li data-theme="c" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-up-c ui-icon-arrow-r">
			        <div class="ui-btn-inner ui-li" aria-hidden="true">
				        <div class="ui-btn-text">
				          <a href="ScheduleServlet?actionGroup=schedule&actionMode=LIST#schedule" class="ui-link-inherit" data-ajax="false">
				            <h3 class="ui-li-heading content_text link_schedule">봉사일정</h3>
				          </a>
				        </div>
				        <span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span>
			        </div>
		        </li>
		        <li data-theme="c" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-up-c ui-icon-arrow-r">
			        <div class="ui-btn-inner ui-li" aria-hidden="true">
				        <div class="ui-btn-text">
				          <a href="BbsServlet?actionGroup=bbs&actionMode=LIST&grp=fbb#bbs" class="ui-link-inherit" data-ajax="false">
				            <h3 class="ui-li-heading content_text ">자유게시판</h3>
				          </a>
				        </div>
				        <span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span>
			        </div>
		        </li>
		        <li data-theme="c" class="ui-btn ui-btn-up-c ui-btn-icon-right ui-li-has-arrow ui-li ui-icon-arrow-r">
			        <div class="ui-btn-inner ui-li" aria-hidden="true">
				        <div class="ui-btn-text">
				          <a href="AlbumServlet?actionGroup=album&actionMode=LIST#album" class="ui-link-inherit" data-ajax="false">
				            <h3 class="ui-li-heading content_text link_album">봉사사진</h3>
				          </a>
				        </div>
				        <span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span>
			        </div>
		        </li>
		        <li data-theme="c" class="ui-btn ui-btn-up-c ui-btn-icon-right ui-li-has-arrow ui-li ui-icon-arrow-r">
			        <div class="ui-btn-inner ui-li" aria-hidden="true">
				        <div class="ui-btn-text">
				          <a href="./sewol.jsp" class="ui-link-inherit" data-ajax="false">
				            <h3 class="ui-li-heading content_text" style="color: #333;">세월호</h3>
				          </a>
				        </div>
				        <span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span>
			        </div>
		        </li>
		     </ul>
		     
		     
		    
		</div>
		
		<div data-role="footer" data-position="fixed" class="footer_main" data-theme="c" >
			<span class="main_ft">
				함께 지키는 환경 청소년 봉사단 |  관리자 : 서재열  |  연락처 : 010-6243-5432 |  전자우편 : woduf@nate.com | 비영리단체 
			</span>
		</div>
	</div>
	
	
	<!--  Left Menu Page---------------------------------------------------------------------------------------------- -->
	<div data-role="page" id="menu">
		<div data-role="header" class="header menu" data-theme="c" >
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="menu_text">Menu</span>
			</h1>
		</div>
		
		<div data-role="content">
			<div id="menu">
				<ul data-role="listview" data-divider-theme="b" class="ui-listview main_ul">
            		<li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li">
		             		<div class="ui-btn-text">
		                		<a href="index.jsp " class="left-li" data-ajax="false">Home</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="BbsServlet?actionGroup=bbs&actionMode=LIST&grp=notice#bbs" class="left-li" data-ajax="false">공지사항</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="BbsServlet?actionGroup=bbs&actionMode=LIST&grp=fbb#bbs" class="left-li" data-ajax="false">자유게시판</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="ScheduleServlet?actionGroup=schedule&actionMode=LIST#schedule" class="left-li" data-ajax="false">봉사일정</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="mailto:woduf@nate.com" class="left-li"  data-ajax="false">Q&A</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="BbsServlet?actionGroup=bbs&actionMode=LIST&grp=humor#bbs" class="left-li" data-ajax="false">생활 속 유머들</a>
		            		</div>
		            	</div>
		            </li>
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="AlbumServlet?actionGroup=album&actionMode=LIST#album"  class="left-li" data-ajax="false">봉사사진</a>
		            		</div>
		            	</div>
		            </li>
		            
		            <li data-icon="false" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-iconpos="right" data-theme="d" class="ui-btn ui-li ui-btn-hover-d">
		             	<div class="ui-btn-inner ui-li ">
		             		<div class="ui-btn-text">
		                		<a href="./sewol.jsp"  class="left-li" data-ajax="false">세월호</a>
		            		</div>
		            	</div>
		            </li>
		            
            
        		</ul>
        	</div>
		</div>
		
		<div data-role="footer" data-position="fixed" class="footer" data-theme="c" >
			<p class="ft">Copyright ⓒ 2014 by jonggyu, Park All Rights Reserved.</p>
		</div>
	</div>
	
	
	<%
		if(actionGroup.equals("bbs")){
			
			BbsBean bean = new BbsBean();
			ArrayList<BbsBean> list = (ArrayList<BbsBean>) request.getAttribute("list");
			
			String grp = request.getParameter("grp");
			
			String grpname = null;
			if(grp.equals("notice")){ grpname = "공지사항"; }
			else if(grp.equals("fbb")){ grpname = "자유게시판"; }
			else if(grp.equals("qna")){ grpname = "Q&A"; }
			else if(grp.equals("humor")){ grpname = "생활 속 유머"; }
			
			
	%>
	
	<!--  bbs list ---------------------------------------------------------------------------------------------- -->
	<div data-role="page" class="list" id="bbs">
		<div data-role="header" class="header <%=grp%>" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="<%=grp%>_title_text"><%=grpname%></span>
			</h1>
			
			<%if(!(grp.equals("notice"))){ %>
			<a href="#bbs_write" class="button_ico" data-role="button" >
				<img src="./images/Write_ico.gif" class="ico_img" />
			</a>
			<%} %>
		</div>
		
		<div data-role="content">
			<ul>
				<%
					for (int i=0; i < list.size(); i++){ bean = (BbsBean) list.get(i);
					if(bean.getGrp().equals(grp)){
				%>
				
				<li class="<%=grp%>_list">
					<a href="#bbs_view_<%=bean.getSeq() %>" class="<%=grp%>_title" onclick="javascript:seqClick('<%=bean.getSeq() %>')">
						<span class="<%=grp%>_text"><%=bean.getSeq()%>  <%=bean.getSubject() %> <span class="list-float-right"><%=bean.getName()%></span></span></a>
				</li>
				<%} %>
				<%} %>
			</ul>
		</div>
		
		<%if(ToolOn.equals("true")){ %>
		<div data-role="footer" data-position="fixed" class="adminTool footer_main" data-theme="c" >
			<div class=""><a href="#bbs_write" data-role="button" class="footer_button" >글쓰기</a></div>
			
			
		</div>
		<%} %>
	</div>
	
	
	<!--  bbs view ------------------------------------------------------------------------------------------------>
	<% for (int i=0; i < list.size(); i++){ bean = (BbsBean) list.get(i); %>
	<div data-role="page" class="view view" id="bbs_view_<%=bean.getSeq()%>">
		<div data-role="header" class="header <%=grp%>" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="<%=grp%>_title_text"><%=grpname%></span>
			</h1>
		</div>
		
		
		<div data-role="content">
			<div class="br_view">
				<div class="br_header">
					<span class="br_subject"><%=bean.getSubject() %></span>
					<span class="br_date"><%=bean.getRegdate() %></span>
					
				</div>
				
				<div class="br_content">
					<br/><br/>
					<%=bean.getContent() %>
					<br/><br/>
					<%if( bean.getFilename() != null){ %>
						<img class="content_img" src="./upload/<%=bean.getFilename()%>">
					<%} %>
				</div>
				
				
				<%if(ToolOn.equals("true")){ %>
				<div data-role="footer" data-position="fixed" class="adminTool ui-grid-a footer_main" data-theme="c" >	
					<div class="ui-block-a "><a href="BbsServlet?actionMode=DEL&seq=<%=bean.getSeq()%>" data-role="button" data-ajax="false" style="width: 90%;">삭제</a></div>
					<div class="ui-block-b"><a href="#notice_update_<%=bean.getSeq()%>" data-role="button" style="width: 90%;" >수정</a></div>
				</div>
				<%} %>
				
			</div>
		</div>
		
	</div>
	<%} %>
	
	<!-- bbs Write ------------------------------------------------------------------------------------------------>
	<div data-role="page" class="view" id="bbs_write">
		<div data-role="header" class="header <%=grp%>" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="<%=grp%>_title_text"><%=grpname%></span>
			</h1>
		</div>
		
		<form method="post"  action="BbsServlet?actionMode=INS&grp=<%=grp %>"  enctype="multipart/form-data" name="noticeInsterForm" data-ajax="false">
		<div data-role="content">
			<div class="br_view">
				<div class="br_header">
					
					<%if(!(grp.equals("notice"))){ %>
					<div class="ui-grid-a">
						<div class="ui-block-a block-margin">
							<input type="text" name="in_subject" id="br_subject" placeholder="Subject">
						</div>
						<div class="ui-block-b block-margin">
							<input type="text" name="in_name" id="br_name" placeholder="name" >
						</div>
					</div>
					<%} else { %>
					<div>
						<div>
							<input type="text" name="in_subject" id="br_subject" placeholder="Subject">
						</div>
						<div class="ui-block-b block-margin">
							<input type="hidden" name="in_name" id="br_name" placeholder="Name" >
						</div>
					</div>
					<%} %>
				</div>
				<br/>
				<div class="br_content">
					<label for="br_content">내용</label>
					<textarea  name="in_content" id="br_content"></textarea>
					
					<div id="preview"></div>
					
				</div>
				<div class="br_tool">
					<div class="ui-grid-a" style="width: 100%;">
						<div class="ui-block-a " style="width: 50%;">
							<a  id="chooseFile" onclick="javscript:chooseFileFunction()" data-role="button" class="button_width"><img src="./images/Photo_ico.gif" class="ico_img"></a>
							
							
							<div class="hiddenfile" style="width: 0px; height: 0px;">
								<input type="file" id="imgFile" data-clear-btn="false" name="fileimg" accept="image/*" capture>
							</div>
						</div>
						<div class="ui-block-b"  style="width: 50%;">
							<a  onclick="javascript:noticeInsterForm.submit();" data-role="button" class="button_width" ><img src="./images/Confirm_ico.gif" class="ico_img"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script>
	function chooseFileFunction(){
		$("#imgFile").trigger("click");
	}
	
	
	
	$(document).ready(function(){ 
		$("#imgFile").change(function(){
			var file = $("#imgFile")[0].files[0];            
			$("#preview").empty();
			displayAsImage3(file, "preview");
		});
	});
    
	
    function displayAsImage3(file, containerid) {
		if (typeof FileReader !== "undefined") {
			var container = document.getElementById(containerid),
			    img = document.createElement("img"),
			    reader;
			container.appendChild(img);
			reader = new FileReader();
			reader.onload = (function (theImg) {
				return function (evt) {
					theImg.src = evt.target.result;
				};
			}(img));
			reader.readAsDataURL(file);
		}
	} //source: http://jsfiddle.net/pmatseykanets/R99NY/
    </script>
    
    
    <!-- bbs Update ------------------------------------------------------------------------------------------------>
	<% for (int i=0; i < list.size(); i++){ bean = (BbsBean) list.get(i); %>
	<div data-role="page" class="view" id="notice_update_<%=bean.getSeq()%>">
		<div data-role="header" class="header <%=grp%>" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="<%=grp%>_title_text"><%=grpname%></span>
			</h1>
		</div>
		
		<form name="bbsUpdateForm_<%=bean.getSeq()%>" method="post"  action="BbsServlet?actionMode=UPT&seq=<%=bean.getSeq()%>"  enctype="multipart/form-data"  data-ajax="false">
		<div data-role="content">
			<div class="br_view">
				<div class="br_header">
					<div>
						<input type="hidden" value="<%=bean.getSeq()%>" name="in_seq">
						<label for="br_subject">제목</label>		
						<input type="text" name="in_subject" id="br_subject"  value="<%=bean.getSubject()%>">
					</div>
				</div>
				<br/>
				<div class="br_content">
					<label for="br_content">내용</label>
					<textarea  name="in_content" id="br_content"><%=bean.getContent().replaceAll("<br>", "\r\n")%></textarea>
					
					
					<div id="preview_<%=bean.getSeq()%>">
						<%if( bean.getFilename() != null){ %>
						<img src="./upload/<%=bean.getFilename()%>">
						<%} %>
					</div>
					
				</div>
				<br/>
				<div class="br_tool">
					<div class="ui-grid-a" style="width: 100%;">
						<div class="ui-block-a " style="width: 50%;">
							<a  id="chooseFile_<%=bean.getSeq()%>" onclick="javascript:chooseFile_<%=bean.getSeq()%>Function();" data-role="button" class="button_width">
								<img src="./images/Photo_ico.gif" class="ico_img">
							</a>
							
							<div class="hiddenfile" style="width: 0px; height: 0px;">
								<input type="file" id="imgFile_<%=bean.getSeq()%>" onchange="javascript:imgFile_<%=bean.getSeq()%>Function();" data-clear-btn="false" name="fileimg" accept="image/*" capture>
							</div>
						</div>
						<div class="ui-block-b"  style="width: 50%;">
							<a onclick="javascript:bbsUpdateForm_<%=bean.getSeq()%>.submit();"  data-role="button" class="button_width" >
								<input type="image" src="./images/Confirm_ico.gif" class="ico_img">
							</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script>
	function chooseFile_<%=bean.getSeq()%>Function(){
		$("#imgFile_<%=bean.getSeq()%>").trigger("click");
	}
	
	function imgFile_<%=bean.getSeq()%>Function(){
		var file = $("#imgFile_<%=bean.getSeq()%>")[0].files[0];            
		$("#preview_<%=bean.getSeq()%>").empty();
		displayAsImage3(file, "preview_<%=bean.getSeq()%>");
	}
	
    function displayAsImage3(file, containerid) {
		if (typeof FileReader !== "undefined") {
			var container = document.getElementById(containerid),
			    img = document.createElement("img"),
			    reader;
			container.appendChild(img);
			reader = new FileReader();
			reader.onload = (function (theImg) {
				return function (evt) {
					theImg.src = evt.target.result;
				};
			}(img));
			reader.readAsDataURL(file);
		}
	} //source: http://jsfiddle.net/pmatseykanets/R99NY/
    </script>
    <%} %>
    <%} %>
    
  
    
    
    <!-- Schedule  ------------------------------------------------------------------------------------------------>
    <%
		if(actionGroup.equals("schedule")){
			ScheduleBean bean = new ScheduleBean();
			ArrayList<ScheduleBean> list = (ArrayList<ScheduleBean>) request.getAttribute("list");
			
			DecimalFormat df = new DecimalFormat("00");
	 		Calendar currentCalendar = Calendar.getInstance();
	 		
	 		String strYear   = Integer.toString(currentCalendar.get(Calendar.YEAR));
	 	    String strMonth  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
	 	    String strDay   = df.format(currentCalendar.get(Calendar.DATE));
	%>
	<div data-role="page" id="schedule">
		<div data-role="header" class="header schedule" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a"  >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="schedule_title_text">봉사일정</span>
			</h1>
		</div>
		
		<div data-role="content">
		 	 <div class="month">
		 	 	<div id="month_title" class="month_title"></div>
		 		<% for (int i=0; i < list.size(); i++){ bean = (ScheduleBean) list.get(i); %>
		 		<% if( bean.getYear().equals(strYear) && bean.getMonth().equals(strMonth) ){ %>
		 		<ul class="month_ul">
					<li class="month_li">
						<span class="cal_list_col1"><%=bean.getMonth() %>월 <%=bean.getDay() %>일</span>
						<span class="cal_list_col2"><%=bean.getSubject() %></span>
					</li>
				</ul>
				<% } %>
				<%} %>
		 	 </div>	
		 	 	
		 	 
		 	 <div class="cal"></div>
		 	 
		 	 <div>
		 	 	<div id="day_title" class="day_title"></div>	
			 	<% for (int i=0; i < list.size(); i++){ bean = (ScheduleBean) list.get(i); %>
			 	<% if( bean.getYear().equals(strYear) && bean.getMonth().equals(strMonth)){ %>
			 	<ul class="cal_ul ul_<%=bean.getDay()%>">
					<li class="cal_li"><%=bean.getSubject() %></li>
				</ul>
				
				<%} %>
				<%} %>
		 	 </div>
		</div>
		
		<%if(ToolOn.equals("true")){ %>
		<div data-role="footer" data-position="fixed" class="adminTool ui-grid-a footer_main" data-theme="c" >
			<div class="ui-block-a "><a href="#schedule_update" data-role="button" class="footer_button" >수정</a></div>
			<div class="ui-block-b"><a href="#schedule_write" data-role="button" class="footer_button">글쓰기</a></div>
		</div>
		<%} %>
	</div>
	
	
	<!-- schedule Write ------------------------------------------------------------------------------------------------>
	<div data-role="page" id="schedule_write">
		<div data-role="header" class="header schedule" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="schedule_title_text">봉사일정</span>
			</h1>
		</div>
		<form action="ScheduleServlet?actionGroup=schedule&actionMode=INS" method="post" name="scheduleInsertForm" id="scheduleInsertForm">
		<div data-role="content">
			 <div class="cal"></div>
			 </br></br>
			<div class="br_header">
				<div>
					<label for="cal_date">날짜 <span>ex)yyyy-mm-dd</span></label>
					<input type="text" name="cal_date" id="cal_date">
				</div>
				<div>
					<label for="cal_subject">제목</label>		
					<input type="text" name="cal_subject" id="cal_subject" >
				</div>
			</div>
			<div>
				<a onclick="javascript:scheduleInsertForm.submit();"  data-role="button" class="button_width" style="width: 100%;">
					<input type="image" src="./images/Confirm_ico.gif" class="ico_img">
				</a>
			</div>
		</div>
		</form>
	</div>

	
	
	<!-- schedule Update ------------------------------------------------------------------------------------------------>
	<div data-role="page" id="schedule_update">
		<div data-role="header" class="header schedule" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a"  >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="schedule_title_text">봉사일정</span>
			</h1>
		</div>
		
		
		<div data-role="content">
		 	<ul>
				<%
					for (int i=0; i < list.size(); i++){
						bean = (ScheduleBean) list.get(i);
				%>
				<li class="br_list">
				<form action="ScheduleServlet?actionGroup=schedule&actionMode=UPT" method="post" name="ScheduleUpdateForm_<%=bean.getSeq()%>" id="">
					<div class="ui-grid-c ca_title" style="width: 100%;">
						<div class="ui-block-a ca_text" ><input data-inline="true" type="text" name="sc_up_subject" value="<%=bean.getSubject() %>"></div>
						<div class="ui-block-b ca_text" ><input data-inline="true" type="text" name="sc_up_date" value="<%=bean.getYear() %>-<%=bean.getMonth() %>-<%=bean.getDay() %>"></div>
						<div class="ui-block-c ca_text" >
							<a onclick="javascript:ScheduleUpdateForm_<%=bean.getSeq()%>.submit();"  data-role="button" data-mini="true" class="button_width" style="width: 100%;">
								<input type="image" src="./images/Confirm_ico.gif" class="ico_img">
							</a>
						</div>
						<div class="ui-block-d ca_text" >
							<a href="ScheduleServlet?actionGroup=schedule&actionMode=DEL&seq=<%=bean.getSeq()%>"  data-role="button" data-mini="true" class="button_width" style="width: 100%;">
								<img src="./images/Cancel.gif" class="ico_img">
							</a>
						</div>
					</div>
				
				</form>
				<%} %>
			</ul>
		</div>
		
	</div>
	<%} %>
	
	
	
	<!-- Album ------------------------------------------------------------------------------------------------>
	<%
		if(actionGroup.equals("album")){
			
			AlbumBean bean = new AlbumBean();
			
			ArrayList<AlbumBean> list = (ArrayList<AlbumBean>) request.getAttribute("list");
			ArrayList<AlbumBean> sub_list = (ArrayList<AlbumBean>) request.getAttribute("list");
	%>
	<div data-role="page" id="album">
		<div data-role="header" class="header album" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="album_title_text">봉사사진</span>
			</h1>
		</div>
		
		<div data-role="content">
			<%for (int i=0; i < list.size(); i++){ bean = (AlbumBean) list.get(i); %>
			<%if(bean.getTyp().equals("album")){ %>
			<div class="all_album ">
				<a class="all_album_a" href="#album_list_<%=bean.getOnlysubject()%>">
					<img src="./album/<%=bean.getPhotoname()%>">
				</a>
			</div>
			<%} %>
			<%} %>
			
		</div>
		
		<%if(ToolOn.equals("true")){ %>
		<div data-role="footer" data-position="fixed" class="adminTool ui-grid-a ">
			<div class="ui-block-a"><a href="#album_update" data-role="button" class="footer_button" >수정</a></div>
			<div class="ui-block-b"><a href="#album_write" data-role="button"  class="footer_button" >글쓰기</a></div>
		</div>
		<%} %>
	</div>
	
	
	<!-- Album List ------------------------------------------------------------------------------------------------>
	<%
	
	for (int i=0; i < list.size(); i++){ bean = (AlbumBean) list.get(i); 
		String GRP = bean.getGrp();
		if(bean.getTyp().equals("album")){
	%>
	<div data-role="page" id="album_list_<%=bean.getOnlysubject() %>">
	
		<div data-role="header" class="header album" data-theme="c" >
		
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="album_title_text"><%=bean.getSubject() %></span>
			</h1>
		</div>
		
		<div data-role="content" class="content">
			
			<%for (int j=0; j < list.size(); j++){ bean = (AlbumBean) list.get(j);  %>
			<%if(bean.getTyp().equals("photo")){  %>
			<%if(bean.getGrp().equals(GRP)) { %>
			<div class="all_album ">
				<a class="all_album_a" href="AlbumServlet?actionGroup=album&actionMode=LIST#photo_view_<%=bean.getSeq()%>" id="" > 
					<img src="./album/<%=bean.getPhotoname()%>">
				</a>
			</div>
			<%} %>
			<%} %>
			<%} %>
		</div>
		
		<% bean = (AlbumBean) list.get(i);  %>
		<%if(ToolOn.equals("true")){ %>
		<div data-role="footer" data-position="fixed" class="adminTool ui-grid-a ">
			<div class="ui-block-a"><a href="#album_update_list_<%=bean.getOnlysubject() %>" data-role="button" class="footer_button" >수정</a></div>
			<div class="ui-block-b"><a href="#album_write" data-role="button"  class="footer_button" >글쓰기</a></div>
		</div>
		<%} %>
	</div>
		<%} %>
	<%} %>
	
	<!-- Album View ------------------------------------------------------------------------------------------------>
	<%for (int i=0; i < list.size(); i++){ bean = (AlbumBean) list.get(i); %>
	<div data-role="page" class="album_view" id="photo_view_<%=bean.getSeq()%>">
		<img src="./album/<%=bean.getPhotoname() %>"  class="album_view_img">
	</div>
	<%} %>
	
	
	<!-- Album Write ------------------------------------------------------------------------------------------------>
	<div data-role="page" class="view" id="album_write">
		<div data-role="header" class="header album" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a"  >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="album_title_text">봉사사진</span>
			</h1>
		</div>
		
		<form  name="AlbumInsterForm" id="AlbumInsterForm" action="AlbumServlet?actionGroup=album&actionMode=AINS"  method="post" enctype="multipart/form-data"  data-ajax="false">
		<div data-role="content">
			<div class="br_view">
				<div class="br_header">
					<div>
						<label for="br_subject">사진첩명</label>		
						<input type="text" name="al_in_subject" id="al_in_subject" >
					</div>
				</div>
				<br/>
				<div class="br_content">
				
				
					<div class="al_add"></div>
					
					<div class="al_preview_all">
					
					</div>		
				</div>
				<div class="tool">
					<div data-role="footer" data-position="fixed" class="ui-grid-a ">
						<div class="ui-block-a"><a  href="#album" class="footer_button" data-role="button" data-inline="false" data-icon="back" >취소</a></div>
						<div class="ui-block-b"><a  href="AlbumServlet?actionGroup=album&actionMode=LIST" class="footer_button" data-role="button" data-inline="false" data-icon="forward" data-ajax="false">확인</a></div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- Album Update ------------------------------------------------------------------------------------------------>
	
	<div data-role="page" id="album_update">
		<div data-role="header" class="header album" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a"  >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="album_title_text">봉사사진</span>
			</h1>
		</div>
		
		<div data-role="content">
		 	<%for (int i=0; i < list.size(); i++){ bean = (AlbumBean) list.get(i);%>
			<%if(bean.getTyp().equals("album")){ %>
		 	<ul>
				<li class="br_list">
					<div class="ui-grid-b al_title">
						<div class="ui-block-a al_text"><%=bean.getRegdate() %></div>
						<div class="ui-block-b al_text"><%=bean.getSubject() %></div>
						<div class="ui-block-c al_text" style="width: 10%;"><a href="AlbumServlet?actionGroup=album&actionMode=DEL&seq=<%=bean.getSeq()%>" data-role="button" data-mini="true" data-inline="true" data-ajax="false" attribute>X</a></div>
					</div>
				</li>
			</ul>
			<%} %>
			<%} %>
		</div>
	</div>
	
	
	<!-- Album List Update ------------------------------------------------------------------------------------------------>
	<%
	for (int i=0; i < list.size(); i++){ bean = (AlbumBean) list.get(i); 
		String GRP = bean.getGrp();
		if(bean.getTyp().equals("album")){
			
	%>
	<div data-role="page" class="view"  id="album_update_list_<%=bean.getOnlysubject() %>" >
		<div data-role="header" class="header album" data-theme="c" >
			
			<a href="index.jsp#menu" class="header_main" data-transition="slide" data-direction="reverse" 
				data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" >
				<span class="header_main_left_ico">
					<span class="ui-btn-text">
						<span class="menu-bar a"></span>
						<span class="menu-bar b"></span>
						<span class="menu-bar c"></span>
					</span>
				</span>
			</a>
			
			<h1 class="ui-title" role="heading" aria-level="1">
				<span class="album_title_text">봉사사진</span>
			</h1>
		</div>
		
		<form  name="AlbumUpdateForm_<%=i %>" id="AlbumUpdateForm_<%=i %>" action="AlbumServlet?actionGroup=album&actionMode=AINS"   method="post" enctype="multipart/form-data"  data-ajax="false">
		<div data-role="content">
			<div class="br_view">				
				<div class="br_header">
					<div>
						<label for="br_subject">사진첩명</label>		
						<input type="text" name="al_up_subject" id="al_up_subject" value="<%=bean.getSubject()%>" readonly="readonly">
					</div>
				</div>
				<br/>
				<div class="br_content">
				<%for (int j=0; j < list.size(); j++){ bean = (AlbumBean) list.get(j);  %>
				<%if(bean.getTyp().equals("photo")){  %>
				<%if(bean.getGrp().equals(GRP)) { %>
					<ul class='al_ul'>
						<li>
							<img src="./album/<%=bean.getPhotoname()%>">
							<a href="AlbumServlet?actionGroup=album&actionMode=DEL&seq=<%=bean.getSeq()%>#album_update_list_<%=bean.getOnlysubject() %>" style="width: 60%;" data-role="button" data-mini="true" data-inline="true" data-ajax="false" attribute>X</a>
						</li>
					</ul>
				<%} %>
				<%} %>	
				<%} %>
					<div class="albumupdateaddbutton">
						<ul class='al_ul'>
							<li id="Albumupdate_<%=i %>" onclick="javascript:document.getElementById('addFileimg_<%=i%>').click();">+
										
							</li>
							<div class="hiddenfile"><input type="file" id="addFileimg_<%=i%>" name="addFileimg_<%=i%>" onchange="javascript:albumChangeImg('<%=i%>', 'update')" data-clear-btn="false"  accept="image/*" capture></div>
						</ul>
					</div>
					
				</div>
				<div data-role="footer" data-position="fixed" class="ui-grid-a ">
					<div class="ui-block-a"><a  href="#album" class="footer_button" data-role="button" data-inline="false" data-icon="back" >취소</a></div>
					<div class="ui-block-b"><a  href="AlbumServlet?actionGroup=album&actionMode=LIST" class="footer_button" data-role="button" data-inline="false" data-icon="forward" data-ajax="false">확인</a></div>
				</div>
			
			</div>
		</div>
		</form>  
		       
	</div>
	<%} %>
	<%} %>

	<%} %>
</div>
</body>
<script type="text/javascript">
$(window).load(function(){
	$('html').css("overflow", "hiddden");
	
});
</script>
</html>