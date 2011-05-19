package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "corporate", finders = { "findCorporatesByCorporateLoanAmounts", "findCorporatesByCorporateName", "findCorporatesByCorporateNameLike", "findCorporatesByCorporatePrimaryContact", "findCorporatesByCorporatePrimaryContactLike", "findCorporatesByIndustry", "findCorporatesByIndustryLike", "findCorporatesByMobile", "findCorporatesByUserId", "findCorporatesByWorkPhone", "findCorporatesByZip" })
public class Corporate {
}
