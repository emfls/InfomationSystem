<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*, dbconnect.*" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	table{
   		border-spacing: 20px;
		border-collapse: separate;
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
	    border-bottom: 3px solid #501E20;
	}
	table tbody th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #501E20;
	    background: #f3f6f7;
	}
	table td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #501E20;
	}
	button{
		background: #501E20 !important;
		color: white !important;
	}
</style>
<%
	String sel1=(String)request.getParameter("sel1");//출발지
	String sel2=(String)request.getParameter("sel2");//도착지
%>

<form action="paypro.jsp" method="GET">
<input type="hidden" name="sel1" value="<%=sel1%>">
<input type="hidden" name="sel2" value="<%=sel2%>">
<table width=400px>
		<thead style = "text-align: center">
			<tr>
			   <th>체크</th>
			   <th>출발 시간</th>
			   <th>잔여좌석</th>
			</tr>
		</thead>
		<tbody align = "center">

	<%	
	
	
		
	
	int hour[] = new int[] {8,10,12,16,18};//시간
	for(int i=0; i<hour.length; i++){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try{
			conn = Connect.getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select count(*) from busreserve where source=? and destination=? and bustime=?");
			pstmt.setString(1, sel1);
			pstmt.setString(2, sel2);
			pstmt.setInt(3, hour[i]);
			rs= pstmt.executeQuery();

			if(rs.next()){
				cnt= rs.getInt(1); 
				
			}
		}catch(Exception ex) {
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
	<tr>
		<% 
			int remain=40-cnt; //데이터 베이스에 해당 시간 예약 현황이 없으면 40 있다면 잔여좌석 넣기
			if(remain>0){
		%>
		<td><input type="radio" name ="userSelect" value=<%=hour[i] %>></td>
		<%
			}else{
		%>
		<td>불가</td>
		<%	
			} 
		%>
		<td><%=hour[i] %>:00
		</td>
		<%
			
			if(remain==40){ 
		%>
			<td>40</td>
		<%
			}else{ 
			//예약 현황이 있다면 잔여 좌석을 넣는다.
		%>
			<td><%=remain %></td>
		<%	
			} 
		%>
	</tr>
<%
}
%>
	<tr>
 	<td colspan=4>
 		<br>
		<button id="button" class="btn" type="submit">예매하기</button>
	</td>
  </tr>
</tbody>
</table>
</form>