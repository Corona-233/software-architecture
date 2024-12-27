package dao;

import entity.DriverList;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverListDao {
    public DriverListDao() {
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
        String JDBCPASSWORD = "123456";
        return DriverManager.getConnection(JDBCURL, JDBCUSERNAME, JDBCPASSWORD);
    }

    //删除
    public void deleteDriver(int id) {
        String sql = "DELETE FROM driver_list WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //修改
    public void updateDriver(DriverList driver) {
        int id = driver.getId();
        String name = driver.getName();
        String idNumber = driver.getIdNumber();
        String gender = driver.getGender();
        String contactInfo = driver.getContactInfo();
        String vehicleType = driver.getVehicleType();
        String licenseExpiry = driver.getLicenseExpiry();
        String isWorking = driver.getIsWorking();

        String sql = "UPDATE driver_list SET name=?, id_number=?, gender=?, contact_info=?, vehicle_type=?, license_expiry=?, is_working=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, idNumber);
            pstmt.setString(3, gender);
            pstmt.setString(4, contactInfo);
            pstmt.setString(5, vehicleType);
            pstmt.setString(6, licenseExpiry);
            pstmt.setString(7, isWorking);
            pstmt.setInt(8, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //添加
    public boolean addDriver(DriverList driver) {
        String sql = "INSERT INTO driver_list (name, id_number, gender, contact_info, vehicle_type, license_expiry, is_working) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, driver.getName());
            pstmt.setString(2, driver.getIdNumber());
            pstmt.setString(3, driver.getGender());
            pstmt.setString(4, driver.getContactInfo());
            pstmt.setString(5, driver.getVehicleType());
            pstmt.setString(6, driver.getLicenseExpiry());
            pstmt.setString(7, driver.getIsWorking());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<DriverList> getAllDrivers() {
        List<DriverList> drivers = new ArrayList<>();
        String sql = "SELECT * FROM driver_list";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                DriverList driver = new DriverList();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setIdNumber(rs.getString("id_number"));
                driver.setGender(rs.getString("gender"));
                driver.setContactInfo(rs.getString("contact_info"));
                driver.setVehicleType(rs.getString("vehicle_type"));
                driver.setLicenseExpiry(rs.getString("license_expiry"));
                driver.setIsWorking(rs.getString("is_working"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    //查询
    public List<DriverList> searchDrivers(String key) {
        List<DriverList> driverLists = new ArrayList<>();
        String sql = "SELECT * FROM driver_list WHERE name LIKE ? OR id_number LIKE ? OR contact_info LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + key + "%");
            pstmt.setString(2, "%" + key + "%");
            pstmt.setString(3, "%" + key + "%");

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String idNumber = rs.getString("id_number");
                String gender = rs.getString("gender");
                String contactInfo = rs.getString("contact_info");
                String vehicleType = rs.getString("vehicle_type");
                String licenseExpiry = rs.getString("license_expiry");
                String isWorking = rs.getString("is_working");
                DriverList driver = new DriverList(id, name, idNumber, gender, contactInfo, vehicleType, licenseExpiry, isWorking);
                driverLists.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return driverLists;
    }

}