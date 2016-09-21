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
public class addSubCategory extends HttpServlet { 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String SubCategoryName = request.getParameter("SubCategoryName");
        
        String categoryName = request.getParameter("categoryName");
        
        PrintWriter out = response.getWriter();
        String message = addSubCategory(SubCategoryName, categoryName);
        out.print(message);
    }
    
    private  String addSubCategory (String SubCategoryName, String categoryName){
        String message;
        
        if (SubCategoryName.equals("")){
            message ="Please enter in a SubCategory name for "+categoryName ;
        }
        else {
            try {
                //out.println("Done!!");
                Connection con;
                DB_Conn conn = new DB_Conn();
                con = conn.getConnection();
                
                String sqlInsertCompany ="INSERT INTO  `shop_db`.`sub-category` (`subcategory_id` ,`sub-category_name` ,`category_name`)VALUES (NULL ,  '"+SubCategoryName+"',  '"+categoryName+"');"; 
                Statement st = con.createStatement();
                int rows = st.executeUpdate(sqlInsertCompany);
                
                if (rows != 1){
                   // out.println("Company not inserted");
                    message = "Sub Category insertion cancelled.";
                }else {
                    //out.println(companyName+" Company Inserted");
                    message = SubCategoryName+" Sub-Category inserted" ;
                }
                st.close();
                con.close();
            } 
            catch (SQLIntegrityConstraintViolationException ex){
                //out.println("A comany name with the same name exists in your database... Try being specific.");
                message = "A SubCategory Name with the same name exists in your database... Try being specific.";
            }
            catch (SQLSyntaxErrorException ex){
                //out.println("A comany name with the same name exists in your database... Try being specific.");
                message = "Please provide names without quotes";
            }
            catch (SQLException ex) {
                //out.println("There was a problem in Connectiong DB <br/> Exception has occoured "+ex);
                message = "There was a problem in Connectiong DB <br/> Exception has occoured "+ex;
           
            } catch (ClassNotFoundException ex) {
                //out.println("Application Cannot find the Class <br/> Exception has occoured "+ex);
                message = "Application Cannot find the Class <br/> Exception has occoured "+ex;
            }
        }
        return message;
    }
    
}
