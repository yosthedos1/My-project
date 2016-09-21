<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Yossi Online Store</title>
        <jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

        <%@page import="java.sql.*, database.*" %>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script src="js/myScript.js"></script>


        <style type="text/css">


            .buy {
                margin-top:7px;
                margin-bottom:15px;
                float:right;
                padding:5px;
                color:#000;
                text-shadow: 0 1px 0 white;
                padding:10px;
                border-radius:5px;
                background: -webkit-linear-gradient(top, #C0C0C0, #C0C0C0);
                background: -moz-linear-gradient(top, #C0C0C0, #C0C0C0);
                text-align:center;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);
                -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);
                -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);

            }
            .buy:hover {
                float:right;
                color:#000;
                border-radius:7px;
                text-shadow: 0 -1px 0 white;
                text-align:center;
                padding:10px;
                background: -webkit-linear-gradient(top, #C0C0C0,#C0C0C0);
                background: -moz-linear-gradient(top, #C0C0C0,#C0C0C0);
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4);
            }


            .highlight {
                box-shadow: inset -10px 0px 10px #666;
                background: #E0E0E0;
                border-radius: 0px 27px 27px 0px;
            }
            .adminMenu {
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 0px;
                background: #FFF;
                box-shadow: 0px 0px 10px #333;
            }
            .adminMain {
                margin-top: 10px;
                margin-bottom: 10px;
                background: #FFF;
                box-shadow: 0px -1px 10px #333;
            }
            #leftside {
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <%
            if (session.getAttribute("user") == null) {// Then it is a new user, so show join now
        %>
        <jsp:include page="includesPage/_join.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        
        if (session.getAttribute("admin")== null){
            response.sendRedirect("admin_.jsp");
        }
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_joinToFacebook.jsp"></jsp:include>

            <div class="container_16">

               
                <div class="clear"></div>
                
                <jsp:include page="includesPage/hesders_sidebars/admin_menuSideBar.jsp"></jsp:include>
                  
            <%
                DB_Conn conn = new DB_Conn();
                Connection con = conn.getConnection();
                Statement st = con.createStatement();
                //String sql_getCategory = "SELECT  `category_name` FROM  `category`; ";
                //String sql_getSubCategory = "SELECT  `sub-category_name` FROM  `sub-category`;";
                String sql_getCompany = "SELECT  `company-name` FROM  `product-company`;";
            %>
            
            
                <jsp:useBean class="product.productBean" scope="session" id="productBean"></jsp:useBean>
                
            <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                <div class="grid_13">
                    <br/><h1>שלב ראשון - הכנס שם חברה או בחר מתוך הרשימה</h1><hr/>
                </div>
                <div class="clear"></div>
                <form method="post" action="admin_addProduct_controller.jsp">
                    <input type="hidden" name="page" value="admin_addProduct_2.jsp"/>
                    <div class="grid_2">
                        <h3>בחר חברה</h3>
                    </div>
                    <div class="grid_5">
                        <select name="company" id="company">

                            <option value="" selected>בחר חברה</option>

                            <%
                                ResultSet company = st.executeQuery(sql_getCompany);
                                while (company.next()) {
                                    String companyName = company.getString("company-name");
                            %>

                            <option value="<%= companyName%>"><%= companyName%></option>

                            <%
                                }
                            %>


                        </select>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        או
                    </div>
                    <div class="grid_5">
                        <h4 id="step1Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        <h3>הוסף חברה</h3>
                    </div>
                    <div class="grid_5">
                        <input id="companyName" type="text" name= "companyName" placeholder="הכנס שם חברה כאן"/>
                    </div>
                    <div class="grid_2">

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="addProductNameBtn" class="buy" type="button" value="הוסף חברה"/>

                    </div>
                    <div class="grid_5">
                        <input id="buy" type="submit" value="הבא"/>
                    </div>
                </form>

            </div>

        </div>

    </body>
</html>
