<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%
            String sqlSearch = "";
            if (request.getParameter("searchbar") != null){
                String searchText = request.getParameter("searchbar");
                String searches [] = searchText.split(" ");
                
                if (searchText.length() >= 0){
                    
                sqlSearch = "SELECT * FROM  `products` p "
                            + "INNER JOIN  `images` i "
                            + "USING (  `product-name` ) WHERE ";
                
                for (int i=0; i<searches.length; i++){
                    if (searches[i].trim().length() > 2){
                        sqlSearch+=" `tags` LIKE '%"+searches[i]+"%' ";
                        if (i != searches.length-1){
                            sqlSearch+=" AND ";
                           
                        }
                    }
                }
                sqlSearch+=" AND `product_qty` > 5 ";
                
                sqlSearch+=" GROUP BY  `product-name` ";
                
                sqlSearch+=" ORDER BY  `hits` DESC ";
                
                %>
        
            <!-- Middle -->
            <div class="container_16">
            <div class="grid_15 push_1">
                <div class="grid_14" id="whiteBox">
                    
                        <%
                        
                            
                                DB_Conn con = new DB_Conn();
                                Connection c = con.getConnection();

                                Statement st = c.createStatement();
                                ResultSet rs = st.executeQuery(sqlSearch.toString());

                                while (rs.next()) {
                                    
                                    String product_id = rs.getString("product_id");

                                    String product_name = rs.getString("product-name");

                                    String sub_category_name = rs.getString("sub-category-name");

                                    String category_name = rs.getString("category-name");

                                    String company_name = rs.getString("company-name");

                                    String price = rs.getString("price");

                                    String summary = rs.getString("summary");
                                    
                                    String image_name = rs.getString("image-name");

                        %>
                        <div class="clear"></div>
                        <div class="grid_2">
                            
                        </div>
                        <div class="grid_14">
                            <div class="grid_10">
                                <p id="info"><a href="product.jsp?id=<%=product_id%>"><h3><span class="blue"> <%=product_name %></span></h3></a>By <%= company_name+" "+ category_name %><br/><span class="red"><%= price %></span></p>
                            </div>
                            <div class="grid_3">
                                <p><%=sub_category_name %>  <a href="addToCart.jsp?id=<%= product_id %>" id="greenBtn">הוסף לעגלה</a></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <%
                                }
                            rs.close();
                            st.close();
                            c.close();
                            
                        %>


                        <div class="clear"></div>
                </div></div>
            </div>
<%
            }
        %><%

        
                }
                %>