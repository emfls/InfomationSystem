<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="login.LogonDBBean"%>	<!-- 로그인 관련 메소드가 정의되어있는 클래스 -->

<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("stuNum");	//학번을 불러와서 id에 저장
	String passwd  = request.getParameter("stuPwd"); 	//패스워드 불러와서 passwd에 저장
	
	if(id.equals("admin"))
	{
		session.setAttribute("name", "관리자");
		response.sendRedirect("../adminhome.jsp");
	}
	
	LogonDBBean logon = LogonDBBean.getInstance();	//로그인관련 메소드 클래스
    int check= logon.userCheck(id,passwd,logon.STUDENT_USER);	//입력받은 id와 패스워드를 가지고 db에 입력된 정보와 비교해주는 메소드

	if(check==1){	//로그인에 성공하였을때
		session.setAttribute("stuNum",id);	//세션에 학번을 저장한다.
		session.setAttribute("name", logon.getUserName(id, logon.STUDENT_USER));	//db에서 이름을 불러와서 세션에 저장한다.
		response.sendRedirect("../home.jsp");	//home.jsp 페이지로 페이지 이동
		
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}%>