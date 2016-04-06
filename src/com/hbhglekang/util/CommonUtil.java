package com.hbhglekang.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author pengchen
 *
 */
public class CommonUtil {

	/**
	 * 有效返回true
	 * @param request
	 * @param name
	 * @return
	 */
	public static boolean checkValidArgs(HttpServletRequest request, String name){
		return request.getParameter(name) != null && request.getParameter(name).trim().length() > 0;
	}
	
}

