package entity;

public class RawMaterialsList {
    private int id;
    private String date;
    private String odernum;
    private String name;
    private String weight;
    private String vehicle_num;
    private String specifications;
    private String supplier;

    public RawMaterialsList(int id, String date, String odernum, String name, String weight, String vehicle_num, String specifications, String supplier) {
        this.id = id;
        this.date = date;
        this.odernum = odernum;
        this.name = name;
        this.weight = weight;
        this.vehicle_num = vehicle_num;
        this.specifications = specifications;
        this.supplier = supplier;
    }

    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getOdernum() {
        return odernum;
    }

    public String getName() {
        return name;
    }

    public String getWeight() {
        return weight;
    }

    public String getVehicle_num() {
        return vehicle_num;
    }

    public String getSpecifications() {
        return specifications;
    }

    public String getSupplier() {
        return supplier;
    }
}
