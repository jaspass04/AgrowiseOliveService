package agrowise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FieldsDAO {
    // get Fields method
    public List<Fields> getFields() throws Exception {
        List<Fields> fields = new ArrayList<Fields>();
        DB db = new DB();
        Connection con = null;
        String sql = "DELETE FROM fields WHERE field_name = ?";
        ;
        try{
         con = db.getConnection(); 
         PreparedStatement stmt = con.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery();
         while (rs.next()) {
           String fn = rs.getString("field_name");
           String l = rs.getString("location");
           double ac = rs.getDouble("acreage");
           String username = rs.getString("username");
           int olive_trees = rs.getInt("olive_trees");
           String dateString = rs.getString("reg_date");
           Fields field = new Fields(fn, l, ac, username, olive_trees, dateString);
           fields.add(field);
         }
        
         rs.close();
         stmt.close();
         db.close();
        
        }catch (SQLException e){
           throw new SQLException("Error accessing the database: " 
               + e.getMessage());

        }
        finally {
           try {
               db.close();
          } catch (Exception e) {

          }

        }
       
       return fields;
    }


    // Register method
    public void register(Fields field, String username) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();

            String checkQuery = "SELECT * FROM fields WHERE field_name = ?";
            ps = conn.prepareStatement(checkQuery);
            ps.setString(1, field.getField_name());
            rs = ps.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username or email already registered");
            }

            String insertQuery = "INSERT INTO fields (field_name, location, acreage, username, olive_trees, reg_date) VALUES (?, ?, ?, ?, ?, ?)";
    
            ps = conn.prepareStatement(insertQuery);
            ps.setString(1, field.getField_name());
            ps.setString(2, field.getLocation());
            ps.setDouble(3, field.getAcreage());
			ps.setString(4, username);
            ps.setInt(5, field.getOlive_trees());
            ps.setString(6, field.getReg_Date());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Error during registration: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }

    public List<Fields> getFieldsByUsername(String username) throws Exception {
        List<Fields> fields = new ArrayList<>();
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String query = "SELECT field_name, location, acreage, olive_trees, reg_date FROM fields WHERE username = ? ORDER BY reg_date;";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                String fieldName = rs.getString("field_name");
                String location = rs.getString("location");
                double acreage = rs.getDouble("acreage");
                int olive_trees = rs.getInt("olive_trees");
                String dateString = rs.getString("reg_date");
                Fields field = new Fields(fieldName, location, acreage, username, olive_trees, dateString);
                fields.add(field);
            }
        } catch (SQLException e) {
            throw new Exception("Error fetching fields: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
        return fields;
    }

    public void deleteField(String fieldname) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        String name = new String(fieldname.getBytes("ISO-8859-1"), "UTF-8"); 
        try {
            conn = db.getConnection();
            String query = "DELETE FROM fields WHERE field_name = ?;";
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error fetching fields: " + e.getMessage());
        } finally {
            db.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }

}

