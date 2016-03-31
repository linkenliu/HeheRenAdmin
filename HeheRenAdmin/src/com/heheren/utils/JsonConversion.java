package com.heheren.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

public class JsonConversion {
	/**
	 * 日志.
	 */
	private static Logger logger = Logger.getLogger(JsonConversion.class);
	private static final String SIMPLE_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * java对象转换成json字符串
	 * @param obj
	 */
	public static final String writeEntityJSON(Object obj) {
		
		StringWriter stringWriter = new StringWriter();

		ObjectMappingCustomer mapper = new ObjectMappingCustomer();
		mapper.setDateFormat(new SimpleDateFormat(SIMPLE_DATE_FORMAT));
		try {
			mapper.writeValue(stringWriter, obj);
		} catch (JsonGenerationException e) {
			logger.debug(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.debug(e.getMessage(), e);
		} catch (IOException e) {
			logger.debug(e.getMessage(), e);
		}
		
		return stringWriter.toString();  
	}
	
	/**
	 * List集合转JSON字符串.
	 * @param list
	 * @return
	 * @throws IOException 
	 */	
	public static final void writeListJSON(List<?> list,HttpServletResponse response) throws IOException {
		
		StringWriter stringWriter = new StringWriter();    
		try {
			ObjectMappingCustomer mapper = new ObjectMappingCustomer(); 
			mapper.setDateFormat(new SimpleDateFormat(SIMPLE_DATE_FORMAT));
			mapper.writeValue(stringWriter,list);
		} catch (JsonGenerationException e) {
			logger.debug(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.debug(e.getMessage(), e);
		} catch (IOException e) {
			logger.debug(e.getMessage(), e);
		}     
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//JSON在传递过程中是普通字符串形式传递
		out.println(writeEntityJSON(list));
		out.flush();
		out.close();
	}
	/**
	 * Map集合转换成Json字符串.
	 * @param map
	 * @return
	 */
	public static final String writeMapJSON(Map<?, ?> map) {
		StringWriter stringWriter = new StringWriter();    
		try {
			ObjectMappingCustomer mapper = new ObjectMappingCustomer();   
			mapper.setDateFormat(new SimpleDateFormat(SIMPLE_DATE_FORMAT));
			mapper.writeValue(stringWriter,map);
		} catch (JsonGenerationException e) {
			logger.debug(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.debug(e.getMessage(), e);
		} catch (IOException e) {
			logger.debug(e.getMessage(), e);
		}     
		return stringWriter.toString();  
	}
	
	public static final void  writeObjJSON(Object o ,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//JSON在传递过程中是普通字符串形式传递
		out.println(writeEntityJSON(o));
		out.flush();
		out.close();
	}
}
