// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.reference.AddressTypes;
import com.ug.reference.State;
import java.lang.String;
import java.util.Date;

privileged aspect Address_Roo_JavaBean {
    
    public String Address.getDisplayIdentifier() {
        return this.displayIdentifier;
    }
    
    public void Address.setDisplayIdentifier(String displayIdentifier) {
        this.displayIdentifier = displayIdentifier;
    }
    
    public Date Address.getDateFrom() {
        return this.dateFrom;
    }
    
    public void Address.setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }
    
    public Date Address.getDateTo() {
        return this.dateTo;
    }
    
    public void Address.setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }
    
    public AddressTypes Address.getAddressType() {
        return this.addressType;
    }
    
    public void Address.setAddressType(AddressTypes addressType) {
        this.addressType = addressType;
    }
    
    public String Address.getAddress1() {
        return this.address1;
    }
    
    public void Address.setAddress1(String address1) {
        this.address1 = address1;
    }
    
    public String Address.getAddress2() {
        return this.address2;
    }
    
    public void Address.setAddress2(String address2) {
        this.address2 = address2;
    }
    
    public String Address.getCity() {
        return this.city;
    }
    
    public void Address.setCity(String city) {
        this.city = city;
    }
    
    public State Address.getState() {
        return this.state;
    }
    
    public void Address.setState(State state) {
        this.state = state;
    }
    
    public String Address.getZip() {
        return this.zip;
    }
    
    public void Address.setZip(String zip) {
        this.zip = zip;
    }
    
    public String Address.getCountry() {
        return this.country;
    }
    
    public void Address.setCountry(String country) {
        this.country = country;
    }
    
}
