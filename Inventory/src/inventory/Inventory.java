package inventory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Inventory 
{
    public static void main(String[] args) 
    {
          String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from addemp";
                PreparedStatement myst = myconn.prepareStatement(q);
                ResultSet res = myst.executeQuery();
                if(res.next())
                {
                    login ob= new login();
                    ob.setVisible(true);
                }
                else
                {
                    addadmin ob1=new addadmin();
                    ob1.setVisible(true);
                }
               
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(null, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(null, "Error in connection" + e.getMessage());
        }
    
    }
}
