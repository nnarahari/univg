/**
 * 
 */
package com.ug.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.ug.dao.CorporateDAO;
import com.ug.model.Corporate;
import com.ug.model.ResultInfo;
import com.ug.service.CorporateManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srrajend
 *
 */
public class CorporateManagerImpl implements CorporateManager {
	
	private Logger logger = Logger.getLogger(CorporateManagerImpl.class);
	
	@Autowired
	private CorporateDAO corporateDAO;

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#addCorporate(com.ug.model.Corporate)
	 */
	@Override
	public ResultInfo addCorporate(Corporate corporate) throws Exception {
		logger.info("addCorporate() started...");
		ResultInfo resultInfo = null;
		Corporate newCorporate = corporateDAO.createOrUpdateCorporate(corporate);
		if(newCorporate != null){
			logger.info("Corporate details added successfully");
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Corporate profile created successfully.", "0", "Corporate profile created successfully.", newCorporate);
		}else{
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Store Corporate profile failed.", "101", "Store Corporate profile failed.", null);
		}
		return resultInfo;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#getCorporate(java.lang.String)
	 */
	@Override
	public Corporate getCorporate(String corpEmail) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#updateCorporate(com.ug.model.Corporate)
	 */
	@Override
	public ResultInfo updateCorporate(Corporate corporate) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
