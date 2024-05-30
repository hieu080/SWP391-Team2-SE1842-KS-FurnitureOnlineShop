/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;


import DAL.FeedbackDAO;
import DAl.CustomerDAO;
import Models.Category;
import Models.Product;
import Models.User;
import Models.Order;
import Models.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class Feedback extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "images/imagefeedback";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Feedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Feedback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        String orderIDStr = request.getParameter("order_id");
        int order_id = 0;
        try{
            order_id = Integer.parseInt(orderIDStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        Order listO = dao.getOrder(u.getId(), 1);
        request.setAttribute("listO", listO);
        ArrayList<OrderDetail> listD = dao.getOrderDetailList();
        request.setAttribute("listD", listD);
        ArrayList<Product> listP = dao.getProductList();
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("/Views/Feedback.jsp").forward(request, response);
        
    }
    
//    public static void main(String[] args) {
//        CustomerDAO dao = new CustomerDAO();
//        Order listO = dao.getOrder(2, 1);
//        ArrayList<OrderDetail> listD = dao.getOrderDetailList();
//        ArrayList<Product> listP = dao.getProductList();
//        
//        for (OrderDetail orderDetail : listD) {
//            if(orderDetail.getOrder_id() == 1){
//                for (Product product : listP) {
//                    if(product.getId() == orderDetail.getProduct_id()){
//                        System.out.println(product.getName());
//                    }
//                }
//            }
//        }
//    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO fbdao = new FeedbackDAO();
        CustomerDAO csdao = new CustomerDAO();
//        OrderDetailDao odd = new OrderDetailDao();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        String feedback = request.getParameter("feedback");
        int rate = Integer.parseInt(request.getParameter("rate"));
        
        String orderIDStr = request.getParameter("order_id");
        int order_id = 0;
        try{
            order_id = Integer.parseInt(orderIDStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        
        ArrayList<OrderDetail> listD = csdao.getOrderDetailList();
        ArrayList<Integer> productFb = new ArrayList<>();
        for (OrderDetail orderDetail : listD) {
            if(orderDetail.getOrder_id() == order_id){
                productFb.add(orderDetail.getProduct_id());
            }
        }
        
        for (Integer integer : productFb) {
            fbdao.sendfeedback(u.getId(), integer.intValue(), rate, feedback, "active");
        }
        
        Part filePart = request.getPart("fbimg");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File not provided or empty.");
            return;
        }

        String fileName = getFileName(filePart);
        
        for (Integer integer : productFb) {
            fbdao.insertImageFb(integer.intValue(), fileName);
        }
        

        // Tạo đường dẫn lưu file
        String applicationPath = getServletContext().getRealPath("");
        String destinationPath = applicationPath.replace("build\\", "");
        String uploadFilePath = destinationPath + UPLOAD_DIRECTORY;

        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Đường dẫn tới tệp đích
        Path destinationFilePath = Paths.get(uploadFilePath + File.separator + fileName);

        // Lưu file vào thư mục
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, destinationFilePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
