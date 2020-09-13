package vn.myclass.controller.web;

import org.apache.commons.lang.StringUtils;
import vn.myclass.command.ListenGuideLineCommand;
import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.web.common.WebConstant;
import vn.myclass.core.web.utils.FormUtil;
import vn.myclass.core.web.utils.RequestUtil;
import vn.myclass.core.web.utils.SingletonServiceUtil;

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

@WebServlet(urlPatterns = {"/danh-sach-huong-dan-nghe.html", "/noi-dung-bai-huong-dan-nghe.html"})
public class ListenGuideLineController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListenGuideLineCommand command = FormUtil.populate(ListenGuideLineCommand.class, request);
        if (request.getParameter("listenguidelineid") != null) {
            String listenGuideLineId = request.getParameter("listenguidelineid");
            ListenGuideLineDTO listenGuideLineDTO = SingletonServiceUtil.getListenGuidelineServiceInstance()
                    .findListenGuideLineById("listenGuideLineId", Integer.parseInt(listenGuideLineId));
            command.setPojo(listenGuideLineDTO);
            request.setAttribute(WebConstant.FORM_ITEM, command);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/listenguideline/detail.jsp");
            rd.forward(request, response);
        } else {
            excuteSearchListenguideLine(request, command);
            request.setAttribute(WebConstant.LIST_ITEMS, command);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/listenguideline/list.jsp");
            rd.forward(request, response);
        }
    }

    private void excuteSearchListenguideLine(HttpServletRequest request, ListenGuideLineCommand command) {
        Map<String, Object> property = buildMapProperties(command);
        RequestUtil.initSearchBeanManual(command);
        Object[] objects = SingletonServiceUtil.getListenGuidelineServiceInstance()
                .findListenGuideLineByProperties(property, command.getSortExpression(),
                        command.getSortDirection(), command.getFirstItem(), command.getMaxPageItems());
        command.setListResult((List<ListenGuideLineDTO>) objects[1]);
        command.setTotalItems(Integer.parseInt(objects[0].toString()));
        command.setTotalPages((int) Math.ceil((double) command.getTotalItems() / command.getMaxPageItems()));
    }

    private Map<String, Object> buildMapProperties(ListenGuideLineCommand command) {
        Map<String, Object> property = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(command.getPojo().getTitle())) {
            property.put("title", command.getPojo().getTitle());
        }
        return property;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
