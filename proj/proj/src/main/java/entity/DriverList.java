package entity;

public class DriverList {
    private int id;
    private String name;
    private String idNumber;
    private String gender;
    private String contactInfo;
    private String vehicleType;
    private String licenseExpiry;
    private String isWorking;

    // 构造函数
    public DriverList(int id, String name, String idNumber, String gender, String contactInfo, String vehicleType, String licenseExpiry, String isWorking) {
        this.id = id;
        this.name = name;
        this.idNumber = idNumber;
        this.gender = gender;
        this.contactInfo = contactInfo;
        this.vehicleType = vehicleType;
        this.licenseExpiry = licenseExpiry;
        this.isWorking = isWorking;
    }

    public DriverList() {

    }

    // Getter 方法
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public String getGender() {
        return gender;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public String getLicenseExpiry() {
        return licenseExpiry;
    }

    public String getIsWorking() {
        return isWorking;
    }

    // 如果需要，可以添加 Setter 方法
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public void setLicenseExpiry(String licenseExpiry) {
        this.licenseExpiry = licenseExpiry;
    }

    public void setIsWorking(String isWorking) {
        this.isWorking = isWorking;
    }
}