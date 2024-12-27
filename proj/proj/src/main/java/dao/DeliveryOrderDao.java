package dao;

import entity.DeliveryOrder;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryOrderDao {
    public DeliveryOrderDao() {
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
        String JDBCPASSWORD = "lifaqi666";
        return DriverManager.getConnection(JDBCURL, JDBCUSERNAME, JDBCPASSWORD);
    }

    public List<DeliveryOrder> getAllDeliveryOrder() throws SQLException {
        List<DeliveryOrder> deliveryOrders = new ArrayList<DeliveryOrder>();
        String sql = "select * from delivery_order";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()){
            while (rs.next()) {
                int id = rs.getInt("id");
                String task_num = rs.getString("task_num");
                String project_name = rs.getString("project_name");
                String concrete_mark = rs.getString("concrete_mark");
                String construction_site = rs.getString("construction_site");
                String production_date  = rs.getString("production_date");
                String purchase_unit= rs.getString("purchase_unit");
                String plan_cubic_meter = rs.getString("plan_cubic_meter");
                String contract_number  = rs.getString("contract_number");
                String anti_seepage_level = rs.getString("anti_seepage_level");
                String other_technical  = rs.getString("other_technical");
                String concrete_strengh = rs.getString("concrete_strengh");
                String design_ratio = rs.getString("design_ratio");
                String required_slab_fall  = rs.getString("required_slab_fall");
                String mixing_plant = rs.getString("mixing_plant");
                String transport_distance = rs.getString("transport_distance");
                String actual_cubic_meter = rs.getString("actual_cubic_meter");
                String remarks = rs.getString("remarks");
                String is_checkout = rs.getString("is_checkout");
                String is_accept = rs.getString("is_accept");
                String way = rs.getString("way");
                DeliveryOrder deliveryOrder = new DeliveryOrder(id,task_num,project_name,concrete_mark,construction_site,production_date,purchase_unit,plan_cubic_meter,contract_number,anti_seepage_level,other_technical,concrete_strengh,design_ratio,required_slab_fall,mixing_plant,transport_distance,actual_cubic_meter,remarks,is_checkout,is_accept,way);
                deliveryOrders.add(deliveryOrder);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveryOrders;
    }

    public void deleteDeliveryOrder(int id) throws SQLException {
        String sql = "delete from delivery_order where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DeliveryOrder> getKeyDeliveryOrder(String key) throws SQLException {
        List<DeliveryOrder> deliveryOrders = new ArrayList<DeliveryOrder>();
        String sql = "select * from delivery_order where task_num like ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "%"+key+"%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String task_num = rs.getString("task_num");
                String project_name = rs.getString("project_name");
                String concrete_mark = rs.getString("concrete_mark");
                String construction_site = rs.getString("construction_site");
                String production_date  = rs.getString("production_date");
                String purchase_unit= rs.getString("purchase_unit");
                String plan_cubic_meter = rs.getString("plan_cubic_meter");
                String contract_number  = rs.getString("contract_number");
                String anti_seepage_level = rs.getString("anti_seepage_level");
                String other_technical  = rs.getString("other_technical");
                String concrete_strengh = rs.getString("concrete_strengh");
                String design_ratio = rs.getString("design_ratio");
                String required_slab_fall  = rs.getString("required_slab_fall");
                String mixing_plant = rs.getString("mixing_plant");
                String transport_distance = rs.getString("transport_distance");
                String actual_cubic_meter = rs.getString("actual_cubic_meter");
                String remarks = rs.getString("remarks");
                String is_checkout = rs.getString("is_checkout");
                String is_accept = rs.getString("is_accept");
                String way = rs.getString("way");
                DeliveryOrder deliveryOrder = new DeliveryOrder(id,task_num,project_name,concrete_mark,construction_site,production_date,purchase_unit,plan_cubic_meter,contract_number,anti_seepage_level,other_technical,concrete_strengh,design_ratio,required_slab_fall,mixing_plant,transport_distance,actual_cubic_meter,remarks,is_checkout,is_accept,way);
                deliveryOrders.add(deliveryOrder);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveryOrders;
    }

    public void addDeliveryOrder(String task_num, String project_name, String concrete_mark, String construction_site, String production_date, String purchase_unit, String plan_cubic_meter, String contract_number, String anti_seepage_level, String other_technical, String concrete_strengh, String design_ratio, String required_slab_fall, String mixing_plant, String transport_distance, String actual_cubic_meter, String remarks) throws SQLException {
        String sql = "insert into delivery_order (task_num, project_name, concrete_mark, construction_site, production_date, purchase_unit, plan_cubic_meter, contract_number, anti_seepage_level, other_technical, concrete_strengh, design_ratio, required_slab_fall, mixing_plant, transport_distance,actual_cubic_meter, remarks) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, task_num);
            pstmt.setString(2, project_name);
            pstmt.setString(3, concrete_mark);
            pstmt.setString(4, construction_site);
            pstmt.setString(5, production_date);
            pstmt.setString(6, purchase_unit);
            pstmt.setString(7, plan_cubic_meter);
            pstmt.setString(8, contract_number);
            pstmt.setString(9, anti_seepage_level);
            pstmt.setString(10, other_technical);
            pstmt.setString(11, concrete_strengh);
            pstmt.setString(12, design_ratio);
            pstmt.setString(13, required_slab_fall);
            pstmt.setString(14, mixing_plant);
            pstmt.setString(15, transport_distance);
            pstmt.setString(16, actual_cubic_meter);
            pstmt.setString(17, remarks);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDeliveryOrder(int id,String task_num,String project_name,String construction_site,String concrete_mark,String plan_cubic_meter,String actual_cubic_meter,String production_date) throws SQLException {
        String sql ="update delivery_order set task_num=?,project_name=?,construction_site=?,concrete_mark=?,plan_cubic_meter=?,actual_cubic_meter=?,production_date=? where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, task_num);
            pstmt.setString(2, project_name);
            pstmt.setString(3, construction_site);
            pstmt.setString(4, concrete_mark);
            pstmt.setString(5, plan_cubic_meter);
            pstmt.setString(6, actual_cubic_meter);
            pstmt.setString(7, production_date);
            pstmt.setInt(8, id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void checkout(int id) throws SQLException {
        String sql ="update delivery_order set is_checkout=1 where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // 设置参数
            pstmt.setInt(1, id);
            // 执行更新操作
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("成功更新了 " + rowsAffected + " 行");
            } else {
                System.out.println("没有找到对应的记录进行更新");
            }
        } catch (SQLException e) {
            // 抛出异常给调用者处理或在这里处理异常
            throw e;
        }
    }
    public void checkout2(int id) throws SQLException {
        String sql ="update delivery_order set is_checkout=-1 where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // 设置参数
            pstmt.setInt(1, id);
            // 执行更新操作
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("成功更新了 " + rowsAffected + " 行");
            } else {
                System.out.println("没有找到对应的记录进行更新");
            }
        } catch (SQLException e) {
            // 抛出异常给调用者处理或在这里处理异常
            throw e;
        }
    }
    public void accept(int id) throws SQLException {
        String sql ="update delivery_order set is_accept=1 where id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // 设置参数
            pstmt.setInt(1, id);
            // 执行更新操作
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("成功更新了 " + rowsAffected + " 行");
            } else {
                System.out.println("没有找到对应的记录进行更新");
            }
        } catch (SQLException e) {
            // 抛出异常给调用者处理或在这里处理异常
            throw e;
        }
    }
}
