<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% session.invalidate(); %> <!-- 세션의 데이터를 모두 제거한다. -->

<script>
    alert("로그아웃 되었습니다.");
	location.href="login.html";
</script>