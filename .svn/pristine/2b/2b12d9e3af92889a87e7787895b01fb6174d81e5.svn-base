<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
</head>

<body id="loginpage">
    <form id="/login" class="formee" action="/login" method="post">
        <div class="container_16 clearfix">
            <div class="push_5 grid_6"></div>
            <div class="clear"></div>
            <div class="widget push_5 grid_6" id="login">
                <div class="widget_title">
                    <h2>대학 생활 정보 시스템(ULIS)</h2>
                </div>
                <div id="clomeyes" class="widget_body">
                    <div class="widget_content">
                        <label class="block" for="username">아이디:</label>
                        <input type="text" id="id" name="userNo" maxlength="20" tabindex="1" class="large"/>
                        <label class="block" for="password">비밀번호:</label>
                        <input type="password" id="password" name="password" maxlength="10" tabindex="2" class="large" />
                        <div style="margin-top:10px">
                            <input type="submit" id="btn_login" value="로그인" class="btn right large">
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $("#btn_login").on("click", function(e) {
            $("#form_login").submit();
        });
    </script>
</body>
</html>