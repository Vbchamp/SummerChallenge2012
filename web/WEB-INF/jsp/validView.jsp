<%-- 
    Document   : validView
    Created on : Jul 21, 2012, 4:07:57 PM
    Author     : Vaibhav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <h4>Hello ${Message}</h4>
    <center>
        
        <form action="BlogAdder" method="post">
            Enter your Message: <input type="text" maxlength="100" size="100"  name="blog"/><br>
            <input type="submit" value="Add Message"/>
        </form>        
        <c:forEach var="o" items="${blogs}">
            <div>
                ${o.getMessage()} <span id="${o.getId()}" class="hideBtn">Delete this message</span>
                <br>
                <span>published by ${o.getUser()} on  ${o.getDate()}</span>
            </div>
        </c:forEach>    
    </center>
</body>
</html>
