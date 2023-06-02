<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	<body>
		<h1>마이페이지 내 정보 조회</h1>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url="jdbc:mysql://127.0.0.1:3306/sample";
			String db_id="root";
			String db_pw="iotiot";
			String sql="select * from member ";
			sql+="where user_seq="+"'"+session.getAttribute("user_seq")+"'"+";";
			
			
			try{
				
				boolean login=false;
				if(session.getAttribute("login")!=null) {
					login=(boolean)session.getAttribute("login");
					
				}
				System.out.println(session.getAttribute("login"));
				System.out.println(sql);
					if( login ){
				
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=DriverManager.getConnection(url,db_id,db_pw);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					
					
					System.out.println("마이페이지 접속성공");
				
			%>
				<div id="wrap">
					<table>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>연락처</th>
						</tr>
					
				
			<%
				while(rs.next()){
					String num=rs.getString("user_seq");
					String id=rs.getString("user_id");
					String pass=rs.getString("user_password");
					String name=rs.getString("user_name");
					String birth=rs.getString("user_birth");
					String tel=rs.getString("user_tel");	
			
			%>
				<tr>
					<td><%=num %></td>
					<td><%=id %></td>
					<td><%=pass %></td>
					<td><%=name %></td>
					<td><%=birth %></td>
					<td><%=tel %></td>
				</tr>
			<% 					} %><!-- 자바while문 괄호  -->
					</table>
				</div>
			<%
				
				}else{
					%><h1>보고싶으면 로그인하이소</h1> <% 
					System.out.println("---로그아웃(세션 종료)상태로 마이페이지에 접근---");
				}
			}catch(Exception e){
				System.out.println("접속중 오류 발생 :"+e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("접속 해제 중 오류 발생: "+ex);
				}
			}
		%>
		
		
		
		
	</body>
</html>