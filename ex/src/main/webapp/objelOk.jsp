<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>

	아이디 : <%= id %> <br/>
	비밀번호 : <%= pw %>
	
	 <hr/>
	 
	 아이디 : ${param.id}  <br/> <!-- 내장객체 사용 -->
	 비밀번호: ${param.pw}  <br/>
	 
	 아이디 : ${param["id"]}  <br/> <!-- 표기법 두개 -->
	 비밀번호 : ${param["pw"]}  
	 
	  <hr/>
	  
	applicationScope : ${applicationScope.application_name} <br/>
	sessionScope : ${sessionScope.session_name} <br/>
	pageScope : ${pageScope.page_name} <br/>
	requestScope : ${requestScope.request_name}
	
		<hr/>
		
	context 초기화 파라미터 <br />  <!-- context니까 전 서버에서 공통적으로 쓸 수 있는 contextParameter를 갖고 올 수 있대 -->
	${initParam.con_name} <br/>
	${initParam.con_id} <br/>
	${initParam.con_pw} <br/>
	
	 

</body>
</html>