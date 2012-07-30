<%-- 
    Document   : validView1
    Created on : Jul 30, 2012, 10:34:32 AM
    Author     : Vaibhav
--%>

<%@page import="service.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .dnone{
            display: none;
        }
        div{
            width: 100%;
            height: 50px;
            border-bottom: solid;
            background-color: azure;
            text-align: center
        }
        div span{
            float: right;
        }
    </style>
    <script>
        
        function initRequest() {
            if (window.XMLHttpRequest) {
                return new XMLHttpRequest();
            } else if (window.ActiveXObject) {

                return new ActiveXObject("Microsoft.XMLHTTP");
            }
        }

        
        $(document).ready(function(){
            $(".hideBtn").click(function(){
                var r=confirm("You want to delete this Message?");
                if (r==true)
                {
                    $(this).parent().addClass("dnone");
                    var xmlhttp;
                    if (window.XMLHttpRequest)
                    {// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp=new XMLHttpRequest();
                    }
                    else
                    {// code for IE6, IE5
                        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.open("GET","AjaxController?action=deleteBlog&id="+$(this).attr("id"),true);
                    xmlhttp.onreadystatechange=function()
                    {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200)
                        {
                            //alert($(this).parent().innerHTML);    
                        }
                    }
                    xmlhttp.send(null);
                }
                else
                {
                }
            });
        });
    </script>
    <body>
        <h4>Hello <%=request.getSession().getAttribute("user")%></h4>
    <center>
        <form action="BlogAdder" method="post">
            Enter your Message: <input type="text" maxlength="100" size="100"  name="blog"/><br>
            <input type="submit" value="Add Message"/>
        </form>        
        <%
            java.util.Vector<service.Blog> blogs = (java.util.Vector<service.Blog>) request.getAttribute("blogs");
            for (int i = 0; i < blogs.size(); i++) {
                service.Blog b = blogs.elementAt(i);
        %>
        <div>
            <%=b.getMessage()%> <span id='<%=b.getId()%>' class="hideBtn">Delete this message</span>
            <br>
            <span>published by <%=b.getUser()%> on  <%=b.getDate()%></span>
        </div>
        <%
            }
        %>  
    </center>
</body>
</html>
