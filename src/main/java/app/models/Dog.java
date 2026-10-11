package app.models;

public class Dog {
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public Dog(String name){
        this.name=name;

    }

    public void ouaf(){System.out.println("Oauf !");}
}
