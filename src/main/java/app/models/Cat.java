package app.models;

import app.annotations.RunImmediately;
import app.annotations.VeryImportant;

@VeryImportant
public class Cat{
    private String name ;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Cat(String name){
        this.name= name;
    }

    @RunImmediately(times = 3)
    public void meow (){System.err.println("Meow !");}
}