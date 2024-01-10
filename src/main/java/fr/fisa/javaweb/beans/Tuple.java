package fr.fisa.javaweb.beans;

public class Tuple {

    private Module module;

    private int semestre;

    public Tuple(Module module, int semestre) {
        this.module = module;
        this.semestre = semestre;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }
}
