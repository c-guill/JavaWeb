package fr.fisa.javaweb.beans;

public class Evaluation {

    private String support_pedagogiques;

    private String equipe;

    private int nb_heure;

    private String commentaire;

    public Evaluation(String support_pedagogiques, String equipe, int nb_heure, String commentaire) {
        this.support_pedagogiques = support_pedagogiques;
        this.equipe = equipe;
        this.nb_heure = nb_heure;
        this.commentaire = commentaire;
    }

    public String getSupport_pedagogiques() {
        return support_pedagogiques;
    }

    public void setSupport_pedagogiques(String support_pedagogiques) {
        this.support_pedagogiques = support_pedagogiques;
    }

    public String getEquipe() {
        return equipe;
    }

    public void setEquipe(String equipe) {
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
}
