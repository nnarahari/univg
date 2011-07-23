// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Add;
import com.ug.domain.Address;
import com.ug.domain.Addresstype;
import com.ug.domain.Addtype;
import com.ug.domain.Corporate;
import com.ug.domain.CorporateLoanAmount;
import com.ug.domain.Country;
import com.ug.domain.Department;
import com.ug.domain.Gender;
import com.ug.domain.Grantneededfor;
import com.ug.domain.Guarantor;
import com.ug.domain.Joblisting;
import com.ug.domain.Jobtype;
import com.ug.domain.Loan;
import com.ug.domain.Loanstatus;
import com.ug.domain.Mentee;
import com.ug.domain.Mentor;
import com.ug.domain.MentorMentee;
import com.ug.domain.Pagesection;
import com.ug.domain.Profession;
import com.ug.domain.Profile;
import com.ug.domain.Programstudy;
import com.ug.domain.Role;
import com.ug.domain.State;
import com.ug.domain.Testimonial;
import com.ug.domain.University;
import com.ug.domain.User;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {

    Converter<Add, String> ApplicationConversionServiceFactoryBean.getAddConverter() {
        return new Converter<Add, String>() {
            public String convert(Add add) {
                return new StringBuilder().append(add.getAddDescription()).append(" ").append(add.getContent()).append(" ").append(add.getAddTypeId()).append(" ").append(add.getCorporateId()).toString();
            }
        };
    }    
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
    
    org.springframework.core.convert.converter.Converter<Addtype, String> ApplicationConversionServiceFactoryBean.getAddtypeConverter() {
        return new org.springframework.core.convert.converter.Converter<Addtype, String>() {
            public String convert(Addtype addtype) {
                return new StringBuilder().append(addtype.getAddtypeName()).append(" ").append(addtype.getAddtypeDesc()).toString();
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
    
    org.springframework.core.convert.converter.Converter<Country, String> ApplicationConversionServiceFactoryBean.getCountryConverter() {
        return new org.springframework.core.convert.converter.Converter<Country, String>() {
            public String convert(Country country) {
                return new StringBuilder().append(country.getCountryName()).toString();
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

    org.springframework.core.convert.converter.Converter<Joblisting, String> ApplicationConversionServiceFactoryBean.getJoblistingConverter() {
        return new org.springframework.core.convert.converter.Converter<Joblisting, String>() {
            public String convert(Joblisting joblisting) {
                return new StringBuilder().append(joblisting.getJobTitle()).append(" ").append(joblisting.getJobContent()).append(" ").append(joblisting.getJobTypeId()).append(" ").append(joblisting.getCorporateId()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Jobtype, String> ApplicationConversionServiceFactoryBean.getJobtypeConverter() {
        return new org.springframework.core.convert.converter.Converter<Jobtype, String>() {
            public String convert(Jobtype jobtype) {
                return new StringBuilder().append(jobtype.getJobTypeName()).append(" ").append(jobtype.getJobTypeDesc()).toString();
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
    
    org.springframework.core.convert.converter.Converter<Mentee, String> ApplicationConversionServiceFactoryBean.getMenteeConverter() {
        return new org.springframework.core.convert.converter.Converter<Mentee, String>() {
            public String convert(Mentee mentee) {
                return new StringBuilder().append(mentee.getDateOfBirth()).append(" ").append(mentee.getAttended()).append(" ").append(mentee.getHomePhone()).append(" ").append(mentee.getMobile()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Mentor, String> ApplicationConversionServiceFactoryBean.getMentorConverter() {
        return new org.springframework.core.convert.converter.Converter<Mentor, String>() {
            public String convert(Mentor mentor) {
                return new StringBuilder().append(mentor.getDateOfBirth()).append(" ").append(mentor.getHomePhone()).append(" ").append(mentor.getMobile()).append(" ").append(mentor.getLinkedInProfile()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<MentorMentee, String> ApplicationConversionServiceFactoryBean.getMentorMenteeConverter() {
        return new org.springframework.core.convert.converter.Converter<MentorMentee, String>() {
            public String convert(MentorMentee mentormentee) {
                return new StringBuilder().append(mentormentee.getMentor()).append(" ").append(mentormentee.getMentee()).toString();
            }
        };
    }

    org.springframework.core.convert.converter.Converter<Pagesection, String> ApplicationConversionServiceFactoryBean.getPagesectionConverter() {
        return new org.springframework.core.convert.converter.Converter<Pagesection, String>() {
            public String convert(Pagesection pagesection) {
                return new StringBuilder().append(pagesection.getPagesectionName()).append(" ").append(pagesection.getPagesectionDescription()).toString();
            }
        };
    }
 
    org.springframework.core.convert.converter.Converter<Profession, String> ApplicationConversionServiceFactoryBean.getProfessionConverter() {
        return new org.springframework.core.convert.converter.Converter<Profession, String>() {
            public String convert(Profession profession) {
                return new StringBuilder().append(profession.getProfessionName()).append(" ").append(profession.getProfessionDescription()).toString();
            }
        };
    }
 
    org.springframework.core.convert.converter.Converter<Profile, String> ApplicationConversionServiceFactoryBean.getProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<Profile, String>() {
            public String convert(Profile profile) {
                return new StringBuilder().append(profile.getExpectedGraduationDate()).append(" ").append(profile.getDateOfBirth()).append(" ").append(profile.getHomePhone()).append(" ").append(profile.getLinkedInProfile()).toString();
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
    
    org.springframework.core.convert.converter.Converter<Testimonial, String> ApplicationConversionServiceFactoryBean.getTestimonialConverter() {
        return new org.springframework.core.convert.converter.Converter<Testimonial, String>() {
            public String convert(Testimonial testimonial) {
                return new StringBuilder().append(testimonial.getUserId()).append(" ").append(testimonial.getRole()).append(" ").append(testimonial.getDate()).toString();
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
        registry.addConverter(getAddConverter());
        registry.addConverter(getAddressConverter());
        registry.addConverter(getAddresstypeConverter());
        registry.addConverter(getAddtypeConverter());
        registry.addConverter(getCorporateConverter());
        registry.addConverter(getCorporateLoanAmountConverter());
        registry.addConverter(getCountryConverter());
        registry.addConverter(getDepartmentConverter());
        registry.addConverter(getGenderConverter());
        registry.addConverter(getGrantneededforConverter());
        registry.addConverter(getGuarantorConverter());
        registry.addConverter(getJoblistingConverter());
        registry.addConverter(getJobtypeConverter());
        registry.addConverter(getLoanConverter());
        registry.addConverter(getLoanstatusConverter());
        registry.addConverter(getMenteeConverter());
        registry.addConverter(getMentorConverter());
        registry.addConverter(getMentorMenteeConverter());
        registry.addConverter(getPagesectionConverter());
        registry.addConverter(getProfessionConverter());
        registry.addConverter(getProfileConverter());
        registry.addConverter(getProgramstudyConverter());
        registry.addConverter(getRoleConverter());
        registry.addConverter(getStateConverter());
        registry.addConverter(getTestimonialConverter());
        registry.addConverter(getUniversityConverter());
        registry.addConverter(getUserConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
