
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title></title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style8.css">
        <script src="js/script2.js"></script>
    </head>
    <body>
    	<%
    		Connection conn = null;
    		Statement stmt = null;
    		ResultSet rs=null;
    		
    		String url="jdbc:mysql://127.0.0.1:3306/sample";
    		String db_id="root";
    		String db_pw="iotiot";
    		String sql="select * from member ";
    		sql+="where user_seq="+"'"+session.getAttribute("user_seq")+"';";
    		
    		try{
    			
    			boolean login=false;
    			if(session.getAttribute("login")!=null) {
    				login=(boolean)session.getAttribute("login");
    			}
    			System.out.println(session.getAttribute("login"));
    			System.out.println(sql);
    			
    			if( login ) {
    				Class.forName("com.mysql.cj.jdbc.Driver");
    				conn=DriverManager.getConnection(url,db_id,db_pw);
    				stmt=conn.createStatement();
    				rs=stmt.executeQuery(sql);
    				
    				System.out.println("마이페이지 접속 성공!");
    	%>			
    		
    
        <div id="wrap">
            <div class="header">
                <ul class="menu">
                    <li><a href="information.jsp">시험안내</a></li>
                    <li><a href="#">오답노트</a></li>
                    <li><a href="#">마이 페이지</a></li>
                </ul>
                
            </div>
            <div class="contents">
                
                 <div id="mypage">
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
						</table>
				 </div>
  		<% 					}  %><!-- while문안에서 데이터 넣어주고 쏴주고 다해야한다. 다른 것은 while문안에 들어가면 안된다. -->
  		
  		
  		
  		
                    <!--<div>
                        <a href="#">로그인</a>
                    </div>
                    <div>
                        <a href="#">아이디 찾기</a>
                    </div>
                    <div>
                        <a href="#">비밀번호 찾기</a>
                    </div>
                    <div>
                        <a href="#">회원가입</a>
                    </div>-->
                
            </div>
            <!--<div class="side">
            </div>-->
            <div class="footer">
            </div>
        </div>
      <% 
        		}else{
        			%><h1>로그인시 입장가능한 페이지 입니다.</h1> <% 
        			System.out.println("--로그아웃(세션종료)상태로 마이페이지에 접근--");
        
	}
    		}catch(Exception e) {
    			System.out.println("접속 중 오류 발생 : "+e);
    		}finally{
    			try{
    				if(rs!=null)rs.close();
    				if(stmt!=null)stmt.close();
    				if(conn!=null)conn.close();
    				
    			}catch(Exception ex){
    				System.out.println("접속 해제 중 오류 발생 : "+ex);
    			}
    		}
    	%>  	
    </body>
   
</html>

       
