package vn.myclass.controller.admin;

import vn.myclass.command.ListenGuideLineCommand;
import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.service.ListenGuideLineService;
import vn.myclass.core.service.impl.ListenGuideLineServiceImpl;
import vn.myclass.core.web.common.WebConstant;
import vn.myclass.core.web.utils.RequestUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin-guideline-listen-list.html")
public class ListenGuideLineController extends HttpServlet {
    private ListenGuideLineService listenGuideLineService = new ListenGuideLineServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*ListenGuideLineCommand command = new ListenGuideLineCommand();
        command.setMaxPageItems(20);
        RequestUtil.initSearchBean(request, command);
        Object[] objects = listenGuideLineService.findListenGuideLineByProperties(null, null,
                command.getSortExpression(), command.getSortDirection(), command.getFirstItem(), command.getMaxPageItems());
        command.setListResult((List<ListenGuideLineDTO>) objects[1]);
        command.setTotalItems(Integer.parseInt(objects[0].toString()) );
        request.setAttribute(WebConstant.LIST_ITEMS, command);*/
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/listenguideline/list.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
