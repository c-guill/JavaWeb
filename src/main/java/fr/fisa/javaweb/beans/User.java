package fr.fisa.javaweb.beans;

public abstract class User {

    private String name;
    private String prenom;


    private String password;

    public User(String name, String prenom, String password) {
        this.name = name;
        this.prenom = prenom;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
