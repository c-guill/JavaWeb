package fr.fisa.javaweb;

import java.io.*;
import java.util.ArrayList;
import java.util.Random;

import fr.fisa.javaweb.beans.Administrateur;
import fr.fisa.javaweb.beans.Etudiant;
import fr.fisa.javaweb.beans.Module;
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
    private ArrayList<Module> listeModule;

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
        listeModule = new ArrayList<>();
        listeModule.add(new Module("Francais"));
        listeModule.add(new Module("Anglais"));
        listeModule.add(new Module("Java Web"));
        listeModule.add(new Module("Php"));
        listeModule.add(new Module("Droit"));
        listeModule.add(new Module("Math"));
        listeModule.add(new Module("Espagnol"));
        listeModule.add(new Module("C++"));

        for (int i = 0; i < 10; i++){
            int aleaPrenom = new Random().nextInt(prenoms.length);
            int aleaNom = new Random().nextInt(prenoms.length);
            int alea = new Random().nextInt(Specialite.values().length);
            Etudiant etudiant = new Etudiant(prenoms[aleaPrenom],prenoms[aleaNom],prenoms[aleaPrenom],Specialite.values()[alea],String.valueOf(i));
            listeEtudiants.add(etudiant);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String[] referers = request.getHeader("referer").split("/");
        String referer = referers[referers.length-1];
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        switch (referer){
            case "inscription.jsp":
                out.println("<h1>OK "+request.getParameter("nom")+"</h1>");
                break;
            default:
                out.println("<h1>" + referer
                        + "</h1>");

        }
        out.println("</body></html>");

    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String[] referers = request.getHeader("referer").split("/");
        String referer = referers[referers.length-1];
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        switch (referer){
            case "inscription.jsp":
                out.println("<h1>OK "+request.getParameter("nom")+"</h1>");
                break;
            default:
                out.println("<h1>" + referer
                        + "</h1>");

        }
        out.println("</body></html>");
    }

    public void destroy() {
    }

    public ArrayList<Module> getListeModule() {
        return listeModule;
    }
}