package fr.fisa.javaweb;

import java.io.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Random;

import fr.fisa.javaweb.beans.Administrateur;
import fr.fisa.javaweb.beans.Etudiant;
import fr.fisa.javaweb.beans.Module;
import fr.fisa.javaweb.beans.Administrateur;
import fr.fisa.javaweb.beans.Specialite;
import fr.fisa.javaweb.beans.User;
import fr.fisa.javaweb.beans.Tuple;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "home", value = "/home")
public class ServletCentrale extends HttpServlet {
    private String message;
    private ArrayList<Etudiant> listeEtudiants;
    private ArrayList<Specialite> listeSpecialite;
    private ArrayList<User> listeUser;

    public void init() {

        listeSpecialite = new ArrayList<>();
        listeSpecialite.add(new Specialite("Info"));
        listeSpecialite.add(new Specialite("GEII"));
        listeSpecialite.add(new Specialite("Math"));
        listeSpecialite.add(new Specialite("Cyber"));
        listeSpecialite.add(new Specialite("Electronique"));
        listeSpecialite.add(new Specialite("Robotique"));

        for (int i = 0; i < listeSpecialite.size(); i++){
            listeSpecialite.get(i).addmodule(new Module("Francais"));
            listeSpecialite.get(i).addmodule(new Module("Anglais"));
            listeSpecialite.get(i).addmodule(new Module("Droit"));
        }

        listeUser = new ArrayList<>();
        // Etudiant

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
            int alea = new Random().nextInt(listeSpecialite.size());
            Etudiant etudiant = new Etudiant(prenoms[aleaNom],prenoms[aleaPrenom],prenoms[aleaPrenom],listeSpecialite.get(alea),String.valueOf(i));
            listeEtudiants.add(etudiant);
            listeUser.add(etudiant);
        }
        Administrateur admin = new Administrateur("Bob","Bob","1234");
        Administrateur admin2 = new Administrateur("Guarim","raphael","1234");
        Administrateur admin3 = new Administrateur("Mesrine","Jacques","1234");
        listeUser.add(admin);
        listeUser.add(admin2);
        listeUser.add(admin3);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String[] referers = request.getHeader("referer").split("/");
        String referer = referers[referers.length-1];
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        switch (referer) {
            case "inscription.jsp":
                out.println("<h1>OK "+request.getParameter("nom")+
                        request.getParameter("prenom")+
                        request.getParameter("INE")+
                        request.getParameter("password")+
                        request.getParameter("specialite")+ "</h1>");
                break;
            default:
                for (Etudiant etudiant : this.listeEtudiants){
                    out.println("<h1>" + etudiant.getName() + "</h1>");

                }

        }
        out.println("</body></html>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String[] referers = request.getHeader("referer").split("/");
        String referer = referers[referers.length-1];
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        switch (referer){
            case "inscription.jsp":
                if(!Objects.equals(request.getParameter("prenom"), "")
                && !Objects.equals(request.getParameter("INE"), "")
                && !Objects.equals(request.getParameter("password"), "")){
                    Etudiant etudiant = new Etudiant(request.getParameter("nom"),
                            request.getParameter("prenom"),
                            request.getParameter("INE"),
                            //Specialite.valueOf(request.getParameter("specialite")),
                            this.listeSpecialite.get(0),
                            request.getParameter("password"));
                    this.listeEtudiants.add(etudiant);
                }
                response.sendRedirect("index.jsp");
                break;
            case "specialite.jsp":
                String specialite = request.getParameter("specialite");
                ArrayList<Etudiant> etudiantTri = new ArrayList<>();
                for (int i=0; i<listeEtudiants.size();i++){
                    if (listeEtudiants.get(i).getSpecialite().equals(specialite)){
                        etudiantTri.add(listeEtudiants.get(i));
                    }
                }
                response.sendRedirect("specialite.jsp");
            default:
                out.println("<h1>" + referer
                        + "</h1>");

        }
        out.println("</body></html>");
    }

    public void destroy() {
    }
}