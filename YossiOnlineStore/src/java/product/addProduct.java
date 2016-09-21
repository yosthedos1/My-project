
package product;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author student
 */
public class addProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String message, messageDetails, url;
        RequestDispatcher dispacher;
       
            
        String productName, productQty, company, category, subCategory, price, discountedPrice, summary, tags;
        company = request.getParameter("company");
        productQty = request.getParameter("productQty");
        productName = request.getParameter("productName");
        category = request.getParameter("category");
        subCategory = request.getParameter("subCategory");
        price = request.getParameter("price");
        tags = request.getParameter("tags");
        //discountedPrice = request.getParameter("discountedPrice");
        summary = request.getParameter("summary");
        PrintWriter out = response.getWriter();
        out.println("productName " + productName
                + " <br>company " + company
                + " <br>category " + category
                + " <br>subCategory " + subCategory
                + " <br>price " + price
               // + " <br>discountedPrice " + discountedPrice
                + " <br>summary <br>" + summary
                +" <br>summary <br>" + tags);
        if (!productName.equals("") || !price.equals("") ){
            try {
                String insertQuery = ""
                        + "INSERT INTO  "
                        + "`shop_db`.`products` "
                        + "(`product_id` ,"
                        + "`product-name` ,"
                        + "`sub-category-name` ,"
                        + "`category-name` ,"
                        + "`company-name` ,"
                        + "`price` ,"
                        + "`summary`, "
                        + "`tags`, "
                        + "`product_qty` ) "
                        + "VALUES "
                        + ""
                        + "(NULL ,  "
                        + "'"+productName+"',  "
                        + "'"+subCategory+"',  "
                        + "'"+category+"',  "
                        + "'"+company+"',  "
                        + "'"+price+"', "
                        + "'"+summary+"', "
                        + "'"+tags+"', "
                        + ""+productQty+");";
                
                DB_Conn conn = new DB_Conn();
                Connection con = conn.getConnection();
                Statement st = con.createStatement();
                
                int rows = st.executeUpdate(insertQuery);
                if (rows == 1){
                    /*out.print(company +" "+ productName+ ""
                    + " Product Inserted ");*/
                    
                    //GET THE ID OF THE Product recently inserted
                    ResultSet executeQuery = st.executeQuery("SELECT  `product_id` "
                                                         + " FROM  `products` "
                                                         + " WHERE  `product-name` =  '"+productName+"'");
                    String ProductId = "";
                    while (executeQuery.next()){
                        ProductId = executeQuery.getString("product_id");
                    
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("productName", productName);
                    session.setAttribute("productId", ProductId);
                    out.print("Product inserted");
                    message = "Product Inserted...";
                    messageDetails = company +" "+ productName+ ""
                            + " Product Inserted Successfully... ";
                    url ="/productInsertImages.jsp";
                    request.setAttribute("productName", productName);
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
                    dispacher.forward(request, response);
                }
                st.close();
                con.close();
            }
            catch (SQLException ex) {
                    message = "Product Not Inserted...";
                    messageDetails = company +" "+ productName+ ""
                            + " Product not Inserted because of a Database error";
                    out.print("Product not inserted "+ ex);
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    
            
                //Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                //out.println("Class Not Found Exception "+ex);
                
                    message = "Product Not Inserted...";
                    messageDetails = company +" "+ productName+ ""
                            + " Product not Inserted because of an error";
                    
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                  
          
            }
        }
        else {
            //out.println("Please Enter Product-name and Price");
                    message = "Product Not Inserted...";
                    messageDetails = "Please Enter Product-name and Price";
                    out.print("Product not inserted " + " "+message);
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
            dispacher.forward(request, response);
        }
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        doGet(request, response);
    }
}
