/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
/**
 *
 * @author DELL
 */
public class Datahelper {
    static Connection con;
    static Statement st;
    public static void connection() throws Exception
    {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb","root","");
            st = con.createStatement();
    }
    
    public static int dmlOperation(String sqlstr) throws Exception
    {
        return st.executeUpdate(sqlstr);
    }
    public static ResultSet dqlOperation(String sqlstr) throws SQLException
    {
        return st.executeQuery(sqlstr);
    }
    public static void closeConnection() throws SQLException
    {
        con.close();
    }
}
