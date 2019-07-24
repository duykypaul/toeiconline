package vn.myclass.controller.admin;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import vn.myclass.command.ListenGuideLineCommand;
import vn.myclass.core.common.utils.UploadUtil;
import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.service.ListenGuideLineService;
import vn.myclass.core.service.impl.ListenGuideLineServiceImpl;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = {"/admin-guideline-listen-list.html", "/admin-guideline-listen-edit.html"})
public class ListenGuideLineController extends HttpServlet {
    private transient final Logger log = Logger.getLogger(this.getClass());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListenGuideLineCommand command = FormUtil.populate(ListenGuideLineCommand.class, request);
        ResourceBundle resourceBundle = ResourceBundle.getBundle("ApplicationResources");
        /*HttpSession session = request.getSession();
        request.setAttribute(WebConstant.MESSAGE_RESPONSE, resourceBundle.getString("label.guideline.listen.add.success"));
        request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_SUCCESS);
        if (session != null) {
            request.setAttribute(WebConstant.ALERT, session.getAttribute(WebConstant.ALERT));
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, session.getAttribute(WebConstant.MESSAGE_RESPONSE));
        }*/
        if (command.getUrlType() != null && command.getUrlType().equals(WebConstant.URL_LIST)) {
            excuteSearchListenguideLine(request, command);
            request.setAttribute(WebConstant.LIST_ITEMS, command);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/listenguideline/list.jsp");
            rd.forward(request, response);
        } else if (command.getUrlType() != null && command.getUrlType().equals(WebConstant.URL_EDIT)) {
            if(command.getPojo() != null && command.getPojo().getListenGuideLineId() != null){
                command.setPojo(SingletonServiceUtil.getListenGuidelineServiceInstance()
                        .findListenGuideLineById("listenGuideLineId", command.getPojo().getListenGuideLineId()));
            }
            request.setAttribute(WebConstant.FORM_ITEM, command);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/listenguideline/edit.jsp");
            rd.forward(request, response);
        }
        /*session.removeAttribute(WebConstant.ALERT);
        session.removeAttribute(WebConstant.MESSAGE_RESPONSE);*/
    }

    private void excuteSearchListenguideLine(HttpServletRequest request, ListenGuideLineCommand command) {
        Map<String, Object> property = buildMapProperties(command);
        RequestUtil.initSearchBean(request, command);
        Object[] objects = SingletonServiceUtil.getListenGuidelineServiceInstance()
                                        .findListenGuideLineByProperties(property, command.getSortExpression(),
                                                                command.getSortDirection(), command.getFirstItem(), command.getMaxPageItems());
        command.setListResult((List<ListenGuideLineDTO>) objects[1]);
        command.setTotalItems(Integer.parseInt(objects[0].toString()));
    }

    private Map<String, Object> buildMapProperties(ListenGuideLineCommand command) {
        Map<String, Object> property = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(command.getPojo().getTitle())){
            property.put("title", command.getPojo().getTitle());
        }
        return property;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListenGuideLineCommand command = new ListenGuideLineCommand();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("ApplicationResources");
        UploadUtil uploadUtil = new UploadUtil();
        HttpSession session = request.getSession();
//        Set<String> titleValue = buildSetValueListenGuideLine();

        /*try {
            Object[] objects = uploadUtil.writeOrUpdateFile(request, titleValue, WebConstant.LISTENGUIDELINE);
            Map<String, String> mapReturnValue = (Map<String, String>) objects[3];
            command = returnValueListenGuideLineCommand(titleValue, command, mapReturnValue);
            session.setAttribute(WebConstant.ALERT, WebConstant.TYPE_SUCCESS);
            session.setAttribute(WebConstant.MESSAGE_RESPONSE, resourceBundle.getString("label.guideline.listen.add.success"));
        } catch (FileUploadException e) {
            log.error(e.getMessage(), e);
            session.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            session.setAttribute(WebConstant.MESSAGE_RESPONSE, resourceBundle.getString("label.error"));
        } catch (Exception e){
            log.error(e.getMessage(), e);
            session.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            session.setAttribute(WebConstant.MESSAGE_RESPONSE, resourceBundle.getString("label.error"));
        }*/
        response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list");
    }

    /*private ListenGuideLineCommand returnValueListenGuideLineCommand(Set<String> titleValue, ListenGuideLineCommand command, Map<String, String> mapReturnValue) {
        for(String item : titleValue){
            if (mapReturnValue.containsKey(item)){
                if (item.equals("pojo.title")){
                    command.getPojo().setTitle(mapReturnValue.get(item));
                } else if (item.equals("pojo.content")) {
                    command.getPojo().setContent(mapReturnValue.get(item));
                }
            }
        }
        return command;
    }

    private Set<String> buildSetValueListenGuideLine() {
        Set<String> titleValue = new HashSet<String>();
        titleValue.add("pojo.title");
        titleValue.add("pojo.content");
        return titleValue;
    }*/
}
