package fr.fisa.javaweb.beans;

import java.util.ArrayList;

public class Evaluation {

    private int support_pedagogiques;

    private int equipe;

    private int nb_heure;

    private String commentaire;

    public Evaluation(int support_pedagogiques, int equipe, int nb_heure, String commentaire) {
        this.support_pedagogiques = support_pedagogiques;
        this.equipe = equipe;
        this.nb_heure = nb_heure;
        this.commentaire = commentaire;
    }

    public int getSupport_pedagogiques() {
        return support_pedagogiques;
    }

    public void setSupport_pedagogiques(int support_pedagogiques) {
        this.support_pedagogiques = support_pedagogiques;
    }

    public int getEquipe() {
        return equipe;
    }

    public void setEquipe(int equipe) {
        this.equipe = equipe;
    }

    public int getNb_heure() {
        return nb_heure;
    }

    public void setNb_heure(int nb_heure) {
        this.nb_heure = nb_heure;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public static int getAverageSupport(ArrayList<Evaluation> evaluations){
        if(evaluations.isEmpty()) return 0;
        int result = 0;
        for(Evaluation evaluation : evaluations){
            result+=evaluation.getSupport_pedagogiques();
        }
        return result / evaluations.size();

    }

    public static int getAverageEquipe(ArrayList<Evaluation> evaluations){
        if(evaluations.isEmpty()) return 0;
        int result = 0;
        for(Evaluation evaluation : evaluations){
            result+=evaluation.getEquipe();
        }
        return result / evaluations.size();

    }

    public static int getAverageHeure(ArrayList<Evaluation> evaluations){
        if(evaluations.isEmpty()) return 0;
        int result = 0;
        for(Evaluation evaluation : evaluations){
            result+=evaluation.getNb_heure();
        }
        return result / evaluations.size();

    }
}
