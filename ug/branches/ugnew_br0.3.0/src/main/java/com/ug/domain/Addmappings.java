package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(identifierType = AddmappingsPK.class, versionField = "", table = "addmappings")
@RooDbManaged(automaticallyDelete = true)
public class Addmappings {
}
