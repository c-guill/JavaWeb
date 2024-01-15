package fr.fisa.javaweb.beans;

import java.util.Objects;

public class Module {

    private String nom;

    public Module(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Module module = (Module) o;
        return Objects.equals(nom, module.nom);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nom);
    }
}
