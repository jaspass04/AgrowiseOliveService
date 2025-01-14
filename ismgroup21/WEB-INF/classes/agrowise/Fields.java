package agrowise;


public class Fields {
    private String field_name;
    private String location;
    private double acreage;
    private String username;
    private int olive_trees;
    private String reg_date;


    public Fields(String field_name, String location, double acreage, String username, int olive_trees, String reg_date) {
        this.field_name = field_name;
        this.location = location;
        this.acreage = acreage;
        this.username = username;
        this.olive_trees = olive_trees;
        this.reg_date = reg_date;
    }

    public String getField_name() {
        return field_name;
    }

    public void setField_name(String field_name) {
        this.field_name = field_name;
    }


    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getAcreage() {
        return acreage;
    }

    public void setAcreage(double acreage) {
        this.acreage = acreage;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getOlive_trees() {
        return olive_trees;
    }

    public void setOlive_trees(int olive_trees) {
        this.olive_trees = olive_trees;
    }

    public String getReg_Date() {
        return reg_date;
    }

    public void setReg_Date(String reg_date) {
        this.reg_date = reg_date;
    }
}
