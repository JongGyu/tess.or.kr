$(document).ready(function(){
			
	var str = "";
	var strfile = "" ;
	
	var maxcnt = 15;
	
	albumMake(str, strfile, maxcnt);
});


function albumMake(str, strfile, maxcnt){
	
	str = "<ul class='al_ul'>";
	
	
	for(var i = 1; i <= maxcnt; i++){
		str +=	"<li id='add_"+i+"' onclick='javascript:albumAddImg("+i+");'>+</li>";
		str += "<div class='hiddenfile' ><input type='file' onchange='javascript:albumChangeImg("+i+")' id='al_imgFile_"+i+"' name='al_imgFile_"+i+"' data-clear-btn='false'  accept='image/*' capture></div>";	
		
		strfile += "<div id='al_preview_"+i+"'></div>";
	}
	
	str += "</ul>";
	
	
	for(var i = 1; i <= maxcnt; i++){
		$(".al_add").html(str);
		$(".al_preview_all").html(strfile);
	}
	
}



function albumAddImg(i, typ){
	
	if($("#al_in_subject").val() == ""){
			
		alert("사진첩명을 입력해주세요.");
		
	}  else {
		$("#al_imgFile_"+i).trigger("click");
		
	}
	
}

function albumChangeImg(i, typ){
	
	
	if ( typ == "update"){
		
		var file = $("#addFileimg_"+i)[0].files[0];            
		$("#Albumupdate_"+i).empty();
		displayAsImage3(file, "Albumupdate_"+i, i, typ);
		
		
		
		
		
	} else {
		var file = $("#al_imgFile_"+i)[0].files[0];            
		$("#add_"+i).empty();
		displayAsImage3(file, "add_"+i, i);
	}
	
	
	
	
	
}

function displayAsImage3(file, containerid, i, typ) {
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
	excelupload(i, typ);
	
}


//파일 업로드 호출 스크립트
function excelupload(i, typ) {
     goExcelUploadAjaxLoad(i, typ);  // 백그라운드 로드시킬 스크립트 호출
   
    
     if ( typ == "update"){
	    var frm = $("#AlbumUpdateForm_"+i);
	    frm.attr("action", "AlbumServlet?actionGroup=album&actionMode=AINS");
	    frm.submit();
	  
	    
 	} else {
 		 if(i == 1){
	    	 var frm = $("#AlbumInsterForm");
	         frm.attr("action","AlbumServlet?actionGroup=album&actionMode=AINS&mainimg=1");
	         frm.submit();
	         
	     } else {
	    	 var frm = $("#AlbumInsterForm");
	         frm.attr("action","AlbumServlet?actionGroup=album&actionMode=AINS");
	         frm.submit();
	     }
 	}
     
}

function goExcelUploadAjaxLoad(i, typ) {
     $(document).ajaxError(function(info, xhr) {
          if (xhr.status == 500)
               alert("error.");
          });

          $(function() {
        	  
        	  if(typ == "update"){
        		  var vForm = $("#AlbumUpdateForm_"+i);        		  
        		  
        	  } else {
        		  var vForm = $("#AlbumInsterForm");
        	  }
        	  
        	  vForm.ajaxForm(FileuploadCallback);  // 완료 후 콜백 함수 호출
        	  
        	 
          });
          
          
    
        
}


function FileuploadCallback(data, state) {
	
	
}
