<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Yossi Online Store</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>

        <link rel="stylesheet" href="css/slider.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/slider.js"></script>





<script type="text/javascript" src="js/myScript.js"></script>

</head>
<body>

        <%
        if (session.getAttribute("user") == null ){// Then it is a new user, so show join now
            %>
            <jsp:include page="includesPage/_join.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        %>


    <%@include file="includesPage/_search_navigationbar.jsp" %>

    <%@include file="includesPage/_joinToFacebook.jsp" %>

   



    <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->


<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
            <div id="leftside" class="grid_3">
                <div>
                    <ul id="leftsideNav">
                        <li><a href="#"><strong>קטגוריות</strong></a></li>
                        
                        <%
                        while (rs.next()){
                            String category = rs.getString ("category_name");
                            %>
                            <li><a href="viewProducts_.jsp"><%= category %></a></li>
                        <%
                        }
                        %>
                      
                    </ul>
                </div>
               
            </div>


        </div>

        <!-- Middle -->
        <div id="middle"class="grid_13">
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        </div>
        <!--The Middle Content Div Closing -->
    </div>
    <!--The Center Content Div Closing -->

    <jsp:include page="includesPage/_footer.jsp"></jsp:include>





</body>
</html>



