package product;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yossi
 */
public class addCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String categoryName = request.getParameter("categoryName");
        PrintWriter out = response.getWriter();
        String message = addCategory(categoryName);
        out.print(message);
    }
    
    private  String addCategory (String categoryName){
        String message;
        
        if (categoryName.equals("")){
            message ="Please enter in a Category Name";
        }
        else {
            try {
                Connection con;
                DB_Conn conn = new DB_Conn();
                con = conn.getConnection();
                String sqlInsertCompany ="INSERT INTO  `shop_db`.`category` (`category_id` ,`category_name`)VALUES (NULL ,  '"+categoryName+"');"; 
                Statement st = con.createStatement();
                int rows = st.executeUpdate(sqlInsertCompany);
                
                if (rows != 1){
                    message = "category insertion failed.";
                }else {
                    message = categoryName+" category inserted";
                }
                st.close();
                con.close();
            } 
            catch (SQLSyntaxErrorException ex){
                message = ("Please provide names without quotes");
            }
            catch (SQLIntegrityConstraintViolationException ex){
                message = "A category name with the same name exists in your database... Try being specific.";
            }
            catch (SQLException ex) {
                message = "There was a problem in Connectiong DB <br/> Exception has occoured "+ex;
           
            } catch (ClassNotFoundException ex) {
                message = "Application Cannot find the Class <br/> Exception has occoured "+ex;
            }
        }
        return message;
    }
}
