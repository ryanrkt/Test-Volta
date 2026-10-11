package app.controllers;

import java.util.ArrayList;
import java.util.List;

import app.models.Personne;
import volta.annotations.RestApi;
import volta.annotations.UrlMapping;
import volta.core.ModelAndView;

public class MyController {

    @UrlMapping(value = "/liste", methodHttp="GET")
    public ModelAndView liste() {
        ModelAndView mv = new ModelAndView();
        List<String> personnes = new ArrayList<>();
        personnes.add("Nekena");
        personnes.add("Mobutu");

        mv.addAttribute("personnes", personnes); 
        mv.setView("listePersonne");

        return mv;
    }

    @RestApi(value = "/api/test" ,methodHttp="GET")
    public List<String> testApi (){
        List<String> personnes = new ArrayList<>();
        personnes.add("Nekena");
        personnes.add("Mobutu");
        return personnes;
    }

    @RestApi(value = "/api/personnes" ,methodHttp="GET")
    public Personne getPersonne(){
        Personne p = new Personne();
        p.setNom("Doe");
        p.setPrenom("Jhon");
        return p;
    }

    @UrlMapping(value = "/emp/add",methodHttp = "GET")
    public ModelAndView formEmploye(){
        ModelAndView mv = new ModelAndView();
        mv.setView("form-employe");
        return mv;
    }

    @UrlMapping (value = "/emp/save",methodHttp = "POST")
    public ModelAndView ajouterEmploye(String nom,String prenom,String departement){
        System.out.println("Debug -> nom: " + nom + ", prenom: " + prenom + ", dpt: " + departement);
        ModelAndView mv = new ModelAndView();
        mv.addAttribute("nom",nom);
        mv.addAttribute("prenom", prenom);
        mv.addAttribute("departement", departement);
        mv.setView("info-employe");
        return mv;
    }

}