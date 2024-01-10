package fr.fisa.javaweb;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hell World!";
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
}