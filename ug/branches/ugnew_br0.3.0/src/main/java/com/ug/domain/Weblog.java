package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(identifierType = WeblogPK.class, versionField = "", table = "weblog")
@RooDbManaged(automaticallyDelete = true)
public class Weblog {
}
