/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beans.companysnapshot;

/**
 *
 * @author student
 */
public class ViewCapitalStructureBean {
    private String companyname,fromYear,toYear,classOfShare,authorisedCapital,issuedCapital,
            paidUpShares,faceValue,paidUpCapital;

    public String getAuthorisedCapital() {
        return authorisedCapital;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public void setAuthorisedCapital(String authorisedCapital) {
        this.authorisedCapital = authorisedCapital;
    }

    public String getClassOfShare() {
        return classOfShare;
    }

    public void setClassOfShare(String classOfShare) {
        this.classOfShare = classOfShare;
    }

    public String getFaceValue() {
        return faceValue;
    }

    public void setFaceValue(String faceValue) {
        this.faceValue = faceValue;
    }

    public String getFromYear() {
        return fromYear;
    }

    public void setFromYear(String fromYear) {
        this.fromYear = fromYear;
    }

    public String getIssuedCapital() {
        return issuedCapital;
    }

    public void setIssuedCapital(String issuedCapital) {
        this.issuedCapital = issuedCapital;
    }

    public String getPaidUpCapital() {
        return paidUpCapital;
    }

    public void setPaidUpCapital(String paidUpCapital) {
        this.paidUpCapital = paidUpCapital;
    }

    public String getPaidUpShares() {
        return paidUpShares;
    }

    public void setPaidUpShares(String paidUpShares) {
        this.paidUpShares = paidUpShares;
    }

    public String getToYear() {
        return toYear;
    }

    public void setToYear(String toYear) {
        this.toYear = toYear;
    }
    
}
