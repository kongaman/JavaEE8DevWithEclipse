package packt.book.jee_eclipse.book.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.getWriter().write(createForm(null));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		System.out.println("Username: "+userName);
		System.out.println("Password: "+password);
		
		StringBuilder responseString = new StringBuilder();
		if("admin".equalsIgnoreCase(userName) && "admin".equalsIgnoreCase(password)) {
			responseString.append("<h2>Welcome admin!</h2>")
						  .append("You are successfully logged in.");
		} else {
			responseString.append(createForm("Invalid user or password. Please try again."));
		}
		response.setContentType("text/html");
		response.getWriter().write(responseString.toString());
	}
	
	protected String createForm(String errMsg) {
		StringBuilder sb = new StringBuilder("<h2>Login</h2>");
		// falls gefüllt die Fehlermeldung anzeigen
		if(errMsg != null) {
			sb.append("<span style='color: red;'>")
			  .append(errMsg)
			  .append("</span><br>");
		}
		// Formular anzeigen
		sb.append("<form method='post'>\n")
		  .append("Username: <input type='text' name='userName'><br>\n")
		  .append("Password: <input type='text' name='password'><br>\n")
		  .append("<button type='submit' name='submit'>Submit</button>\n")
		  .append("<button type='reset'>Reset</button>\n")
		  .append("</form>\n");
		
		return sb.toString();
	}

}
