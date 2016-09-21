<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        
        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/myScript.js"></script>
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
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("admin_.jsp");
            }
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_joinToFacebook.jsp"></jsp:include>
        <jsp:useBean class="admin.administrator" scope="session" id="admins"></jsp:useBean>
        <div class="container_16">

            <div class="grid_16" style="padding: 10px;" id="whiteBox">

                <br/>    
                <div class="grid_15 ">
                    <h1>הגדרות מנהל</h1>
                </div>
                <hr/>
            </div>
            <div class="clear"></div>

            <jsp:include page="includesPage/hesders_sidebars/admin_menuSideBar.jsp"></jsp:include>
            <%
                ArrayList<String> administrators = new ArrayList<String>();
                ArrayList<String> administrators2 = new ArrayList<String>();
                administrators.clear();
                administrators2.clear();
                administrators = admins.getListsOfAdmin();
                administrators2 = admins.getListsOfUsers();
            %>
            <div class="grid_13" id="whiteBox" style="padding:10px 0px 10px 0px;">

                <br/>    
                <div class="grid_13 ">
                    <h1>בחר מנהל נוסף</h1>
                </div>
                <hr/>
                <div class="grid_9 push_2" style="padding:10px;">
                    <form method="post" action="addAnAdministrator">
                        <div class="grid_2">
                            Select Email 
                        </div>
                        <div class="grid_5">
                            <select name="email">
                                <%
                                    for (int i = 0; i < administrators2.size(); i++) {
                                %>
                                <option value="<%= administrators2.get(i).toString()%>"><%= administrators2.get(i).toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="clear"></div><br/>
                        <div class="grid_2">
                            Password
                        </div>
                        <div class="grid_5">
                            <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/><br/> 
                        </div>
                        <div class="clear"></div>
                        <div class="grid_2">
                            Password Again
                        </div>
                        <div class="grid_5">
                            <input type="password" name="passAgain" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/><br/> 
                            <input id="greenBtn" type="submit" value="הוסף כמנהל"/>
                        </div>
                        <div class="clear"></div><br/>
                    </form>
                </div>

                <script type="text/javascript">
                    $(document).ready(function (){
                                        
                    })
                </script>       
                <br/>    


                <%
                    Connection c = new DB_Conn().getConnection();
                    Statement st = c.createStatement();
                    String sqlFetchCompany = "SELECT * FROM  `product-company` ";
                    String sqlFetchCategory = "SELECT * FROM  `category` ";
                    String sqlFetchSubCategory = "SELECT * FROM  `sub-category` ORDER BY `category_name` ";
                    ResultSet rs;
                    
                    
                %>


                <div class="grid_13 ">
                    <h1>הסר חברה</h1>
                </div>
                <hr/>
                <div class="grid_9 push_1">
                    <form method="post" action="removeCompany">
                        <div class="grid_4 push_2">
                            <input type="submit" value="הסר חברה מסומנת" id="buy"/>
                        </div>
                        <br/><div class="clear"></div>
                    <%
                    
                        rs = st.executeQuery(sqlFetchCompany);
                        while (rs.next())  {
                            String companyId = rs.getString("company-id");
                            String company = rs.getString("company-name");
                            %>
                            <div class="grid_4">
                                <a  style="display:inline;"><%= company %></a> 
                            </div>
                            <div class="grid_3">
                               <input style="display:inline;" type ="checkbox" name="company" value="<%= companyId %>" />
                            </div>
                            
                            <br/>
                    <%
                        }
                    %>
                    </form>
                    <br/><br/><br/></div>  


                <div class="grid_13 ">
                    <h1>הסר קטגוריה</h1>
                </div>
                <hr/>
                <div class="grid_9 push_1 ">
                    <form method="post" action="removeCategory">
                            <div class="grid_4 push_2">
                                <input type="submit" value="הסר קטגוריה מסומנת" id="buy"/>
                            </div>
                            <br/><div class="clear"></div>
                        <%
                        
                            rs = st.executeQuery(sqlFetchCategory);
                            while (rs.next())  {
                                String categoryId = rs.getString("category_id");
                                String categoryName = rs.getString("category_name");
                                %>
                                <div class="grid_4">
                                    <a  style="display:inline;"><%= categoryName %></a> 
                                </div>
                                <div class="grid_3">
                                   <input style="display:inline;" type ="checkbox" name="category" value="<%= categoryId %>" />
                                </div>
                                <br/>
                        <%
                            }
                        %>
                        </form>
                        <br/><br/><br/>
                </div>
                <br/>    
                <div class="grid_13 ">
                    <h1>הסר קטגורית משנה עבור קטגוריה</h1>
                </div>
                <hr/>
                <div class="grid_9 push_1">
                    <form method="post" action="removeSubCategory">
                        <div class="grid_4 push_2">
                            <input type="submit" value="הסר קטגורית משנה מסומנת" id="buy"/>
                        </div>
                        <br/><div class="clear"></div>
                    <%
                    
                        rs = st.executeQuery(sqlFetchSubCategory);
                        while (rs.next())  {
                            String subCatId = rs.getString("subcategory_id");
                            String category_name = rs.getString("category_name");
                            String subCatName = rs.getString("sub-category_name");
                            %>
                            <div class="grid_4">
                                <a  style="display:inline;"><%= subCatName %></a> >>
                                <a  style="display:inline;"><%= category_name %></a> 
                            </div>
                            <div class="grid_3">
                               <input style="display:inline;" type ="checkbox" name="subCategory" value="<%= subCatId %>" />
                            </div>
                            
                            <br/>
                    <%
                        }
                    %>
                    </form>
                    <br/><br/><br/></div>  
 

            </div>
        </div>
    </body>
</html> 