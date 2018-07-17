<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*, dbconnect.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>학사관리 시스템</title>

    <!-- Bootstrap CSS를 불러옴 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/homestyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <SCRIPT LANGUAGE="javascript">
   
       function listCreate(select){
    	   var selectBox1=$("#selectBox1 option:selected").val();
    	   var selectBox2=select.value;
           $.ajax({
              
               type : "GET",
               url : "PayList.jsp?sel1="+selectBox1+"&sel2="+selectBox2+"",
               dataType : "html",
               error : function(){
                   alert('통신실패!!');
               },
               success : function(data){
                   $("#dataArea").html(data) ;
               }
               
           });
       }
      
    </SCRIPT>
   
    <style>
  		 .checktable { 
  			 border-collapse:collapse; 
  		 }  
  		 .checkTable th, .checkTable td { 
  			 border:1px solid black !important; 
  		 }
  		 th{
         	 text-align: center !important;
      	 }
      	 table{
      		 border-spacing: 30px;
			 border-collapse: separate;
			 text-align: center !important;
      	 }
      	 form{
      		 text-align: center !important;
      	 }
      	 table {
		     border-collapse: collapse;
		     text-align: left;
		     line-height: 1.5;
		 }
		 table thead th {
		     padding: 10px;
		     font-weight: bold;
		     vertical-align: top;
		     color: #501E20;
		     border-bottom: 4px solid #501E20;
		 }
		 table tbody th {
		     width: 150px;
		     padding: 10px;
		     font-weight: bold;
		     vertical-align: top;
		     border-bottom: 1px solid #501E20;
		     background: #f3f6f7;
		 }
		 td{
		 	padding-top: 10px;
		 }
		 h1{
		 	color: #501E20;
		 }
    </style>
   
</head>
<body style="overflow-x:hidden; overflow-y:hidden; background-color:white;" 
onresize="parent.resizeTo(400,450)" 
onload="parent.resizeTo(400,450)">

<form name="select_machine">
	<H1>예약 확인</H1>
	<table width=400px style="table-layout:fixed;">
		<thead>
			<tr>
				<th>출발지</th>
				<th>목적지</th>
				<th>출발시간</th>
				<th>취소</th>
		   </tr>
	   </thead>
	   <tbody align = "center">
<%
	String stunum=(String)session.getAttribute("stuNum");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		conn = Connect.getConnection();
	            
		pstmt = conn.prepareStatement("select * from busreserve where stunum=?");
		pstmt.setString(1, stunum);
		rs= pstmt.executeQuery();

		while(rs.next()){
			%>
			<tr>
				<td><%= rs.getString("source") %></td>
				<td><%= rs.getString("destination") %></td>

	<!-- 		    출발시간 -->
				<td><%= rs.getInt("bustime") %>:00</td>
	<!-- 			취소버튼 -->
				<td><button class="btn" onClick="window.open('cancel.jsp?buscode=<%= rs.getInt("reservecode") %>', '_blank', 'width=400, height=200, left=100, top=50');">취소</button></td>
			</tr>
	<%
			}
		
		}
	catch(Exception ex) {
		ex.printStackTrace();
	}finally{
		if (rs != null) 
			try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) 
			try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) 
			try { conn.close(); } catch(SQLException ex) {}
	}


%>
		
	</tbody>
</table>
</form>
</body>
</html>