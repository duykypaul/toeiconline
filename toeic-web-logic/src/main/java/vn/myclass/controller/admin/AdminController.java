package vn.myclass.controller.admin;

import vn.myclass.core.common.utils.SessionUtil;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.web.common.WebConstant;
import vn.myclass.core.web.utils.SingletonServiceUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-home.html")
public class AdminController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object user = SessionUtil.getInstance().getValue(request, WebConstant.LOGIN_NAME);
        if (user != null) {
            UserDTO userDTO = SingletonServiceUtil.getUserServiceInstance().findUserByUserName((String) user);
            String requestDispatcher = "";
            if (userDTO.getRoleDTO().getName().equals(WebConstant.ROLE_ADMIN)) {
                requestDispatcher = "/views/admin/home.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(requestDispatcher);
                rd.forward(request, response);
            } else {
                response.sendRedirect("/home.html");
            }
        } else {
            response.sendRedirect("/login.html?action=login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
