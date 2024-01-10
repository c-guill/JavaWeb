package fr.fisa.javaweb;

import java.io.*;
import java.util.ArrayList;
import java.util.Random;

import fr.fisa.javaweb.beans.Administrateur;
import fr.fisa.javaweb.beans.Etudiant;
import fr.fisa.javaweb.beans.Specialite;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "home", value = "/home")
public class ServletCentrale extends HttpServlet {
    private String message;
    private ArrayList<Etudiant> listeEtudiants;

    public void init() {
        // Etudiant
        Specialite.values();
        String[] prenoms = {
                "Alice", "Bob", "Charlie", "David", "Emma",
                "Frank", "Grace", "Hank", "Ivy", "Jack",
                "Kate", "Liam", "Mia", "Noah", "Olivia",
                "Paul", "Quinn", "Ryan", "Sophia", "Tyler"
        };
        listeEtudiants = new ArrayList<>();
        for (int i = 0; i < 10; i++){
            int aleaPrenom = new Random().nextInt(prenoms.length);
            int aleaNom = new Random().nextInt(prenoms.length);
            int alea = new Random().nextInt(Specialite.values().length);
            Etudiant etudiant = new Etudiant(prenoms[aleaPrenom],prenoms[aleaNom],prenoms[aleaPrenom],Specialite.values()[alea],String.valueOf(i));
            listeEtudiants.add(etudiant);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        response.sendRedirect("login.jsp");

    }



    public void destroy() {
    }
}