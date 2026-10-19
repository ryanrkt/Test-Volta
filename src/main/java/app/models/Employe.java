package app.models;

import volta.utils.VoltaFile;

public class Employe {
    private String nom;
    private String prenom;
    private String departement;
    private VoltaFile profile;
    
    public VoltaFile getProfile() {
        return profile;
    }
    public void setProfile(VoltaFile profil) {
        this.profile = profil;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getDepartement() {
        return departement;
    }
    public void setDepartement(String departement) {
        this.departement = departement;
    }

    
    
}
