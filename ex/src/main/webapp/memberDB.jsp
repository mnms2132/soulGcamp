<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	Connection connection; //����
	Statement statement;
	ResultSet resultSet;
	
	String driver = "oracle.jdbc.OracleDriver"; //�̸� String ������ �� �Է���
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
		try { //����ó���ϱ�����
		Class.forName(driver); //����̹� �ε�
		connection = DriverManager.getConnection(url, uid, upw); //����̹��κ��� Ŀ�ؼ� ��ü ����
		statement = connection.createStatement(); //Ŀ�ؼ����κ��� ������Ʈ��Ʈ ��ü ���ؼ�
		resultSet = statement.executeQuery(query); //������Ʈ��Ʈ�κ��� ���� ��������
		
		while(resultSet.next()) {
			String id = resultSet.getString("id");
			String pw = resultSet.getString("pw");
			String name = resultSet.getString("name");
			String phone = resultSet.getString("phone");
			
			out.println("���̵� : "+ id + ", ��й�ȣ : "+ pw + ", �̸� : "+name + ", phone : "+ phone + "<br />");
		}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { //java�Ҷ� try���� �̻���� �����ϰų� �̻��� �־ catch ���� �����ص� finally�� ������ ����
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