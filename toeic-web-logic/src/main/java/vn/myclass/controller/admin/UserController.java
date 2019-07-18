package vn.myclass.controller.admin;

import vn.myclass.command.UserCommand;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.service.UserService;
import vn.myclass.core.service.impl.UserServiceImpl;
import vn.myclass.core.web.common.WebConstant;
import vn.myclass.core.web.utils.FormUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin-user-list.html"})
public class UserController extends HttpServlet {
    UserService userService = new UserServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, request);
        UserDTO pojo = new UserDTO();
        if(command.getUrlType() != null && command.getUrlType().equals(WebConstant.URL_LIST)) {
            Map<String, Object> property = new HashMap<String, Object>();
            Object[] objects = userService.findUserByProperties(property, command.getSortExpression(), command.getSortDirection(), command.getFirstItem(), command.getMaxPageItems());
            command.setListResult((List<UserDTO>) objects[1]);
            command.setTotalItems(Integer.parseInt(objects[0].toString()));
            request.setAttribute(WebConstant.LIST_ITEMS, command);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/list.jsp");
            rd.forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
