package fr.fisa.javaweb;

import java.io.*;
import java.util.*;

import fr.fisa.javaweb.beans.*;
import fr.fisa.javaweb.beans.Module;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/home")
public class ServletCentrale extends HttpServlet {
    private String message;
    private ArrayList<Etudiant> listeEtudiants;
    private ArrayList<Specialite> listeSpecialite;
    private ArrayList<User> listeUser;
    private ArrayList<Module> listeModule;

    public void init() {
        listeSpecialite = new ArrayList<>();
        listeSpecialite.add(new Specialite("Info"));
        listeSpecialite.add(new Specialite("GEII"));
        listeSpecialite.add(new Specialite("Math"));
        listeSpecialite.add(new Specialite("Cyber"));
        listeSpecialite.add(new Specialite("Electronique"));
        listeSpecialite.add(new Specialite("Robotique"));

        listeModule = new ArrayList<>();
        listeModule.add(new Module("Francais"));
        listeModule.add(new Module("Anglais"));
        listeModule.add(new Module("Droit"));

        for (int i = 0; i < listeSpecialite.size(); i++){
            listeSpecialite.get(i).addmodule(new Module("Francais"));
            listeSpecialite.get(i).addmodule(new Module("Anglais"));
            listeSpecialite.get(i).addmodule(new Module("Droit"));
        }

        listeUser = new ArrayList<>();
        // Etudiant
        String[] prenoms = {
                "Alice", "Charlie", "David", "Emma",
                "Frank", "Grace", "Hank", "Ivy",
                "Kate", "Liam", "Mia", "Noah", "Olivia",
                "Paul", "Quinn", "Ryan", "Sophia", "Tyler"
        };
        listeEtudiants = new ArrayList<>();

        for (int i = 0; i < 10; i++){
            int aleaPrenom = new Random().nextInt(prenoms.length);
            int aleaNom = new Random().nextInt(prenoms.length);
            int alea = new Random().nextInt(listeSpecialite.size());
            Etudiant etudiant = new Etudiant(prenoms[aleaNom],prenoms[aleaPrenom],prenoms[aleaPrenom],listeSpecialite.get(alea),String.valueOf(i));
            etudiant.addNotes(new Tuple(listeModule.get(0),1),aleaNom);
            etudiant.addNotes(new Tuple(listeModule.get(1),1),aleaPrenom);
            etudiant.addNotes(new Tuple(listeModule.get(2),1),alea);
            listeEtudiants.add(etudiant);
            listeUser.add(etudiant);
        }
        Etudiant etudiant = new Etudiant("camille","camille","1234",listeSpecialite.get(0),String.valueOf(5678));
        listeEtudiants.add(etudiant);
        listeUser.add(etudiant);
        etudiant = new Etudiant("jack","jack","1234",listeSpecialite.get(0),String.valueOf(1254));
        listeEtudiants.add(etudiant);
        listeUser.add(etudiant);

        etudiant.getEvaluations().put(listeSpecialite.get(0).getListeModule().get(0), new Evaluation(50,50,50,"ok"));
        etudiant.addNotes(new Tuple(listeModule.get(0),1),5);
        etudiant.addNotes(new Tuple(listeModule.get(1),1),6);
        etudiant.addNotes(new Tuple(listeModule.get(2),1),7);
        etudiant.addNotes(new Tuple(listeModule.get(2),2),7);
        Administrateur admin = new Administrateur("bob","bob","1234");
        Administrateur admin2 = new Administrateur("Guarim","raphael","1234");
        Administrateur admin3 = new Administrateur("Mesrine","Jacques","1234");
        listeUser.add(admin);
        listeUser.add(admin2);
        listeUser.add(admin3);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String referer = "";
        if(request.getHeader("referer") != null) {
            String[] referers = request.getHeader("referer").split("/");
            referer = referers[referers.length - 1];
        }
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
                out.println("<h1>" + referer + "</h1>");

                for (Specialite s : (ArrayList<Specialite>) request.getSession().getAttribute("specialite")){
                    out.println("<h1>" + s.getNom() + "</h1>");
                }
                User user = (User) request.getSession().getAttribute("user");
                if(user instanceof Etudiant) {
                    for (Evaluation m : ((Etudiant) user).getEvaluations().values()) {
                        out.println("<h1>" +m.getEquipe()+ "</h1>");
                        out.println("<h5>" +m.getNb_heure()+ "</h5>");
                        out.println("<h5>" +m.getSupport_pedagogiques()+ "</h5>");
                        out.println("<h5>" +m.getCommentaire()+ "</h5>");

                    }
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
                && !Objects.equals(request.getParameter("password"), "")
                && !Objects.equals(request.getParameter("specialite"), "")){
                    Specialite specialite = null;
                    for (Specialite s : this.listeSpecialite){
                        if(s.getNom().equals(request.getParameter("specialite"))){
                            specialite = s;
                            break;
                        }
                    }
                    if(specialite != null) {
                        Etudiant etudiant = new Etudiant(request.getParameter("nom"),
                                                        request.getParameter("prenom"),
                                                        request.getParameter("password"),
                                                        specialite,
                                                        request.getParameter("INE"));
                        this.listeEtudiants.add(etudiant);
                        this.listeUser.add(etudiant);
                    }
                }
                response.sendRedirect("index.jsp");
                break;
            case "specialite.jsp":
                Specialite specialite = listeSpecialite.get(Integer.parseInt(request.getParameter("specialite")));
                ArrayList<Etudiant> etudiantTri = new ArrayList<>();
                for (int i=0; i<listeEtudiants.size();i++){
                    if (listeEtudiants.get(i).getSpecialite().getNom().equals(specialite.getNom())){
                        etudiantTri.add(listeEtudiants.get(i));
                    }
                }
                response.sendRedirect("specialite.jsp");
                request.getSession().setAttribute("ListeEtudiantTri",etudiantTri);
                break;
            case "module.jsp":
                Module module = listeModule.get(Integer.parseInt(request.getParameter("module")));
                ArrayList<HashMap> etudiantNote = new ArrayList<>();
                // On va chercher les notes de chaque étudiant inscris dans le module
                for (int i=0; i<listeEtudiants.size();i++){
                    for (int j=0; j<listeEtudiants.get(i).getSpecialite().getListeModule().size(); j++){
                        if (listeEtudiants.get(i).getSpecialite().getListeModule().get(j).getNom().equals(module.getNom())){
                            for (Map.Entry<Tuple, Float> entry : listeEtudiants.get(i).getNotes().entrySet()) {
                                Tuple cle = entry.getKey();
                                //System.out.println("Etu: " + listeEtudiants.get(i).getName() + " - Module: " + cle.getModule().getNom() + ", notes: " + points);
                                if (cle.getModule().getNom().equals(module.getNom())) {
                                    Float valeur = entry.getValue();
                                    //System.out.println(" --> value after check: " + valeur);
                                    HashMap<Integer, Float> notes = new HashMap<>();
                                    notes.put(i,valeur);
                                    etudiantNote.add(notes);
                                }
                            }
                        }
                    }
                }
                response.sendRedirect("module.jsp");
                request.getSession().setAttribute("ListeEtudiantNote",etudiantNote);
                request.getSession().setAttribute("ListeEtudiantID",this.listeEtudiants);
                request.getSession().setAttribute("ModuleToGet", module.getNom());
                break;
            case "notes.jsp":
                Module module2 = listeModule.get(Integer.parseInt(request.getParameter("module")));
                int semestre2 = Integer.parseInt(request.getParameter("semestre"));
                User use = (User) request.getSession().getAttribute("user");
                Etudiant etud = null;
                // Reconnaissance de l'etudiant connécté
                for (int i=0; i<listeEtudiants.size();i++){
                    if (listeEtudiants.get(i).getPrenom().equals(use.getPrenom()) && listeEtudiants.get(i).getName().equals(use.getName()) && listeEtudiants.get(i).getPassword().equals((use.getPassword()))){
                        etud = (Etudiant) listeEtudiants.get(i);
                    }
                }
                // Tri des notes selon la selection
                ArrayList<Float> Listenotes = new ArrayList<>();
                for (Map.Entry<Tuple, Float> entry : etud.getNotes().entrySet()) {
                    if (entry.getKey().getModule().equals(module2) && entry.getKey().getSemestre()==semestre2){
                        System.out.println(entry.getValue());
                        Listenotes.add(entry.getValue());
                    }
                }
                ArrayList<String> details = new ArrayList<>();
                details.add(module2.getNom());
                details.add(String.valueOf(semestre2));
                response.sendRedirect("notes.jsp");
                request.getSession().setAttribute("ListeNotesTri",Listenotes);
                request.getSession().setAttribute("details",details);
                break;
            case "analyse.jsp":
                User user = (User) request.getSession().getAttribute("user");
                ArrayList<Evaluation> evaluations = new ArrayList<>();
                if(user instanceof Administrateur && !Objects.equals(request.getParameter("module"),"")){
                    module = null;
                    for (Module m : this.listeModule){
                        if(m.getNom().equalsIgnoreCase(request.getParameter("module"))){
                            module = m;
                            break;
                        }
                    }
                    if(module != null) {
                        for (Etudiant etudiant : this.listeEtudiants) {
                            for (Evaluation evaluation : etudiant.getEvaluations().values()){
                                if (etudiant.getEvaluations().containsKey(module)) {
                                    evaluations.add(evaluation);
                                }
                            }
                        }
                    }
                }
                request.getSession().setAttribute("evaluations",evaluations);
                response.sendRedirect("analyse.jsp");
                break;
            case "hello.jsp":
                out.println("<h1>" + referer + "</h1>");
                break;
            case "evaluationmodule.jsp":
                if(!Objects.equals(request.getParameter("supports"), "")
                        && !Objects.equals(request.getParameter("equipe"), "")
                        && !Objects.equals(request.getParameter("time"), "")
                        && !Objects.equals(request.getParameter("commentaire"), "")
                        && !Objects.equals(request.getParameter("module"), "")){
                        user = (User) request.getSession().getAttribute("user");
                        if(user instanceof Etudiant){
                            int supports = Integer.parseInt(request.getParameter("supports"));
                            int equipe = Integer.parseInt(request.getParameter("equipe"));
                            int time = Integer.parseInt(request.getParameter("time"));
                            if(supports < 0) supports = 0;
                            if(equipe < 0) equipe = 0;
                            if(time < 0) time = 0;
                            if(supports > 100) supports = 100;
                            if(equipe > 100) equipe = 100;
                            if(time > 100) time = 100;
                            Evaluation evaluation = new Evaluation(supports, equipe, time, request.getParameter("commentaire"));
                            module = null;
                            for (Module m : ((Etudiant) user).getSpecialite().getListeModule()){
                                if(m.getNom().equalsIgnoreCase(request.getParameter("module"))){
                                    module = m;
                                    break;
                                }
                            }
                            if(module != null){
                                ((Etudiant)user).getEvaluations().put(module, evaluation);
                            }
                        }
                }
                response.sendRedirect("homepage.jsp");
                break;
            case "studentNotes.jsp":
                // Redirect to studentNotes.jsp
                String nomEtu = request.getParameter("nom-etu");
                String INE = request.getParameter("INE");
                String mod = request.getParameter("modules");
                int semestre = Integer.parseInt(request.getParameter("semester"));
                float notes = Float.parseFloat(request.getParameter("notes"));

                for (Etudiant etu : listeEtudiants) {
                    if (nomEtu.equals(etu.getName()) && INE.equals(etu.getINE())) {
                        // search module in the user's list of modules
                        for (Module m : etu.getSpecialite().getListeModule()) {
                            if (m.getNom().equals(mod)) {
                                Tuple key = new Tuple(m, semestre);
                                etu.addNotes(key, notes);
                            }
                        }
                    }

                    System.out.println("All notes of etudiant " + etu.getName() + " after add new notes: ");
                    for (Map.Entry<Tuple, Float> entry : etu.getNotes().entrySet()) {
                        Tuple key = entry.getKey();
                        float value = entry.getValue();
                        System.out.println("Module: " + key.getModule().getNom() + ", Semestre: " + key.getSemestre() + ", Notes: " + value);
                    }
                }
                response.sendRedirect("studentNotes.jsp");
                break;
            default:
                // Login authentification
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                User authentificatedUser = null;
                for (User u : listeUser) {
                    if (u.getName().equals(name) && u.getPassword().equals(password)) {
                        authentificatedUser = u;
                        break;
                    }
                }
                if (authentificatedUser != null) {
                    response.sendRedirect("homepage.jsp");
                    request.getSession().setAttribute("module",this.listeModule);
                    if (authentificatedUser instanceof Administrateur){
                        request.getSession().setAttribute("specialite", this.listeSpecialite);
                    }
                    request.getSession().setAttribute("user",authentificatedUser);
                } else {
                    response.sendRedirect("index.jsp?error=auth_failed");
                }
                break;

        }
        out.println("</body></html>");
    }

    public void destroy() {
    }
}