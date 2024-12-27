package entity;

public class User {
    private int id;
    private String name;
    private int roleId;

    public User(int id, String name, int roleId) {
        this.id = id;
        this.name = name;
        this.roleId = roleId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}