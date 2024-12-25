package entity;

public class DeliveryOrder {
    private int id;
    private String task_num;
    private String project_name;
    private String concrete_mark;
    private String construction_site;
    private String production_date;
    private String purchase_unit;
    private String plan_cubic_meter;
    private String contract_number;
    private String anti_seepage_level;
    private String other_technical;
    private String concrete_strengh;
    private String design_ratio;
    private String required_slab_fall;
    private String mixing_plant;
    private String transport_distance;
    private String actual_cubic_meter;
    private String remarks;
    private String is_checkout;
    private String is_accept;
    private String way;

    public DeliveryOrder(int id, String task_num, String project_name, String concrete_mark, String construction_site, String production_date, String purchase_unit, String plan_cubic_meter, String contract_number, String anti_seepage_level, String other_technical, String concrete_strengh, String design_ratio, String required_slab_fall, String mixing_plant, String transport_distance, String actual_cubic_meter, String remarks, String is_checkout, String is_accept, String way) {
        this.id = id;
        this.task_num = task_num;
        this.project_name = project_name;
        this.concrete_mark = concrete_mark;
        this.construction_site = construction_site;
        this.production_date = production_date;
        this.purchase_unit = purchase_unit;
        this.plan_cubic_meter = plan_cubic_meter;
        this.contract_number = contract_number;
        this.anti_seepage_level = anti_seepage_level;
        this.other_technical = other_technical;
        this.concrete_strengh = concrete_strengh;
        this.design_ratio = design_ratio;
        this.required_slab_fall = required_slab_fall;
        this.mixing_plant = mixing_plant;
        this.transport_distance = transport_distance;
        this.actual_cubic_meter = actual_cubic_meter;
        this.remarks = remarks;
        this.is_checkout = is_checkout;
        this.is_accept = is_accept;
        this.way = way;
    }


    public int getId() {
        return id;
    }

    public String getTask_num() {
        return task_num;
    }

    public String getProject_name() {
        return project_name;
    }

    public String getConcrete_mark() {
        return concrete_mark;
    }

    public String getConstruction_site() {
        return construction_site;
    }

    public String getProduction_date() {
        return production_date;
    }

    public String getPurchase_unit() {
        return purchase_unit;
    }

    public String getPlan_cubic_meter() {
        return plan_cubic_meter;
    }

    public String getContract_number() {
        return contract_number;
    }

    public String getAnti_seepage_level() {
        return anti_seepage_level;
    }

    public String getOther_technical() {
        return other_technical;
    }

    public String getConcrete_strengh() {
        return concrete_strengh;
    }

    public String getDesign_ratio() {
        return design_ratio;
    }

    public String getRequired_slab_fall() {
        return required_slab_fall;
    }

    public String getMixing_plant() {
        return mixing_plant;
    }

    public String getTransport_distance() {
        return transport_distance;
    }

    public String getActual_cubic_meter() {
        return actual_cubic_meter;
    }

    public String getRemarks() {
        return remarks;
    }

    public String getIs_checkout() {
        return is_checkout;
    }

    public String getIs_accept() {
        return is_accept;
    }

    public String getWay() {
        return way;
    }
}
