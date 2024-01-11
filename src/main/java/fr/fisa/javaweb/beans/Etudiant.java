package fr.fisa.javaweb.beans;

import java.util.HashMap;

public class Etudiant extends User {

    private Specialite specialite;

    private String INE;

    private HashMap<Tuple, Float> notes;

    private HashMap<Module, Evaluation> evaluations;

    public Etudiant(String name, String prenom, String password, Specialite specialite, String INE) {
        super(name, prenom, password);
        this.specialite = specialite;
        this.INE = INE;
        this.notes = new HashMap<>();
        this.evaluations = new HashMap<>();
    }

    public Specialite getSpecialite() {
        return specialite;
    }

    public void setSpecialite(Specialite specialite) {
        this.specialite = specialite;
    }

    public String getINE() {
        return INE;
    }

    public void setINE(String INE) {
        this.INE = INE;
    }

    public HashMap<Tuple, Float> getNotes() {
        return notes;
    }

    public void addNotes(Tuple key, float value) {
        notes.put(key, value);
    }

    public void setNotes(HashMap<Tuple, Float> notes) {
        this.notes = notes;
    }

    public HashMap<Module, Evaluation> getEvaluations() {
        return evaluations;
    }

    public void setEvaluations(HashMap<Module, Evaluation> evaluations) {
        this.evaluations = evaluations;
    }
}
