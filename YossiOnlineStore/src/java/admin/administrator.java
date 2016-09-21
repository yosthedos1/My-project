package admin;

import database.DB_Conn;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Yossi
 */
public class administrator {
    Connection c;
    String admin_email = null;
    String user_email = null;

    public ArrayList<String> getListsOfAdmin() throws SQLException, ClassNotFoundException {
        c = new DB_Conn().getConnection();
        String getAdministratorsEmail = " SELECT * "
                        +" FROM  `shop_db`.`administrators` ";
        
        Statement st = c.createStatement();
        ResultSet executeQuery = st.executeQuery(getAdministratorsEmail);
        listsOfAdmin.clear();
        while (executeQuery.next()){
            listsOfAdmin.add(executeQuery.getString("email"));
        }
        return listsOfAdmin;
    }
     
    ArrayList <String> listsOfAdmin = new ArrayList<String>();
    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }
    
    public ArrayList<String> getListsOfUsers() throws SQLException, ClassNotFoundException {
        c = new DB_Conn().getConnection();
        String getUserEmail = " SELECT * "
                        +" FROM  `shop_db`.`user` ";
        
        Statement st = c.createStatement();
        ResultSet executeQuery = st.executeQuery(getUserEmail);
        listsOfUsers.clear();
        while (executeQuery.next()){
            listsOfUsers.add(executeQuery.getString("email"));
        }
        return listsOfUsers;
    }
    
    ArrayList <String> listsOfUsers = new ArrayList<String>();
    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = admin_email;
    }
    
    
    
    
    
    
}
