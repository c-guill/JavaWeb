package fr.fisa.javaweb.beans;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Specialite {

    private String nom;
    private ArrayList<Module> listeModule;

    public Specialite(String nom){
        this.nom=nom;
        listeModule = new ArrayList<>();
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void addmodule(Module mod){
        listeModule.add(mod);
    }
    public ArrayList<Module> getListeModule() {
        return listeModule;
    }
}
