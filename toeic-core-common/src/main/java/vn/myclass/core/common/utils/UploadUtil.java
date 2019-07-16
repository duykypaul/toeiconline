package vn.myclass.core.common.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UploadUtil {
    private final int maxMemorySize = 1024 *1024 * 3; /* 3MB */
    private final int maxRequestSize = 1024 *1024 * 50; /* 3MB */

    public Object[] writeOrUpdateFile(HttpServletRequest request, Set<String> titleValue, String path) throws FileUploadException, Exception {
        // ServletContext servletContext = request.getServletContext();
        ServletContext context = request.getSession().getServletContext();
        String address = context.getRealPath("image");
        boolean check = true;
        String fileLocation = null;
        String fileName = null;
        Map<String, String> mapReturnValue = new HashMap<String, String>();
        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(!isMultipart) {
            System.out.println("have not enctype multipart/form-data");
            check = false;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Set factory constraints
        factory.setSizeThreshold(maxMemorySize);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(maxRequestSize);

        // Parse the request
        List<FileItem> items = upload.parseRequest(request);
        for(FileItem item: items){
            if(!item.isFormField()){
                fileName = item.getName();
                if(StringUtils.isNotBlank(fileName)){
                    fileLocation = address + File.separator + path + File.separator + fileName;
                    File uploadFile = new File(fileLocation);

                    boolean isExist = uploadFile.exists();
                    if(isExist) {
                        if(uploadFile.delete()) {
                            item.write(uploadFile);
                        } else {
                            check = false;
                        }
                    } else {
                        item.write(uploadFile);
                    }
                }
            } else {
                if(titleValue != null){
                    String namefield = item.getFieldName();
                    String valueField = item.getString();
                    if(titleValue.contains(namefield)){
                        mapReturnValue.put(namefield, valueField);
                    }
                }
            }
        }
        return new Object[]{check, fileLocation, fileName, mapReturnValue};
    }

}
