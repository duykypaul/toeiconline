package vn.myclass.controller.admin;

import vn.myclass.command.ListenGuideLineCommand;
import vn.myclass.core.dto.ListenguideLineDTO;
import vn.myclass.core.web.common.WebConstant;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ListenguideLineDTO> listenguideLineDTOS = new ArrayList<ListenguideLineDTO>();
        ListenGuideLineCommand command = new ListenGuideLineCommand();

        ListenguideLineDTO dto1 = new ListenguideLineDTO();
        dto1.setTitle("bai 1");
        dto1.setContent("content 1");
        ListenguideLineDTO dto2 = new ListenguideLineDTO();
        dto2.setTitle("bai 2");
        dto2.setContent("content 2");

        listenguideLineDTOS.add(dto1);
        listenguideLineDTOS.add(dto2);

        command.setListResult(listenguideLineDTOS);
        command.setMaxPageItems(1);
        command.setTotalItems(listenguideLineDTOS.size());

        request.setAttribute(WebConstant.LIST_ITEMS, command);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/listenguideline/list.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
