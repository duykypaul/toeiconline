package vn.myclass.controller.admin;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.exception.ConstraintViolationException;
import vn.myclass.command.ListenGuideLineCommand;
import vn.myclass.core.common.utils.UploadUtil;
import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.service.ListenGuideLineService;
import vn.myclass.core.service.impl.ListenGuideLineServiceImpl;
import vn.myclass.core.web.common.WebConstant;
import vn.myclass.core.web.utils.FormUtil;
import vn.myclass.core.web.utils.RequestUtil;
import vn.myclass.core.web.utils.SingletonServiceUtil;
import vn.myclass.core.web.utils.WebCommonUtil;

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
        if (command.getUrlType() != null && command.getUrlType().equals(WebConstant.URL_LIST)) {
            excuteSearchListenguideLine(request, command);
            if(command.getCrudaction() != null){
                Map<String, String> mapMessage = buildMapRedirectMessage(resourceBundle);
                WebCommonUtil.addRedirectMessage(request, command.getCrudaction(), mapMessage);
            }
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
    }

    private Map<String, String> buildMapRedirectMessage(ResourceBundle resourceBundle) {
        Map<String, String> mapMessage = new HashMap<String, String>();
        mapMessage.put(WebConstant.REDIRECT_INSERT, resourceBundle.getString("label.guideline.listen.message.insert.success"));
        mapMessage.put(WebConstant.REDIRECT_UPDATE, resourceBundle.getString("label.guideline.listen.message.update.success"));
        mapMessage.put(WebConstant.REDIRECT_DELETE, resourceBundle.getString("label.guideline.listen.message.delete.success"));
        mapMessage.put(WebConstant.REDIRECT_ERROR, resourceBundle.getString("label.error"));
        return mapMessage;
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
        Set<String> titleValue = buildSetValueListenGuideLine();

        Object[] objects = uploadUtil.writeOrUpdateFile(request, titleValue, WebConstant.LISTENGUIDELINE);

        boolean checkStatusUploadImage = (Boolean) objects[0];
        if(!checkStatusUploadImage){
            response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list&crudaction=redirect_error");
        } else {
            ListenGuideLineDTO dto = command.getPojo();
            if(StringUtils.isNotBlank(objects[2].toString())){
                dto.setImage(objects[2].toString());
            }
            Map<String, String> mapReturnValue = (Map<String, String>) objects[3];
            dto = returnValueOfDTO(dto, mapReturnValue);

            if(dto != null) {
                if (dto.getListenGuideLineId() != null) {
                    /*update*/
                    ListenGuideLineDTO listenGuideLineDTO = SingletonServiceUtil.getListenGuidelineServiceInstance()
                            .findListenGuideLineById("listenGuideLineId", dto.getListenGuideLineId());
                    if(dto.getImage() ==  null) {
                        dto.setImage(listenGuideLineDTO.getImage());
                    }
                    dto.setCreatedDate(listenGuideLineDTO.getCreatedDate());
                    ListenGuideLineDTO result = SingletonServiceUtil.getListenGuidelineServiceInstance().updateListenGuideline(dto);
                    if(result != null){
                        response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list&crudaction=redirect_update");
                    } else {
                        response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list&crudaction=redirect_error");
                    }
                } else {
                    /*insert */
                    try {
                        SingletonServiceUtil.getListenGuidelineServiceInstance().saveListenGuideLineDTO(dto);
                        response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list&crudaction=redirect_insert");
                    } catch (ConstraintViolationException e){
                        log.error(e.getMessage(), e);
                        response.sendRedirect("/admin-guideline-listen-list.html?urlType=url_list&crudaction=redirect_error");
                    }

                }
            }
        }
    }

    private ListenGuideLineDTO returnValueOfDTO(ListenGuideLineDTO dto, Map<String, String> mapReturnValue) {
        for(Map.Entry<String, String> item : mapReturnValue.entrySet()){
            if(item.getKey().equals("pojo.title")){
                dto.setTitle(item.getValue());
            } else if(item.getKey().equals("pojo.content")) {
                dto.setContent(item.getValue());
            } else if(item.getKey().equals("pojo.listenGuideLineId")) {
                dto.setListenGuideLineId(Integer.parseInt(item.getValue()));
            }
        }
        return dto;
    }

    private Set<String> buildSetValueListenGuideLine() {
        Set<String> titleValue = new HashSet<String>();
        titleValue.add("pojo.title");
        titleValue.add("pojo.content");
        titleValue.add("pojo.listenGuideLineId");
        return titleValue;
    }
}
