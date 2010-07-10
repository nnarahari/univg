/**
 * 
 */
package com.ug.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.log4j.Logger;

import com.ug.model.ResultInfo;

/**
 * Utility class for UnigGiggle application
 * @author srini
 *
 */
public class UnivGiggleUtil {

	private static Logger logger = Logger.getLogger(UnivGiggleUtil.class);
	/**
	 * Creates {@link ResultInfo} for manger classes.
	 * @param status
	 * @param resDetail
	 * @param resCode
	 * @param resString
	 * @param obj
	 * @return
	 */
	public static ResultInfo createResultInfo(boolean status, String resDetail, String resCode, String resString, Object obj ){
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setSuccess(status);
		resultInfo.setResponseDetail(resDetail);
		resultInfo.setResponseCode(resCode);
		resultInfo.setResponseString(resString);
		resultInfo.setResponseObject(obj);
		return resultInfo;
	}
	
	
	/**
	 * Stores mentee image in to the applications file system.
	 * @param imageFileName
	 * @param imageData
	 * @param id
	 * @param imageAppURL
	 * @param imageWebURL
	 * @return
	 */
	public static String storeImage(String imageFileName, byte[] imageData, Long id, String moduleName, String imageAppURL, String imageWebURL) {
		logger.info("inside storeImage()");
		String imagePath="";
		logger.info("imageAppURL ==>" + imageAppURL);
		String imageFolder = imageAppURL + File.separator + moduleName + File.separator +id.toString() + File.separator;
		logger.info("ImageFolder ==>"+ imageFolder);
		boolean foldersCreated = new File(imageFolder).mkdirs();
		logger.info("foldersCreated ==>"+ foldersCreated);
		String imageNameURL = "";
		FileOutputStream fos=null;
			try {
				fos = new FileOutputStream(new File(imageNameURL));
				fos.write(imageData);
				fos.close();
			} catch (FileNotFoundException e) {
				logger.error("Error while saving images ", e);
			} catch (IOException e) {
				logger.error("Error while saving images ", e);
			}
			fos = null;
			imagePath += imageWebURL + moduleName + id.toString() + "/"+ imageFileName;
		logger.info("imagePaths ==>"+ imagePath);
		return imagePath;
	}
}
