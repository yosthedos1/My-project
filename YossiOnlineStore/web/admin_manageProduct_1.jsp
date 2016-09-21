<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>


           <div class="clear"></div>
        <%

            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            String productId = request.getParameter("sortBy");
            
            
                String sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` ";
                
                if (productId.equals("qa")){
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `product_qty` ASC ";
                } else if(productId.equals("qd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `product_qty` DESC ";
                } else if(productId.equals("ha")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `hits` ASC ";
                } else if(productId.equals("hd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `hits` DESC ";
                    //price
                }  else if(productId.equals("pa")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `price` ASC ";
                } else if(productId.equals("pd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `price` DESC ";
                } 
             
                Statement st1 = c.createStatement();
                ResultSet rs = st1.executeQuery(sqlFetchItems.toString());

                while (rs.next()) {
                    String product_id = rs.getString("product_id");

                    String product_name = rs.getString("product-name");

                    String sub_category_name = rs.getString("sub-category-name");

                    String category_name = rs.getString("category-name");

                    String company_name = rs.getString("company-name");

                    String price = rs.getString("price");

                    String summary = rs.getString("summary");

                    int qty = rs.getInt("product_qty");

                    String hits = rs.getString("hits");

                    String image_name = rs.getString("image-name");                 
                    String alert="";
                    if (qty<5){
                           alert = "alert";
                    }
        %>
        <div class="clear"></div>
        
        <div class="grid_13 <%= alert %>">
        <div class="grid_2">
            <a href="admin_manageProduct.jsp?pid=<%=product_id%>"><img src="<%= image_name%>" /></a>
        </div>
            <div class="grid_6">
                <p id="info"><a href="admin_manageProduct.jsp?pid=<%=product_id%>"><h3><span class="blue"> <%=product_name%></span></h3></a>By <%= company_name + " " + category_name%><br/><span class="red"><%= price%></span></p>
                <p style="display: inline;">Views <span class="blue"><%= hits %></span></p>
                
            </div>
            <div class="grid_4">
                <p><%=sub_category_name%></p>
                <div class="grid_3" style="display: inline;">
                    <h1 style="display: inline;"><%= qty %></h1> <a href="admin_manageProduct.jsp?pid=<%= product_id%>" id="greenBtn" style="display: inline;">ערוך מוצר</a> 
                </div>
                <p>Quantity</p>
            </div>
        </div>
        <div class="clear"></div>
        <%
            }
        %>
        <%
        
            %>
