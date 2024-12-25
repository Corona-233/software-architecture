package dao;

import entity.RawMaterialsList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class RawMaterialsListDao {
    public RawMaterialsListDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        // 数据库连接参数
        String JDBCURL = "jdbc:mysql://localhost:3306/proj?useUnicode=true&characterEncoding=UTF-8";
        String JDBCUSERNAME = "root";
        String JDBCPASSWORD = "root";
        return DriverManager.getConnection(JDBCURL, JDBCUSERNAME, JDBCPASSWORD);
    }

    public List<RawMaterialsList> getAllRawMaterialsList() {
        List<RawMaterialsList> rawMaterialsLists = new ArrayList<>();
        String sql = "select * from raw_materials_list";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String date = rs.getString("date");
                String odernum = rs.getString("odernum");
                String name = rs.getString("name");
                String weight = rs.getString("weight");
                String vehicle_num = rs.getString("vehicle_num");
                String specifications = rs.getString("specifications");
                String supplier = rs.getString("supplier");
                RawMaterialsList rawMaterialsList = new RawMaterialsList(id, date, odernum, name, weight, vehicle_num, specifications, supplier);
                rawMaterialsLists.add(rawMaterialsList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rawMaterialsLists;
    }

    public void deleteRawMaterialsList(int id) {
        String sql = "delete from raw_materials_list where id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateRawMaterialsList(RawMaterialsList rawMaterialsList) {
        int id = rawMaterialsList.getId();
        String date = rawMaterialsList.getDate();
        String odernum = rawMaterialsList.getOdernum();
        String name = rawMaterialsList.getName();
        String weight = rawMaterialsList.getWeight();
        String vehicle_num = rawMaterialsList.getVehicle_num();
        String specifications = rawMaterialsList.getSpecifications();
        String supplier = rawMaterialsList.getSupplier();

        String sql = "update raw_materials_list set date=? , odernum=? ,name=? , weight=? , vehicle_num=? , specifications=?  , supplier=? where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, date);
            pstmt.setString(2, odernum);
            pstmt.setString(3, name);
            pstmt.setString(4, weight);
            pstmt.setString(5, vehicle_num);
            pstmt.setString(6, specifications);
            pstmt.setString(7, supplier);
            pstmt.setInt(8, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addRawMaterialsList(String date, String odernum, String name, String weight, String vehicle_num, String specifications, String supplier) {
        String sql = "insert into raw_materials_list( date, odernum, name, weight, vehicle_num, specifications, supplier) values(?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, date);
            pstmt.setString(2, odernum);
            pstmt.setString(3, name);
            pstmt.setString(4, weight);
            pstmt.setString(5, vehicle_num);
            pstmt.setString(6, specifications);
            pstmt.setString(7, supplier);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<RawMaterialsList> getkeyRawMaterialsList(String key) {
        List<RawMaterialsList> rawMaterialsLists = new ArrayList<>();
        String sql = "select * from raw_materials_list where odernum like ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, "%" + key + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String date = rs.getString("date");
                String odernum = rs.getString("odernum");
                String name = rs.getString("name");
                String weight = rs.getString("weight");
                String vehicle_num = rs.getString("vehicle_num");
                String specifications = rs.getString("specifications");
                String supplier = rs.getString("supplier");
                RawMaterialsList rawMaterialsList = new RawMaterialsList(id, date, odernum, name, weight, vehicle_num, specifications, supplier);
                rawMaterialsLists.add(rawMaterialsList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rawMaterialsLists;
    }
}
