/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author student
 */
public class SMTPAuthenticator extends Authenticator{
      private String username,password ;
      public SMTPAuthenticator(String username,String password)
      {
          this.username = username ;
          this.password = password ;
         // System.out.println("Username = "+this.usrename+"\n Password are set");
      }

      public  javax.mail.PasswordAuthentication getPasswordAuthentication()
      {
          //  System.out.println("verifing USername and Password with = "+this.usrename);

            return new PasswordAuthentication(this.username, this.password) ;
      }
}
