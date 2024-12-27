package dao;

import entity.VehicleList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleListDao {
    public VehicleListDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        String JDBCURL = "jdbc:mysql://localhost:3306/proj?useUnicode=true&characterEncoding=UTF-8";
        String JDBCUSERNAME = "root";
        String JDBCPASSWORD = "lifaqi666";
        return DriverManager.getConnection(JDBCURL, JDBCUSERNAME, JDBCPASSWORD);
    }

    // 获取所有车辆信息
    public List<VehicleList> getAllVehicles() {
        List<VehicleList> vehicles = new ArrayList<>();

        String sql = "SELECT * FROM vehicle_list";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                VehicleList vehicle = new VehicleList(
                        rs.getInt("id"),
                        rs.getString("vehicle_num"),
                        rs.getString("registeration_date"),
                        rs.getString("model"),
                        rs.getString("internal_num"),
                        rs.getString("curb_weight"),
                        rs.getString("total_weight"),
                        rs.getString("mixer_volume"),
                        rs.getString("is_working")
                );
                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    // 添加车辆
    public void addVehicle(String vehicleNum, String registerationDate, String model, String internalNum, String curbWeight, String totalWeight, String mixerVolume, String isWorking) {
        String sql = "INSERT INTO vehicle_list(vehicle_num, registeration_date, model, internal_num, curb_weight, total_weight, mixer_volume, is_working) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicleNum);
            pstmt.setString(2, registerationDate);
            pstmt.setString(3, model);
            pstmt.setString(4, internalNum);
            pstmt.setString(5, curbWeight);
            pstmt.setString(6, totalWeight);
            pstmt.setString(7, mixerVolume);
            pstmt.setString(8, isWorking);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 删除车辆
    public void deleteVehicle(int id) {
        String sql = "DELETE FROM vehicle_list WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 更新车辆
    public void updateVehicle(VehicleList vehicle) {
        String sql = "UPDATE vehicle_list SET vehicle_num = ?, registeration_date = ?, model = ?, internal_num = ?, curb_weight = ?, total_weight = ?, mixer_volume = ?, is_working = ? WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getVehicleNum());
            pstmt.setString(2, vehicle.getRegisterationDate());
            pstmt.setString(3, vehicle.getModel());
            pstmt.setString(4, vehicle.getInternalNum());
            pstmt.setString(5, vehicle.getCurbWeight());
            pstmt.setString(6, vehicle.getTotalWeight());
            pstmt.setString(7, vehicle.getMixerVolume());
            pstmt.setString(8, vehicle.getIsWorking());
            pstmt.setInt(9, vehicle.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
