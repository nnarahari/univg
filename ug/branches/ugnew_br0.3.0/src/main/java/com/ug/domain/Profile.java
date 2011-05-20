package com.ug.domain;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import javax.persistence.Transient;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.mail.MailSender;
import org.springframework.beans.factory.annotation.Autowired;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "profile", finders = { "findProfilesByUserId", "findProfilesByUniversityId", "findProfilesByCitizenship", "findProfilesByCitizenshipLike", "findProfilesByDateOfBirth", "findProfilesByDateOfBirthBetween", "findProfilesByDateOfBirthGreaterThan", "findProfilesByDateOfBirthLessThan", "findProfilesByDepartmentId", "findProfilesByExpectedGraduationDate", "findProfilesByExpectedGraduationDateBetween", "findProfilesByGenderId", "findProfilesByHomePhone", "findProfilesByHomePhoneLike", "findProfilesByMobile", "findProfilesByMobileLike", "findProfilesByMobileNotEquals", "findProfilesByPhotoIdentifier", "findProfilesByPhotoIdentifierLike", "findProfilesByProgramStudyId", "findProfilesByResumeIdentifier", "findProfilesByResumeIdentifierLike", "findProfilesByUniversityEmail", "findProfilesByUniversityEmailLike" })
public class Profile  {

//    @Transient
//    private CommonsMultipartFile file;
//
//    public CommonsMultipartFile getFile() {
//        return file;
//    }

//    public void setFile(CommonsMultipartFile file) {
//        if (file != null) {
//            this.file = file;
//            String fileName = file.getOriginalFilename();
//            long size = file.getSize();
//            try {
//                InputStream in = file.getInputStream();
//                FileOutputStream f = new FileOutputStream("C:/ug/profile/" + getUserId().getId() + "-profile" + file.getOriginalFilename().substring(file.getOriginalFilename().indexOf('.')));
//                int ch = 0;
//                while ((ch = in.read()) != -1) {
//                    f.write(ch);
//                }
//                f.flush();
//                f.close();
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }

}
