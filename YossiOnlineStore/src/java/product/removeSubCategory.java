package product;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yossi
 */
public class removeSubCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String message, messageDetail;
        message = "";
        messageDetail = "";
        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                 request.getServletContext().getRequestDispatcher(messageUrl);
        
        try {
            //processRequest(request, response);
            ArrayList<Integer> category = new ArrayList<Integer>();
            category.clear();
            
            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            PrintWriter out = response.getWriter();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()){
                        String[] parameterValues = request.getParameterValues(parameterNames.nextElement());
                        if (parameterValues.length > 1){
                            for (int i=0;i<parameterValues.length; i++){
                                out.println (" "+parameterValues[i]);
                                category.add(Integer.parseInt(parameterValues[i]));
                            }
                        }else {
                            out.println (" "+parameterValues[0]);
                            category.add(Integer.parseInt(parameterValues[0]));
                        }
            }
            /*DELETE FROM `sub-category` WHERE `subcategory_id` = '"+subcategory.get(i)+"'*/
            for (int i =0; i<category.size(); i++){
                category.get(i);
                out.println ("<br/><br/> "+category.get(i));
                String sqlCategory = " DELETE FROM `sub-category` WHERE `subcategory_id` = '"+category.get(i)+"' ";
                st.addBatch(sqlCategory);
            }
            st.executeBatch();
            response.sendRedirect("/admin_settings.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(removeCategory.class.getName()).log(Level.SEVERE, null, ex);
            message = "An Error occoured during the process of Deletion";
            messageDetail = "There was an error during the deletion of the process, Please try after some time";
                   
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(removeCategory.class.getName()).log(Level.SEVERE, null, ex);
            message = "An Error occoured during the process of Deletion";
            messageDetail = "There was an error during the deletion of the process, Please try after some time";

            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
          
        }
    }
}
