package com.ug.controller;

import flex.messaging.FactoryInstance;
import flex.messaging.FlexFactory;
import flex.messaging.config.ConfigMap;
/**
 * 
 * @author srajen03
 *
 */
public class SpringFactory implements FlexFactory {

	/**
	 * Implement use customised FactoryInstance SpringFactoryInstance.
	 * 
	 * @see flex.messaging.FlexFactory#createFactoryInstance(java.lang.String, flex.messaging.config.ConfigMap)
	 */
	public FactoryInstance createFactoryInstance(String id, ConfigMap properties) {
		SpringFactoryInstance i = new SpringFactoryInstance(this, id, properties);
		i.setSource(properties.getPropertyAsString(SOURCE, i.getId()));
		return i;
	}

	/**
	 * Implement to get Spring Bean.
	 * 
	 * @see flex.messaging.FlexFactory#lookup(flex.messaging.FactoryInstance)
	 */
	public Object lookup(FactoryInstance i) {
		return ((SpringFactoryInstance) i).getSpringBean();
	}

	/**
	 * @see flex.messaging.FlexConfigurable#initialize(java.lang.String, flex.messaging.config.ConfigMap)
	 */
	public void initialize(String id, ConfigMap configMap) {}

}
