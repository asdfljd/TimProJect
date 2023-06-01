<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title></title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style2.css">
        <script src="js/script.js"></script>
    </head>
    <body>
    	<%
    		String num=null;
    		String name=null;
    		String email=null;
    		boolean login=false;
    		if(session.getAttribute("login")!=null){
    			login=(boolean)session.getAttribute("login");//
    		}
    	
    	
    	%>
        <div id="wrap">
            <div class="header">
                <ul class="menu">
                    <li><a href="information.html">시험안내</a><li>
                    <li><a href="#">오답노트</a></li>
                    <li><a href="mypage.jsp">마이 페이지</a></li>
                </ul>
                
            </div>
            <div class="contents">
                    <div class="inside">  
                    <%if(!login){    %>    
                        <form method="get" action="login_b.jsp">
                            <span>id</span><input type="email" name="id" placeholder="이메일 형식으로 써주세요."><br>
                            <span>pw</span><input type="text" name="pw" placeholder="비밀번호를 입력하세요.">
                            <div class="lnj">                    
                                <div class="login"><a href="index.jsp"><input type="submit" style="opacity:0;">로그인</a></div>
                                
                                <div class="find">
                                    <a href="findPw.html">비밀번호 찾기</a>
                                    |
                                    <a href="findId.html">아이디 찾기</a>
                                    |
                                    <a href="join.jsp">회원가입</a>
                                </div>
                                                    
                            </div>
                        </form>
                	<%}else { %>
                			<h1>로그인이 된 상태입니당.</h1>
                			<h3><% out.println(session.getAttribute("user_name"));%>님 환영합니다.</h3>
                			<h3><% out.println(session.getAttribute("user_id"));%>계정으로 로그인이 되었습니다.</h3>
                			<h3><% out.println(session.getAttribute("user_tel"));%>로 전화가 갈 수 있습니다. 주의하세요</h3>
                			<a href="onebyone.jsp"><input type="button">문제풀러가자 </a>
							<input type="button" value="로그아웃!" onclick="logout()">
						<% } %>	
                </div>
            </div>
            <div class="side">
            </div>
            <div class="footer">
            </div>
        </div>
        <script>
        	function logout() {
        		location.href="logout_register.jsp";
        	}
        </script>
    </body>
</html>