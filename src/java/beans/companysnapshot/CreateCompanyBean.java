/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beans.companysnapshot;

/**
 *
 * @author student
 */
public class CreateCompanyBean {
    private String txtCompanyName,txtCompanyCode,txtIndustryName,ddlExchangeType,txtSecurityCode0,
            txtSecurityCode1,txtSecurityAbbr0,txtSecurityAbbr1;

    public String getTxtSecurityAbbr0() {
        return txtSecurityAbbr0;
    }

    public void setTxtSecurityAbbr0(String txtSecurityAbbr0) {
        this.txtSecurityAbbr0 = txtSecurityAbbr0;
    }

    public String getTxtSecurityAbbr1() {
        return txtSecurityAbbr1;
    }

    public void setTxtSecurityAbbr1(String txtSecurityAbbr1) {
        this.txtSecurityAbbr1 = txtSecurityAbbr1;
    }

    public String getTxtSecurityCode0() {
        return txtSecurityCode0;
    }

    public void setTxtSecurityCode0(String txtSecurityCode0) {
        this.txtSecurityCode0 = txtSecurityCode0;
    }

    public String getTxtSecurityCode1() {
        return txtSecurityCode1;
    }

    public void setTxtSecurityCode1(String txtSecurityCode1) {
        this.txtSecurityCode1 = txtSecurityCode1;
    }

    public String getDdlExchangeType() {
        return ddlExchangeType;
    }

    public void setDdlExchangeType(String ddlExchangeType) {
        this.ddlExchangeType = ddlExchangeType;
    }

    public String getTxtCompanyCode() {
        return txtCompanyCode;
    }

    public void setTxtCompanyCode(String txtCompanyCode) {
        this.txtCompanyCode = txtCompanyCode;
    }

    public String getTxtCompanyName() {
        return txtCompanyName;
    }

    public void setTxtCompanyName(String txtCompanyName) {
        this.txtCompanyName = txtCompanyName;
    }

    public String getTxtIndustryName() {
        return txtIndustryName;
    }

    public void setTxtIndustryName(String txtIndustryName) {
        this.txtIndustryName = txtIndustryName;
    }

}
