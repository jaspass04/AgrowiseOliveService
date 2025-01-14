<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="appError.jsp" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		
		<%@ include file="header.jsp" %>

		<meta name="description" content="Lesson6 - example">
		<meta name="author" content="sofos@aueb.gr">
		<title>Agro-Wise - Your Olive AI Guide</title>

		<style>						
			.form-signin {
				max-width: 330px;
				padding: 15px;
				margin: 0 auto;
			}
			.form-signin .form-signin-heading,
			.form-signin .checkbox {
				margin-bottom: 10px;
			}
			.form-signin .form-control {
				position: relative;
				height: auto;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				padding: 10px;
				font-size: 16px;
			}
			.form-signin .form-control:focus {
				z-index: 2;
			}
			.form-signin input[type="text"] {
				margin-bottom: 10px;
				border-bottom-right-radius: 0;
				border-bottom-left-radius: 0;
			
			}
			.form-signin input[type="password"] {
				margin-bottom: 10px;
				border-top-left-radius: 0;
				border-top-right-radius: 0;
			}
		</style>
	
	</head>
<body>
    
    <div class="container theme-showcase" role="main">			
        
        <div class="row">
    
            <div class="col-xs-12">

<%
                if (request.getAttribute("error_message") != null) {
%>
                    <div class="alert alert-danger">

                        <%=(String)request.getAttribute("error_message") %>

                    </div>
<%
                }
%>	

<%
                if (request.getAttribute("success_message") != null) {
%>
                    <div class="alert alert-success">

                        <%=(String)request.getAttribute("success_message") %>

                    </div>
<%
                }
%>
        
                <form class="form-signin" method="POST" action="login_controller_lesson6.jsp">

                                        
                    <h2 class="form-signin-heading text-center">Ask anything you would like to learn about olives!</h2>

                    <label for="inputquery" class="sr-only">Insert Query</label> 
                    <input type="text" name="inputquery" id="inputquery" class="form-control" placeholder="inputquery" required>
        
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Ask!</button>
                </form>
                <div class="alert alert-info">
                    <strong>This is a demo version because until the project gets monetized, no OpenAI key will be used. Try:</strong>						
                        <ul>
                            <li>What is the global olive oil production?</li>
                        
                        </ul>
                </div>
            </div>
	
        </div>
        
    </div>
    <!-- /container -->

    
    <%@ include file="footer.jsp" %>
</body>
</html>