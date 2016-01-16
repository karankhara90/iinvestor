/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beans.companysnapshot;

/**
 *
 * @author student
 */
public class UpdateCompanyInformationBean {
    private String txtCompanyName,txtCompanyCode,txtIndustryName,txtExchangeid0,txtExchangeid1,ddlExchangeType,
            txtSecurityCode0,ddlStatus0,txtSecurityCode1,ddlStatus1;

    public String getDdlExchangeType() {
        return ddlExchangeType;
    }

    public String getTxtExchangeid0() {
        return txtExchangeid0;
    }

    public void setTxtExchangeid0(String txtExchangeid0) {
        this.txtExchangeid0 = txtExchangeid0;
    }

    public String getTxtExchangeid1() {
        return txtExchangeid1;
    }

    public void setTxtExchangeid1(String txtExchangeid1) {
        this.txtExchangeid1 = txtExchangeid1;
    }


    public void setDdlExchangeType(String ddlExchangeType) {
        this.ddlExchangeType = ddlExchangeType;
    }

    public String getDdlStatus0() {
        return ddlStatus0;
    }

    public void setDdlStatus0(String ddlStatus0) {
        this.ddlStatus0 = ddlStatus0;
    }

    public String getDdlStatus1() {
        return ddlStatus1;
    }

    public void setDdlStatus1(String ddlStatus1) {
        this.ddlStatus1 = ddlStatus1;
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

}
