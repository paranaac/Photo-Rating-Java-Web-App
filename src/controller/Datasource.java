package controller;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/Datasource")
public class Datasource extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DataSource dSource;
   
    public Datasource() {
        super();
       
    }
    public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext inContext = new InitialContext();
			Context env = (Context)inContext.lookup("java:comp/env");
			dSource = (DataSource)env.lookup("jdbc/acparana_photos");	
		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		
		try {
			conn = dSource.getConnection();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.println("Connection established.");
		try {
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
