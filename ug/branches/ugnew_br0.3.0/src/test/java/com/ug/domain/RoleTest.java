/**
 * 
 */
package com.ug.domain;


import java.util.List;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

/**
 * @author srrajend
 *
 */
@ContextConfiguration(locations = { "/META-INF/spring/applicationContext.xml" })
public class RoleTest extends AbstractJUnit4SpringContextTests {

	@Test
	public void getAllRoles(){
		List<Role> rols = Role.findAllRoles();
		for (Role role : rols) {
			System.out.println(role);
		}
	}

}
