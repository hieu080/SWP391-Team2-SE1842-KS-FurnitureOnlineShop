/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package UserAuthorization;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebFilter(filterName = "UserAuthorization", urlPatterns = {"/*"})
public class UserAuthorization implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public UserAuthorization() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("UserAuthorization:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("UserAuthorization:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("UserAuthorization:doFilter()");
        }

        doBeforeProcessing(request, response);

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();
        User customer = (User) session.getAttribute("customer");
        String url = httpServletRequest.getServletPath();
        // Lấy URI (endpoint)
        String uri = httpServletRequest.getRequestURI();
        String string[] = uri.split("/");
        String uri1 = string[string.length - 1];
        System.out.println("URI: " + uri1);
        log(uri1);
        int role = 0;
        if (customer != null) {
            role = customer.getRole_id();
        }else{
            String sessionId = request.getParameter("sessionid");
            if (sessionId != null) {
                customer = new UserDAO().getUserByID(Integer.parseInt(sessionId));
                session.setAttribute("customer", customer);
            }
        }
        //SettingDetailsServlet
        System.out.println(role);

        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".gif") || uri.endsWith(".webp")) {
            chain.doFilter(request, response);
            return;
        }
        if (role == 0) {
            if (uri1.equals("HomePage") || uri1.equals("BlogListServlet")
                    || uri1.equals("BlogDetailServlet") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductSearchServlet") || uri1.equals("RegisterServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("LoginServlet")
                    || uri1.equals("PageServlet") || uri1.equals("AboutUsServlet")
                    || uri1.equals("FurnitureHieu") || uri1.equals("ResetPasswordServlet")||uri1.equals("OrderStatus")) {
            } else {
                httpServletResponse.sendRedirect("HomePage?action=showLoginForm");
            }
        } else if (role == 1) {
            if (uri1.equals("HomePage") || uri1.equals("BlogListServlet")
                    || uri1.equals("BlogDetailServlet") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("BlogListSearchedServlet")
                    || uri1.equals("ProductSearchServlet")
                    || uri1.equals("FeedbackServlet") || uri1.equals("AddToOrder")
                    || uri1.equals("ResetPasswordServlet")
                    || uri1.equals("ChangePassword") || uri1.equals("UserProfile")
                    || uri1.equals("MyOrderServlet")
                    || uri1.equals("LoginServlet") || uri1.equals("LogoutServlet")
                    || uri1.equals("VerifyEmail") || uri1.equals("VerifyResetEmail")
                    || uri1.equals("AddNewAddress") || uri1.equals("AddToCart")
                    || uri1.equals("CartDetail") || uri1.equals("CartContact")
                    || uri1.equals("DeleteCartItem") || uri1.equals("MoreProduct")
                    || uri1.equals("UpdateAddress") || uri1.equals("UpdateAddressCartContact")
                    || uri1.equals("UpdateCartItemStatus") || uri1.equals("UpdateCartQuantity")
                    || uri1.equals("MyOrderInformationServlet") || uri1.equals("PageServlet") 
                    || uri1.equals("AboutUsServlet") || uri1.equals("FurnitureHieu")) {

            } else {
                // Chuyển hướng tới trang mặc định hoặc thông báo lỗi
                httpServletResponse.sendRedirect("HomePage");
            }
        } else if (role == 2) {
            if (uri1.equals("HomePage") || uri1.equals("BlogListServlet")
                    || uri1.equals("BlogDetailServlet") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("SaleDashboard")
                    || uri1.equals("OrderListServlet") || uri1.equals("OrderDetailServlet")
                    || uri1.equals("LoginServlet") || uri1.equals("LogoutServlet")
                    || uri1.equals("ChangePassword") || uri1.equals("ResetPasswordServlet")
                    || uri1.equals("UserProfile") || uri1.equals("VerifyEmail")
                    || uri1.equals("VerifyResetEmail") || uri1.equals("BlogListSearchedServlet")
                    || uri1.equals("ProductSearchServlet") || uri1.equals("PageServlet") 
                    || uri1.equals("AboutUsServlet") || uri1.equals("FurnitureHieu")
                    || uri1.equals("ProductSearchServlet") || uri1.equals("RegisterServlet")) {

            } else {
                // Chuyển hướng tới trang mặc định hoặc thông báo lỗi
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/HomePage");
            }
        } else if (role == 3) {
            if (uri1.equals("HomePage")
                    || uri1.equals("SaleDashboard") || uri1.equals("BlogListServlet")
                    || uri1.equals("BlogDetailServlet") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("RegisterServlet")
                    || uri1.equals("OrderListServlet") || uri1.equals("OrderDetailServlet")
                    || uri1.equals("AssignToSale") || uri1.equals("SaleAssignOrder")
                    || uri1.equals("SaleListServlet") || uri1.equals("LoginServlet") || uri1.equals("LogoutServlet")
                    || uri1.equals("ChangePassword") || uri1.equals("ResetPasswordServlet")
                    || uri1.equals("UserProfile") || uri1.equals("VerifyEmail")
                    || uri1.equals("VerifyResetEmail") || uri1.equals("BlogListSearchedServlet")
                    || uri1.equals("ProductSearchServlet") || uri1.equals("PageServlet") 
                    || uri1.equals("AboutUsServlet") || uri1.equals("FurnitureHieu")) {

            } else {
                // Chuyển hướng tới trang mặc định hoặc thông báo lỗi
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/HomePage");
            }
        } else if (role == 4) {
            // Các trang cho phép truy cập khi là role 4
            if (uri1.equals("HomePage")
                    || uri1.equals("BlogListServlet") || uri1.equals("BlogDetailServlet")
                    || uri1.equals("BlogListSearchedServlet") || uri1.equals("LoginServlet")
                    || uri1.equals("RegisterServlet") || uri1.equals("ResetPasswordServlet")
                    || uri1.equals("AddProductServlet") || uri1.equals("ChangeStatusFeedback")
                    || uri1.equals("CustomerDetails") || uri1.equals("CustomersList")
                    || uri1.equals("FeedBackList") || uri1.equals("FeedBackDetail")
                    || uri1.equals("ManageProductServlet") || uri1.equals("NewPost")
                    || uri1.equals("PostDetails") || uri1.equals("PostsList")
                    || uri1.equals("ProductListMKTServlet") || uri1.equals("SliderDetail")
                    || uri1.equals("SliderEdit") || uri1.equals("SliderInsert")
                    || uri1.equals("SliderList") || uri1.equals("SliderUpdate")
                    || uri1.equals("PageServlet") || uri1.equals("AboutUsServlet") || uri1.equals("FurnitureHieu")
                    || uri1.equals("MarketingDashboard") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("ProductSearchServlet")
                    || uri1.equals("ChangePassword") || uri1.equals("UserProfile")) {
                // Tiếp tục xử lý bình thường cho các trang này
            } else {
                // Chuyển hướng tới trang mặc định hoặc thông báo lỗi
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/HomePage");
            }
        } else if (role == 5) {
            if (uri1.equals("HomePage")
                    || uri1.equals("BlogListServlet") || uri1.equals("BlogDetailServlet")
                    || uri1.equals("BlogListSearchedServlet") || uri1.equals("ProductServlet")
                    || uri1.equals("ProductDetailServlet") || uri1.equals("ProductSearchServlet")
                    || uri1.equals("LoginServlet") || uri1.equals("RegisterServlet")
                    || uri1.equals("ResetPasswordServlet") || uri1.equals("ChangePassword")
                    || uri1.equals("AdminDashboard") || uri1.equals("UserListServlet")
                    || uri1.equals("ManageUserServlet") || uri1.equals("SettingServlet")) {

            } else {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/HomePage");
            }
        }

        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("UserAuthorization:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("UserAuthorization()");
        }
        StringBuffer sb = new StringBuffer("UserAuthorization(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
