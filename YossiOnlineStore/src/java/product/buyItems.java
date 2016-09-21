package product;

import cart.cart;
import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.user;

/**
 *
 * @author Yossi
 */
@WebServlet(name = "buyItems", urlPatterns = {"/buyItems"})
public class buyItems extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { //processRequest(request, response);
        doPost(request, response);
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String name, age, address, mobile;
        int order_id;
        Connection c = null;
        HttpSession session = request.getSession();
        user User;
        User = (user) session.getAttribute("user");
        cart Cart;
        Cart = (cart) session.getAttribute("cart");
        
        name = request.getParameter("name");
        age = request.getParameter("age");
        address = request.getParameter("address");
        mobile = request.getParameter("mobile");
        
        
        if (name.trim().length() > 1
                && address.trim().length() >= 1
                && mobile.trim().length() >= 1
                && mobile.trim().length() <= 12) {
            
            if (!(session.getAttribute("user") == null)
                    && !(session.getAttribute("cart") == null)) {
                
                try {
                    response.setContentType("text/html;charset=UTF-8");
                    
                    c = new DB_Conn().getConnection();
                    
                    //******* Starting a Transaction
                    c.setAutoCommit(false);
                    String insertOrder;
                    insertOrder = "    INSERT INTO  `shop_db`.`order` ("
                            + "    `order_id` ,"
                            + "    `user_id` ,"
                            + "    `status` ,"
                            + "    `shippers_name` ,"
                            + "    `address` ,"
                            + "    `mobile_number` ,"
                            + "    `shippers_email` ,"
                            + "    `ordered_On` ,"
                            + "    `total_order_price`"
                            + "    )"
                            + "    VALUES ("
                            + "    NULL ,  ?,  'pending',  ?,  ?,  ?, ?, NOW( ) ,  ?"
                            + "    );";
                    
                    PreparedStatement preparedSQL1 =
                            c.prepareStatement(insertOrder);
                    
                    preparedSQL1.setInt(1, User.getUserId()); // user iD

                    preparedSQL1.setString(2, name); //`shippers_name` 

                    preparedSQL1.setString(3, address); //`address` 

                    preparedSQL1.setString(4, mobile); //`mobile` 

                    preparedSQL1.setString(5, User.getUserEmail()); //`shippers_email` 

                    preparedSQL1.setDouble(6, Cart.getTotalPriceOfCart()); //`total_order_price`` 

                    int executeUpdatePreparedSQL1 = preparedSQL1.executeUpdate();
                    
                    if (executeUpdatePreparedSQL1 == 1) {
                        String getLatestOrderId = "SELECT  `order_id` "
                                + "FROM  `order` "
                                + "WHERE  `user_id` = " + User.getUserId() + " "
                                + "ORDER BY  `ordered_On` DESC; "
                                + "";
                        
                        preparedSQL1.close();
                        
                        Statement st = c.createStatement();
                        ResultSet executeQueryGetOrderId = st.executeQuery(getLatestOrderId);
                        executeQueryGetOrderId.next();

                        //Here we get the latest order id for the current user
                        order_id = executeQueryGetOrderId.getInt("order_id");
                        
                        executeQueryGetOrderId.close();

                        ArrayList<String> productCategorys = Cart.getProductCategorys();
                        ArrayList<String> productNames = Cart.getProductNames();
                        ArrayList<Double> prices = Cart.getPrices();
                        ArrayList<Integer> qty = Cart.getQty();
                        ArrayList<Integer> id = Cart.getId();
                        
                        String insertIntoSalesSQL3 = ""
                                + "INSERT INTO  `shop_db`.`sales` ("
                                + "`sales_id` ,"
                                + "`order_id` ,"
                                + "`product_id` ,"
                                + "`product_name` ,"
                                + "`product_price` ,"
                                + "`product_quantity` ,"
                                + "`sold_on` ,"
                                + "`user_id`"
                                + ")"
                                + "VALUES ("
                                + "    NULL ,  ?,  ?,  ?,  ?,  ?, NOW( ) ,  ? "
                                + "       );";
                        
                        PreparedStatement insertIntoSalesTable = c.prepareStatement(insertIntoSalesSQL3);
                        
                        for (int i = 0; i < productNames.size(); i++) {
                            
                            insertIntoSalesTable.setInt(1, order_id);
                            
                            insertIntoSalesTable.setInt(2, id.get(i));
                            
                            insertIntoSalesTable.setString(3, productNames.get(i));
                            
                            insertIntoSalesTable.setDouble(4, prices.get(i));
                            
                            insertIntoSalesTable.setInt(5, qty.get(i));
                            
                            insertIntoSalesTable.setInt(6, User.getUserId());
                            
                            int executeUpdateSalesTable = insertIntoSalesTable.executeUpdate();
                            
                            if (executeUpdateSalesTable == 1) {
                                out.println("Success");
                                
                            } else {
                                out.println("Failed for now Product name " + productNames.get(i));
                            }
                        }
                  
                        for (int i = 0; i < productNames.size(); i++) {
                            st.addBatch(
                                    " UPDATE  `products` "
                                    + " SET "
                                    + "`product_qty` =  `product_qty` - " + qty.get(i) + ""
                                    + " WHERE  `products`.`product_id` = " + id.get(i) + " "
                                    + " AND "
                                    + " `product-name` = '" + productNames.get(i) + "' ");
                            
                        }
                        int[] executeBatch = st.executeBatch();
                        int i = 0;
                        while (i < executeBatch.length) {
                            out.print("? --> " + executeBatch[i]);
                            i++;
                        }
                        c.commit();
                        response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                        
                    } else {
                        //not updated
        response.sendRedirect(request.getContextPath());
                    }
                    
                } catch (SQLException ex) {
                            try {
                            Logger.getLogger(buyItems.class.getName()).log(Level.SEVERE, null, ex);
                            c.rollback();  
                            String message, messageDetail;
                            String messageUrl = "/message.jsp";
                            RequestDispatcher dispatchMessage =
                                 request.getServletContext().getRequestDispatcher(messageUrl);
                            message = "Oops, Less Product Stock...!";
                            messageDetail = "We see that your demand for the product was critically higher than what we had in our inventory, We respect your purchase but your purchase was cancelled, We are sorry, but please in a urgent requirement do order less stock right now!!";
                            request.setAttribute("message", message);
                            request.setAttribute("messageDetail", messageDetail);
                            dispatchMessage.forward(request, response);
                            } catch (SQLException ex1) {                                
                            String message, messageDetail;
                            String messageUrl = "/message.jsp";
                            RequestDispatcher dispatchMessage =
                                 request.getServletContext().getRequestDispatcher(messageUrl);
                            message = "Oops, Less Product Stock...!";
                            messageDetail = "We see that your demand for the product was critically higher than what we had in our inventory, We respect your purchase but your purchase was cancelled, We are sorry, but please in a urgent requirement do order less stock right now!!";
                            request.setAttribute("message", message);
                            request.setAttribute("messageDetail", messageDetail);
                            dispatchMessage.forward(request, response);
                            }
                } catch (ClassNotFoundException ex) {
                    out.println("you user " + ex);
                    
                }
                session.removeAttribute("cart");
            } else {
                out.println ("No items in cart");
            }
            
        } else {
            
            out.println ("Not validated. you should change the name or something in your details");
        }
        
    }

}
