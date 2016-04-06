package com.hbhglekang.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hbhglekang.Constants;
import com.hbhglekang.db.DbManager;
import com.hbhglekang.db.table.Content;
import com.hbhglekang.db.table.ContentHelper;
import com.hbhglekang.util.FileUtil;

/**
 * 将edit.jsp提交的数据保留成html文件并存于当前
 * @author pengchen
 *
 */
public class ContentSaveServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2652917317866978793L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		saveLogic(request, response);
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws SQLException 
	 */
	private void saveLogic(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		// 获得内容静态化文件目录
		String contentdataPath = getServletConfig().getServletContext().getRealPath(Constants.ContentDataDir);
		System.out.println(contentdataPath);
		File dataDir = new File(contentdataPath);
		if(!dataDir.exists()){
			boolean flag = dataDir.mkdirs();
			System.out.println("mkdir "+contentdataPath+" "+(flag ? "success" : "fail"));
		}
		// 内容所属Content id
		String _id = request.getParameter("id"); 
		int id = Integer.parseInt(_id);
		System.out.println("id: "+id);
		// 内容所属Content name
		String name = request.getParameter("name"); 
		System.out.println("name: "+name);
		String filename = name+".jsp";
		// 内容所属Hierarchy id
		String _hierarchy_id = request.getParameter("hierarchy_id"); 
		int hierarchy_id = Integer.parseInt(_hierarchy_id);
		System.out.println("hierarchy_id: "+hierarchy_id);
		// 获得内容数据
		String data = request.getParameter("data");
		System.out.println("data: "+data);
		if(data != null){
			data = "<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%>"+data;
			boolean flag = FileUtil.writeFile(data, dataDir, filename);
			System.out.println("write data to "+contentdataPath+" "+(flag ? "success" : "fail"));
		}
		String redirect = request.getParameter("redirect");
		redirect = redirect.startsWith("/") ? redirect : "/"+redirect;
		System.out.println("redirect: "+redirect);
		System.out.println("toURL: "+(request.getContextPath()+redirect));
		// save data to db
		Content content = new Content(id, name, hierarchy_id, data, System.currentTimeMillis());
		ContentHelper ch = DbManager.instance.getCacheMap().contentMap.contentHelper;
		try {
			ch.add(content);
			response.sendRedirect(request.getContextPath()+redirect+"?loadfile="+Constants.ContentDataDir+"/"+filename);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
//		try {
//			request.setAttribute("loadfile", Constants.ContentDataDir+"/"+filename);
//			this.getServletConfig().getServletContext().getRequestDispatcher(redirect).forward(request,response);
//		} catch (ServletException e) {
//			e.printStackTrace();
//		}
	}

}
