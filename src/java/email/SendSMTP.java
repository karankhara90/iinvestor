/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package email;
import java.util.Date;
import javax.mail.*;
import java.util.Properties ;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author student
 */
public class SendSMTP {
         public static String sendMail (String toEmailId,String text,String subject)
       {

             String result="failed";
            try
            {
                Properties p = new Properties();
                p.put("mail.smtp.auth","true");
                p.put("mail.transport.protocol","smtp");
                p.put("mail.smtp.host","smtp.gmail.com") ;
                p.put("mail.smtp.port","25");
                p.put("mail.smtp.starttls.enable","true");

                Authenticator auth = new SMTPAuthenticator("heena.girdher973@gmail.com", "validgmailpassword");

                Session mailSession = Session.getInstance(p,auth) ;


                Message msg = new MimeMessage(mailSession);

                msg.setFrom(new InternetAddress("heena.girdher973@gmail.com"));

                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmailId));
                msg.setSentDate(new Date());
                msg.setSubject(subject);
                msg.setText(text);

                System.out.println("tring to send msg ..........");
                Transport trans = mailSession.getTransport() ;
                trans.connect();

                Address[] ad = msg.getAllRecipients() ;
                for (int i = 0 ; i<ad.length ; i++)
                {
                    System.out.println("sending to .............." + ad[i].toString());
                    Address[] ad1 = new Address[1];
                    ad1[0] = ad[i];
                    System.out.println("sending email actually using ad1 and value of ad1 is................"+ ad[i].toString());
                    trans.send(msg,ad1);

                }
                 result="sent";

            }
            catch (Exception e)
            {
                System.out.println("Something gone wrong while sending mail!");
                e.printStackTrace();
                return result;
            }
             return result;
       }
}
