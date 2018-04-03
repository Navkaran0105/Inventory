/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inventory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.util.Date;
import javax.swing.table.DefaultTableModel;
import java.text.SimpleDateFormat;
/**
 *
 * @author GTB Student
 */
public class buyitem extends javax.swing.JInternalFrame {

    /**
     * Creates new form buyitem
     */
    public buyitem() {
        initComponents();
        fetchbillno();
        fetchcat();
        fetchsupplier();
        Date currdt = new Date();
        jDateChooser1.setDate(currdt);
    }
     void fetchbillno()
    {
        
        String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from buyitem order by billno desc";
                PreparedStatement myst = myconn.prepareStatement(q);
                ResultSet res = myst.executeQuery();
                if(res.next())
                {
                    int code = res.getInt("billno") + 1;
                    jLabel4.setText(String.valueOf(code));
                }
                else
                {
                    jLabel4.setText("1");
                }
               
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
    }
    void fetchcat()
    {
        
        String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from addcategory";
                PreparedStatement myst = myconn.prepareStatement(q);
                ResultSet res = myst.executeQuery();
                while(res.next())
                {
                   jComboBox1.addItem(res.getString("categoryname"));
                }
                if(jComboBox1.getItemCount()==1)
                {
                    jComboBox1.removeAllItems();//removes choose
                    jComboBox1.addItem("No Categories"); 
                }
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
    }
    void fetchsubcat()
    {
        
        String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from addsubcat where categoryname=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, jComboBox1.getSelectedItem().toString());
                ResultSet res = myst.executeQuery();
                jComboBox2.removeAllItems();
                jComboBox2.addItem("Choose"); 
                while(res.next())
                {
                   jComboBox2.addItem(res.getString("subcategoryname"));
                }
                if(jComboBox2.getItemCount()==1)
                {
                    jComboBox2.removeAllItems();//removes choose
                    jComboBox2.addItem("No Sub Categories"); 
                }
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
    }
   
    void fetchproduct()
    {
        
        String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from addproduct where subcategory=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, jComboBox2.getSelectedItem().toString());
                ResultSet res = myst.executeQuery();
                jComboBox3.removeAllItems();
                jComboBox3.addItem("Choose"); 
                while(res.next())
                {
                   jComboBox3.addItem(res.getString("productname"));
                }
                if(jComboBox3.getItemCount()==1)
                {
                    jComboBox3.removeAllItems();//removes choose
                    jComboBox3.addItem("No Sub Categories"); 
                }
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
    }
     void fetchsupplier()
    {
        
        String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                String q="select * from addsupplier";
                PreparedStatement myst = myconn.prepareStatement(q);
                ResultSet res = myst.executeQuery();
                jComboBox4.removeAllItems();
                jComboBox4.addItem("Choose"); 
                while(res.next())
                {
                   jComboBox4.addItem(res.getString("suppliername"));
                }
                if(jComboBox4.getItemCount()==1)
                {
                    jComboBox4.removeAllItems();//removes choose
                    jComboBox4.addItem("No Suppliers"); 
                }
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jComboBox4 = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jTextField2 = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel1.setText("Buy Item");

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel2.setText("Bill No");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel3.setText("Choose Category");

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel4.setText("..................");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Choose" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel5.setText("Choose Sub Category");

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Choose" }));
        jComboBox2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox2ActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel6.setText("Choose Product");

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Choose" }));

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel7.setText("Choose Supplier");

        jComboBox4.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Choose" }));

        jLabel8.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel8.setText("Quantity");

        jButton1.setText("Save Bill");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Category", "Sub Category", "Product", "Quantity", "Cost", "Total Cost"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        jLabel9.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel9.setText("Cost");

        jButton2.setText("Add");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel10.setText("Date");

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel11.setText("................");

        jLabel12.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel12.setText("................");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(420, 420, 420)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 106, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(129, 129, 129)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jScrollPane1)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGap(134, 134, 134)
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                                        .addComponent(jLabel8)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                                .addGap(18, 18, 18)
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                            .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jLabel9))
                                                        .addGap(39, 39, 39)
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                            .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addGap(88, 88, 88)
                                                        .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 165, javax.swing.GroupLayout.PREFERRED_SIZE))))
                                            .addGroup(layout.createSequentialGroup()
                                                .addGap(91, 91, 91)
                                                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(225, 225, 225)
                                                .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 106, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                        .addGap(0, 0, Short.MAX_VALUE)))))
                        .addGap(43, 43, 43)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(40, 40, 40))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel1)
                .addGap(36, 36, 36)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel2)
                        .addComponent(jLabel4)
                        .addComponent(jLabel10))
                    .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9)
                    .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton2))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 280, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 44, Short.MAX_VALUE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel11)
                        .addComponent(jLabel12)))
                .addGap(31, 31, 31))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
       if(jComboBox1.getSelectedIndex()>0)
       {
        fetchsubcat();
       }
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jComboBox2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox2ActionPerformed
       if(jComboBox2.getSelectedIndex()>0)
       {
           fetchproduct();
       
       }
    }//GEN-LAST:event_jComboBox2ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        DefaultTableModel mymodel = (DefaultTableModel)jTable1.getModel();
       
        String cat =jComboBox1.getSelectedItem().toString();
        String subcat = jComboBox2.getSelectedItem().toString();
        String prod = jComboBox3.getSelectedItem().toString();
        int qt = Integer.parseInt(jTextField1.getText());
        int cost = Integer.parseInt(jTextField2.getText());
        int tcost= qt*cost;
        Object myrow[] = {cat,subcat,prod,qt,cost,tcost};
        mymodel.addRow(myrow);
        fetchgtotal();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
         String path="jdbc:mysql://localhost/inventorydb";
        try
        {
            Connection myconn = DriverManager.getConnection(path,"mydbuser","123");
            try
            {
                
                Date billdt = jDateChooser1.getDate();
                SimpleDateFormat myformat= new SimpleDateFormat("yyyy-MM-dd");
                
                String bdt = myformat.format(billdt);
                
                String q="insert into buyitem values(?,?,?,?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, jLabel4.getText());
                myst.setString(2, bdt);
                myst.setString(3, jComboBox4.getSelectedItem().toString());
                myst.setString(4, jLabel12.getText());
                int res = myst.executeUpdate();
                
                String r="insert into billdetails(billno,choosecategory,choosesubcategory,product,quantity,cost,totalcost) values(?,?,?,?,?,?,?)";
                String r1="update addproduct set stock=stock+? where productname=?";
                PreparedStatement mysta = myconn.prepareStatement(r);
                PreparedStatement mysta2 = myconn.prepareStatement(r1);
                for(int x=0;x<jTable1.getRowCount();x++)
                {
                    mysta.setString(1,jLabel4.getText());
                    mysta.setString(2,jTable1.getValueAt(x,0).toString());
                    mysta.setString(3,jTable1.getValueAt(x,1).toString());
                    mysta.setString(4,jTable1.getValueAt(x,2).toString());
                    mysta.setString(5,jTable1.getValueAt(x,3).toString());
                    mysta.setString(6,jTable1.getValueAt(x,4).toString());
                    mysta.setString(7,jTable1.getValueAt(x,5).toString());
                    mysta.executeUpdate();
                    
                    mysta2.setString(1,jTable1.getValueAt(x,3).toString());
                    mysta2.setString(2,jTable1.getValueAt(x,2).toString());
                    mysta2.executeUpdate();
                }
                
                 JOptionPane.showMessageDialog(rootPane, "Bill generated succesfully"); 
                 
                 printbillpurchase obj = new printbillpurchase();
                 obj.billno=jLabel4.getText();
                 obj.billdt=jDateChooser1.getDate().toString();
                
                 MainFrame.jDesktopPane1.add(obj);
                 obj.setVisible(true);
            }
            catch(Exception e)
            {
                JOptionPane.showMessageDialog(rootPane, "Error in query" + e.getMessage()); 
            }
            finally
            {
                myconn.close();
            }
        }
        catch(SQLException e)
        {
            JOptionPane.showMessageDialog(rootPane, "Error in connection" + e.getMessage());
        }
        
    }//GEN-LAST:event_jButton1ActionPerformed
    void fetchgtotal()
    {
        int gtotal=0;
        for(int x=0;x<jTable1.getRowCount();x++)
        {
            gtotal+=Integer.parseInt(jTable1.getValueAt(x, 5).toString());
            
        }
        jLabel11.setText("Total Cost is Rs.");
        jLabel12.setText(String.valueOf(gtotal));
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JComboBox<String> jComboBox4;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    // End of variables declaration//GEN-END:variables
}
