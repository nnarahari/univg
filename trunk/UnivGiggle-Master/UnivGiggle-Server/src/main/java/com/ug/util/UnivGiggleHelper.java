/**
 * 
 */
package com.ug.util;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.ug.model.Classified;
import com.ug.model.User;

/**
 * @author srajen03
 *
 */
public class UnivGiggleHelper {

	private static Logger logger = Logger.getLogger(UnivGiggleHelper.class);
	
	
	private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    
    public boolean sendMail(){
    	boolean isMailSend = false;
    	/*SimpleMailMessage msg = new SimpleMailMessage();
    	msg.setFrom("univgiggle2010@gmail.com");
        msg.setTo("seeni.vasan@gmail.com");
        msg.setSubject("Test");
        msg.setText("Hello, h r u");
        try{
            mailSender.send(msg);
            isMailSend = true;
        }
        catch(MailException ex) {
            logger.error("Error while sending mail ..", ex);   
            
        }*/
    	
    	MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo("seeni.vasan@gmail.com");
               message.setFrom("webmaster@univgiggle.com"); 
               message.setSubject("Classified Confirmation");
               
               Classified classified = new Classified();
               //classified.setUserName("Arun");
               classified.setId(1001L);
               
               Map model = new HashMap();
               model.put("classified", classified);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "ClassifiedConfirmation.vm", model);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);

    	
    	
    	
    	
    	return isMailSend;
    }

	/**
	 * @param velocityEngine the velocityEngine to set
	 */
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

}
