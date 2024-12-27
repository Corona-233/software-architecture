package entity;

public class VehicleList {
    private int id;
    private String vehicleNum;
    private String registerationDate;
    private String model;
    private String internalNum;
    private String curbWeight;
    private String totalWeight;
    private String mixerVolume;
    private String isWorking;

    // 构造方法
    public VehicleList(int id, String vehicleNum, String registerationDate, String model, String internalNum, String curbWeight, String totalWeight, String mixerVolume, String isWorking) {
        this.id = id;
        this.vehicleNum = vehicleNum;
        this.registerationDate = registerationDate;
        this.model = model;
        this.internalNum = internalNum;
        this.curbWeight = curbWeight;
        this.totalWeight = totalWeight;
        this.mixerVolume = mixerVolume;
        this.isWorking = isWorking;
    }

    // Getters 和 Setters
    public int getId() { return id; }
    public String getVehicleNum() { return vehicleNum; }
    public String getRegisterationDate() { return registerationDate; }
    public String getModel() { return model; }
    public String getInternalNum() { return internalNum; }
    public String getCurbWeight() { return curbWeight; }
    public String getTotalWeight() { return totalWeight; }
    public String getMixerVolume() { return mixerVolume; }
    public String getIsWorking() { return isWorking; }
}
