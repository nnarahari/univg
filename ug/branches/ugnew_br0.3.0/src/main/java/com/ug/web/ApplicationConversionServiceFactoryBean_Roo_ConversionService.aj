// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Address;
import com.ug.domain.Addresstype;
import com.ug.domain.Corporate;
import com.ug.domain.CorporateLoanAmount;
import com.ug.domain.Department;
import com.ug.domain.Gender;
import com.ug.domain.Grantneededfor;
import com.ug.domain.Guarantor;
import com.ug.domain.Loan;
import com.ug.domain.Loanstatus;
import com.ug.domain.Profile;
import com.ug.domain.Programstudy;
import com.ug.domain.Role;
import com.ug.domain.State;
import com.ug.domain.University;
import com.ug.domain.User;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    Converter<Address, String> ApplicationConversionServiceFactoryBean.getAddressConverter() {
        return new Converter<Address, String>() {
            public String convert(Address address) {
            	return new StringBuilder().append(address.getDisplayIdentifier()).append(" ").append(address.getAddressTypeId().getAddressTypeName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Addresstype, String> ApplicationConversionServiceFactoryBean.getAddresstypeConverter() {
        return new org.springframework.core.convert.converter.Converter<Addresstype, String>() {
            public String convert(Addresstype addresstype) {
                return new StringBuilder().append(addresstype.getAddressTypeName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Corporate, String> ApplicationConversionServiceFactoryBean.getCorporateConverter() {
        return new org.springframework.core.convert.converter.Converter<Corporate, String>() {
            public String convert(Corporate corporate) {
                return new StringBuilder().append(corporate.getCorporateName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<CorporateLoanAmount, String> ApplicationConversionServiceFactoryBean.getCorporateLoanAmountConverter() {
        return new org.springframework.core.convert.converter.Converter<CorporateLoanAmount, String>() {
            public String convert(CorporateLoanAmount corporateloanamount) {
                return new StringBuilder().append(corporateloanamount.getAvailableLoanAmount()).append(" ").append(corporateloanamount.getCommittedLoanAmount()).append(" ").append(corporateloanamount.getLoanedAmount()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Department, String> ApplicationConversionServiceFactoryBean.getDepartmentConverter() {
        return new org.springframework.core.convert.converter.Converter<Department, String>() {
            public String convert(Department department) {
                return new StringBuilder().append(department.getDepartmentName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Gender, String> ApplicationConversionServiceFactoryBean.getGenderConverter() {
        return new org.springframework.core.convert.converter.Converter<Gender, String>() {
            public String convert(Gender gender) {
                return new StringBuilder().append(gender.getGenderName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Grantneededfor, String> ApplicationConversionServiceFactoryBean.getGrantneededforConverter() {
        return new org.springframework.core.convert.converter.Converter<Grantneededfor, String>() {
            public String convert(Grantneededfor grantneededfor) {
                return new StringBuilder().append(grantneededfor.getGrantNeed()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Guarantor, String> ApplicationConversionServiceFactoryBean.getGuarantorConverter() {
        return new org.springframework.core.convert.converter.Converter<Guarantor, String>() {
            public String convert(Guarantor guarantor) {
                return new StringBuilder().append(guarantor.getFirstName()).append(" ").append(guarantor.getFirstName()).append(" From").append(guarantor.getUniversityId().getUniversityName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Loan, String> ApplicationConversionServiceFactoryBean.getLoanConverter() {
        return new org.springframework.core.convert.converter.Converter<Loan, String>() {
            public String convert(Loan loan) {
                return new StringBuilder().append(loan.getLoanName()).append(" ").append(loan.getLoanAmount()).append(" ").append(loan.getLoanNeededBy()).append(" ").append(loan.getComments()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Loanstatus, String> ApplicationConversionServiceFactoryBean.getLoanstatusConverter() {
        return new org.springframework.core.convert.converter.Converter<Loanstatus, String>() {
            public String convert(Loanstatus loanstatus) {
                return new StringBuilder().append(loanstatus.getLoanStatusName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Profile, String> ApplicationConversionServiceFactoryBean.getProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<Profile, String>() {
            public String convert(Profile profile) {
                return new StringBuilder().append(profile.getUserId().getFirstName()).append(" ").append(profile.getUserId().getFirstName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Programstudy, String> ApplicationConversionServiceFactoryBean.getProgramstudyConverter() {
        return new org.springframework.core.convert.converter.Converter<Programstudy, String>() {
            public String convert(Programstudy programstudy) {
                return new StringBuilder().append(programstudy.getProgramStudyName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Role, String> ApplicationConversionServiceFactoryBean.getRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<Role, String>() {
            public String convert(Role role) {
                return new StringBuilder().append(role.getRoleName()).append(" ").toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<State, String> ApplicationConversionServiceFactoryBean.getStateConverter() {
        return new org.springframework.core.convert.converter.Converter<State, String>() {
            public String convert(State state) {
                return new StringBuilder().append(state.getStateName()).append(" ").toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<University, String> ApplicationConversionServiceFactoryBean.getUniversityConverter() {
        return new org.springframework.core.convert.converter.Converter<University, String>() {
            public String convert(University university) {
                return new StringBuilder().append(university.getUniversityName()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<User, String> ApplicationConversionServiceFactoryBean.getUserConverter() {
        return new org.springframework.core.convert.converter.Converter<User, String>() {
            public String convert(User user) {
                return new StringBuilder().append(user.getFirstName()).append(" ").append(user.getLastName()).toString();
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAddressConverter());
        registry.addConverter(getAddresstypeConverter());
        registry.addConverter(getCorporateConverter());
        registry.addConverter(getCorporateLoanAmountConverter());
        registry.addConverter(getDepartmentConverter());
        registry.addConverter(getGenderConverter());
        registry.addConverter(getGrantneededforConverter());
        registry.addConverter(getGuarantorConverter());
        registry.addConverter(getLoanConverter());
        registry.addConverter(getLoanstatusConverter());
        registry.addConverter(getProfileConverter());
        registry.addConverter(getProgramstudyConverter());
        registry.addConverter(getRoleConverter());
        registry.addConverter(getStateConverter());
        registry.addConverter(getUniversityConverter());
        registry.addConverter(getUserConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
