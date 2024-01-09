<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	Connection connection; //선언
	Statement statement;
	ResultSet resultSet;
	
	String driver = "oracle.jdbc.OracleDriver"; //미리 String 값으로 다 입력함
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	String query = "select * from member";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		try { //예외처리하기위해
		Class.forName(driver); //드라이버 로드
		connection = DriverManager.getConnection(url, uid, upw); //드라이버로부터 커넥션 객체 구함
		statement = connection.createStatement(); //커넥션으로부터 스테이트먼트 객체 구해서
		resultSet = statement.executeQuery(query); //스테이트먼트로부터 쿼리 질의응답
		
		while(resultSet.next()) {
			String id = resultSet.getString("id");
			String pw = resultSet.getString("pw");
			String name = resultSet.getString("name");
			String phone = resultSet.getString("phone");
			
			out.println("아이디 : "+ id + ", 비밀번호 : "+ pw + ", 이름 : "+name + ", phone : "+ phone + "<br />");
		}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { //java할때 try문을 이상없이 수행하거나 이상이 있어서 catch 문을 시행해도 finally는 무조건 시행
			try {
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	
	%>
	
	
</body>
</html>