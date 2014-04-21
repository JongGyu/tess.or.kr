<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

<%

	Connection cn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		cn = DriverManager.getConnection("jdbc:mysql://tess.or.kr:3306/tessteam", "tessteam", "Ghksrud201428");
		
		
			String sql = "INSERT INTO SEWOL_MESSAGE(name, content, regdate) "+
						 "VALUES('"+name+"', '"+content+"', sysdate())		";
			
			ps = cn.prepareStatement(sql);
			ps.executeUpdate();
			
		
		
	} catch (Exception e){
		e.printStackTrace();
		
	} finally {
	
		ps.close();
		cn.close();  
	}


%>

<script type="text/javascript">
	location.href="./sewol.jsp#message";
</script>