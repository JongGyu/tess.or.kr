
    
$(document).ready(function(){
	
	var str = "";
	
	var today = new Date();
	var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
	
    $('#month_title').text(month+'월의 봉사일정');

    makeCalendar(str,  year, month);
    cal_title(year, month);
	
    
    $('#day_title').html(day+"일의 봉사일정 <input type='hidden' id='in_"+day+"' value='"+day+"'>");
    
    
    
    if( day <= 10){
    	
    	 $(".ul_0"+day).css({ 'display':'block' });
    	
    } else {
    	
    	$(".ul_"+day).css({ 'display':'block' });
   	 	
    }
   
    
    
     $('.next_date').bind('click', function(){ 
    	month = month +1;  
    	startDay = new Date (year, month, 1);
    	firstW = startDay.getDay();
    	
    	makeCalendar(str, year, month);
    	cal_title(year, month);
    });
    
     $('.back_date').bind('click', function(){ 
    	month = month -1;  
    	startDay = new Date (year, month, 1);
    	firstW = startDay.getDay();
    	
    	makeCalendar(str, year, month);
    	cal_title(year, month);
    });
    
    
   
    
 
});

function makeCalendar(str,  year, month){

	 	var today = new Date();
     	var endDay =  new Array(31,28,31,30,31,30,31,31,30,31,30,31);
     	var startDay =  new Date(today.getFullYear(), today.getMonth(), 1);
     	var firstW = startDay.getDay()

		
		endDate = endDay[today.getMonth()];

	    var line = Math.ceil((firstW+ endDate )/ 7);
	    //alert(line);
    
    	var date = 1;
    	var start = 0;
  

	    str += "<table width='100%' align='center' >							";
	    
	    str += "<tr class='cl_title' ><th colspan='7'>		"+
	   		 
	   		   "<span class='in_date'></span>										"+
	   		  
	   		   "</th></tr>	";
	    
	    
	    
	    str += "<tr>";
	    var weekTitle = new Array("일", "월", "화", "수", "목", "금", "토");
	    for ( var a = 0; a < weekTitle.length; a++) {
	    	str += "<th>" + weekTitle[a] + "</th>";
	    }
	    str += "</tr>";
	    
	    for (var i=0; i<line ;i++ ){
	    	str += "<tr>";

	        for (var j=0;j<7 ;j++ ){
	        str += "<td class='cl_day'  align='center' style='border:1px solid #C4C4C4; color:#5D9CDB; font-weight: bold; '>";
	           
	            if(start < firstW){
	            	str += "&nbsp";
	                start++;
	                

	            }else if(date > endDate){
	            	str += "&nbsp";
	                date++;

	            } else{
	               
	            	str += "<span class='day_val' id='day_"+date+"' onclick='day_value("+date+")' >"+date+"</span>";
	            	
	                date++;
	            }
	            str += "</td>";

	        }

	        str += "</tr>";

	    }
	    str += "</table>";
	    
	    $('.cal').html(str);
	    
}


function day_value(val){
	$('#day_title').html(val+"일의 봉사일정 <input type='hidden' id='in_"+val+"' value='"+val+"'>");
	
	$(".ul_"+val).css({ 'display':'block' });
	
	var today = new Date();
	var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
	
    $(".cal_ul").css({ 'display':'none' });
    
   if( val <= 10){
	   $(".ul_0"+val).css({ 'display':'block' });
   } else {
	   $(".ul_"+val).css({ 'display':'block' });
   }
    
	if( month <= 10){
		if(val <= 10){
			$('#cal_date').val(year+"-0"+month+"-0"+val);
			
		} else {
			$('#cal_date').val(year+"-0"+month+"-"+val);
		}
		
	} else{
		if(val <= 10){
			$('#cal_date').val(year+"-"+month+"-0"+val);
		} else {
			$('#cal_date').val(year+"-"+month+"-"+val);
		}
		
	}
	
}


function cal_title(year, month){
	
    if( month <= 10){
		$('.in_date').text(year+"년 0"+month+"월");
		 
		
	} else{
		$('.in_date').text(year+"년 "+month+"월");
		 
		
	}
}


$(window).load(function(){
	
	
});