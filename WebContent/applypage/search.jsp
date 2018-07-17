<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="regist.*" %>
<%@ page import="java.sql.ResultSet" %>
<% %>
    <%
    request.setCharacterEncoding("utf-8");
		LectureDBBean ldb=LectureDBBean.getInstance();	//강좌관련 DB작업을 하는 객체를 가져온다.

		
    	String campus=(String)request.getParameter("campus");
    	String major=(String)request.getParameter("major");
    	String department=(String)request.getParameter("department");
    	String cname=(String)request.getParameter("cname");

    	String sql="select lcode, cname, major, classsize, grade, time, slike, open, "
				+ "classroom, campus, pname, dname, regist from lecture join professor join department "
				+ "on lecture.pronum=professor.pronum and lecture.dcode=department.dcode";
    	
  		if(campus!=null || major!=null || department!=null || cname!=null)
		{
			sql += " where ";
			
    		if(major!=null)
    		{
    			sql += "major=\""+ major +"\"";
    		}
    		if(department!=null)
    		{
    			if(major!=null)
    				sql+=" and ";
    			
    			sql += "dname=\""+ department+"\"";

    		}
    		if(cname!=""){
    			if(major!=null && department!=null)
    				sql+=" and ";
    			sql += "cname like\"" + cname+"%\"";
    		}
		}

			session.setAttribute("searchSql", sql);
			
			String url= "apply.jsp?class="+department;

			//response.sendRedirect(url);
        %>
        <script type="text/javascript"> location.href="<%= url %>"; </script>
