package dispatcher;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Dispatcher implements Filter {

	private String cardFilter = "([a-z]|[A-Z]|[0-9]){4}";
	private Pattern pattern;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // invoked when an instance of this filter is created by the container
        // used to initialize resources, read parameters...

		pattern = Pattern.compile(cardFilter);

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // invoked when a matching request sent to the server
        // used to intercept the request and transform the response

		if (request instanceof HttpServletRequest) {

			String url = ((HttpServletRequest)request).getRequestURL().toString();
			String queryString = ((HttpServletRequest)request).getQueryString();

			URI uri;

			try {

				uri = new URI(url);
				String path = uri.getPath();
				String code = path.substring(path.lastIndexOf('/') + 1);
				Matcher m = pattern.matcher(code.toLowerCase());

				if (m.matches()) {

					HttpServletRequest httpReq = (HttpServletRequest) request;
					HttpSession session = httpReq.getSession();
					session.setAttribute("code", code);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/ServeCard");
					dispatcher.forward(request, response);

				} else {
					chain.doFilter(request, response);
				}

			} catch (URISyntaxException ex) {
				throw new ServletException();
			}

			
		}

		

    }

    @Override
    public void destroy() {
        // invoked when the filter instance is being destroyed by the container
        // used clean up resources

    }
}