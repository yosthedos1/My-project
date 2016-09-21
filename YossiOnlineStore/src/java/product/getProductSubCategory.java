package product;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yossi
 */
public class getProductSubCategory extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //processRequest(request, response);
            String category = request.getParameter ("category");
            Connection c = new DB_Conn().getConnection();
            Statement st = c. createStatement();
            ResultSet executeQuery = st.executeQuery("SELECT * " +
                                                " FROM  `sub-category` " +
                                                " WHERE  `category_name` =  '"+category+"' ");
            while (executeQuery.next()){
                String subCategory = executeQuery.getString("sub-category_name");
                out.print("<option value='"+subCategory+"'>"+subCategory+"</option>");
            }
            
        } catch (SQLException ex) {
            out.print("SQL EXCEPTION "+ex);
            Logger.getLogger(getProductSubCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(getProductSubCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
