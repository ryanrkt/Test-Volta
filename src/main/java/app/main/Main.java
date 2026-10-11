package app.main;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import app.annotations.RunImmediately;
import app.annotations.VeryImportant;
import app.models.Cat;

public class Main {
    public static void main(String[] args) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Cat myCat = new Cat("Mimi");

        System.out.println("TYPE: Classe");
        if (myCat.getClass().isAnnotationPresent(VeryImportant.class)) {
            System.out.println("Presence d'annotaion VeryImportant ");
        } else {
            System.out.println("Pas d'annotation VeryImportante ");
        }

        System.out.println("TYPE: Methode");
        for(Method method : myCat.getClass().getDeclaredMethods()){
            if(method.isAnnotationPresent(RunImmediately.class)){
                RunImmediately annotation = method.getAnnotation(RunImmediately.class);
                for(int i = 0; i < annotation.times();i++){
                    method.invoke(myCat);
                }
            }
        }

    }
}
