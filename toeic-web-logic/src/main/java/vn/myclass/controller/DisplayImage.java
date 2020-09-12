package vn.myclass.controller;

import vn.myclass.core.common.constant.CoreConstant;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;

public class DisplayImage extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageUrl = request.getRequestURI();
        String relativeImagePath = imageUrl.substring("/repository/".length());
        ServletOutputStream outStream;
        outStream = response.getOutputStream();
        String imagesBase = "/" + CoreConstant.FOLDER_UPLOAD;
        Path pathdir = Paths.get(CoreConstant.FOLDER_UPLOAD, relativeImagePath);
        FileInputStream fin = new FileInputStream(String.valueOf(pathdir));
        BufferedInputStream bin = new BufferedInputStream(fin);
        BufferedOutputStream bout = new BufferedOutputStream(outStream);
        int ch = 0;
        while ((ch = bin.read()) != -1) {
            bout.write(ch);
        }
        bin.close();
        fin.close();
        bout.close();
        outStream.close();
    }
}
