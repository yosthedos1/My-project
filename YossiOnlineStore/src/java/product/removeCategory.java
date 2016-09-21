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
public class removeCategory extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String message, messageDetail;
        message = "";
        messageDetail = "";
        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                 request.getServletContext().getRequestDispatcher(messageUrl);
        
        try {
            //processRequest(request, response);
            ArrayList<Integer> subcategory = new ArrayList<Integer>();
            subcategory.clear();
            
            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            PrintWriter out = response.getWriter();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()){
                        String[] parameterValues = request.getParameterValues(parameterNames.nextElement());
                        if (parameterValues.length > 1){
                            for (int i=0;i<parameterValues.length; i++){
                                out.println (" "+parameterValues[i]);
                                subcategory.add(Integer.parseInt(parameterValues[i]));
                            }
                        }else {
                            out.println (" "+parameterValues[0]);
                            subcategory.add(Integer.parseInt(parameterValues[0]));
                        }
            }
            
            for (int i =0; i<subcategory.size(); i++){
                subcategory.get(i);
                out.println ("<br/><br/> "+subcategory.get(i));
                String sqlCategory = "  DELETE FROM `category` WHERE `category_id` = '"+subcategory.get(i)+"'  ";
                st.addBatch(sqlCategory);
            }
            st.executeBatch();
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
