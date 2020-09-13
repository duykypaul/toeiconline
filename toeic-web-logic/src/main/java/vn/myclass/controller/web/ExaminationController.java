package vn.myclass.controller.web;

import org.apache.commons.lang.StringUtils;
import vn.myclass.command.ExaminationCommand;
import vn.myclass.core.dto.ExaminationDTO;
import vn.myclass.core.dto.ExerciseDTO;
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

@WebServlet(urlPatterns = {"/danh-sach-bai-thi.html"})
public class ExaminationController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ExaminationCommand command = FormUtil.populate(ExaminationCommand.class, request);
        excuteSearchExamination(request, command);
        request.setAttribute(WebConstant.LIST_ITEMS, command);
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/examination/list.jsp");
        rd.forward(request, response);
    }

    private void excuteSearchExamination(HttpServletRequest request, ExaminationCommand command) {
        Map<String, Object> property = buildMapProperties(command);
        RequestUtil.initSearchBeanManual(command);
        Object[] objects = SingletonServiceUtil.getExaminationServiceInstance()
                .findExaminationByProperties(property, command.getSortExpression(),
                        command.getSortDirection(), command.getFirstItem(), command.getMaxPageItems());
        command.setListResult((List<ExaminationDTO>) objects[1]);
        command.setTotalItems(Integer.parseInt(objects[0].toString()));
        command.setTotalPages((int) Math.ceil((double) command.getTotalItems() / command.getMaxPageItems()));
    }

    private Map<String, Object> buildMapProperties(ExaminationCommand command) {
        Map<String, Object> property = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(command.getPojo().getName())) {
            property.put("name", command.getPojo().getName());
        }
        return property;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
