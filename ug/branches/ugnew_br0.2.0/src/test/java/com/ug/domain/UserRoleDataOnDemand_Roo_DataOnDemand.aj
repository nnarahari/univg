// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.RoleDataOnDemand;
import com.ug.domain.UserDataOnDemand;
import com.ug.domain.UserRole;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect UserRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserRoleDataOnDemand: @Component;
    
    private Random UserRoleDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<UserRole> UserRoleDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand UserRoleDataOnDemand.userDataOnDemand;
    
    @Autowired
    private RoleDataOnDemand UserRoleDataOnDemand.roleDataOnDemand;
    
    public UserRole UserRoleDataOnDemand.getNewTransientUserRole(int index) {
        com.ug.domain.UserRole obj = new com.ug.domain.UserRole();
        obj.setUserEntry(userDataOnDemand.getRandomUser());
        obj.setRoleEntry(roleDataOnDemand.getRandomRole());
        return obj;
    }
    
    public UserRole UserRoleDataOnDemand.getSpecificUserRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        UserRole obj = data.get(index);
        return UserRole.findUserRole(obj.getId());
    }
    
    public UserRole UserRoleDataOnDemand.getRandomUserRole() {
        init();
        UserRole obj = data.get(rnd.nextInt(data.size()));
        return UserRole.findUserRole(obj.getId());
    }
    
    public boolean UserRoleDataOnDemand.modifyUserRole(UserRole obj) {
        return false;
    }
    
    public void UserRoleDataOnDemand.init() {
        data = com.ug.domain.UserRole.findUserRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserRole' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.ug.domain.UserRole>();
        for (int i = 0; i < 10; i++) {
            com.ug.domain.UserRole obj = getNewTransientUserRole(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}