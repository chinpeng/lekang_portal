package com.hbhglekang.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileUtil {

	/**
	 * 
	 * @param content
	 * @param dataDir
	 * @param filename
	 * @return
	 */
	public static boolean writeFile(String content, File dataDir, String filename){
		File dest = new File(dataDir, filename);
		FileWriter fw = null;
		try {
			fw = new FileWriter(dest);
			fw.write(content);
			fw.flush();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} 
		return true;
	}
	
	/**
	 * 
	 * @param dataDir
	 * @param filename
	 * @return
	 */
	public static String readFile(File dataDir, String filename){
		File dest = new File(dataDir, filename);
		FileReader fr = null;
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();
		try {
			fr = new FileReader(dest);
			br = new BufferedReader(fr);
			String temp = null;
			while((temp = br.readLine()) != null){
				sb.append(temp);
			}
			br.close();
			fr.close();
		} catch (Throwable e) {
			e.printStackTrace();
		} 
		String s = sb.toString();
		s = s.replaceFirst("<%.*?%>", "");
		return s;
	}
	
}
