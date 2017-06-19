package controller;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, String> actionMap = new HashMap<>();

	public Controller() {
		actionMap.put("click", "/photo.jsp");
		actionMap.put("rate", "/photo.jsp");
		actionMap.put("home", "/home.jsp");
	}

	public void init(ServletConfig config) throws ServletException {
	}

	private void doForward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (!actionMap.containsKey(action) || action == null)
			action = "home";

		request.getRequestDispatcher(actionMap.get(action)).forward(request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doForward(request, response);

	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doForward(request, response);
	}
}
