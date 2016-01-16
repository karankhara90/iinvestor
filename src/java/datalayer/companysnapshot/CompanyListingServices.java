/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.companysnapshot;

import beans.companysnapshot.CompanyExchangeBean;
import beans.companysnapshot.CompanyListingBean;
import beans.companysnapshot.UpdateCompanyBean;
import beans.companysnapshot.UpdateCompanySnapshotBean;
import beans.companysnapshot.UpdateFundamentalsBean;
import beans.companysnapshot.ViewCapitalStructureBean;
import beans.companysnapshot.UpdateCapitalStructureBean;
import beans.companysnapshot.ViewQuarterlyResultBean;
import beans.companysnapshot.CreateCompanyBean;
import beans.companysnapshot.UpdateSharePriceBean;
import beans.companysnapshot.UpdateCompanyInformationBean;
import beans.companysnapshot.UpdateQuarterlyResultBean;
import datalayer.common.ConnectDB;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author student
 */
public class CompanyListingServices {

    public ArrayList getAllCompanyRecords() {
        Connection con = null;
        Statement stmt = null;
        ArrayList al = new ArrayList();
        ResultSet rs = null;
        CompanyListingBean objBean = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select company_id,company_name,company_code from company";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new CompanyListingBean();
                objBean.setCompanyid(String.valueOf(rs.getInt("company_id")));
                objBean.setCompanyName(rs.getString("company_name"));
                objBean.setCompanyCode(rs.getString("company_code"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("in getAllCompanyRecords" + e);

        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return al;
    }

    public UpdateCompanyInformationBean getViewCompany(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        UpdateCompanyInformationBean objBean = new UpdateCompanyInformationBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select company_name,company_code,industry_name from company where company_id=" + cid + "";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean.setTxtCompanyName(rs.getString(1));
                objBean.setTxtCompanyCode(rs.getString(2));
                objBean.setTxtIndustryName(rs.getString(3));


            }
        } catch (Exception e) {
            System.out.println("In getViewCompany" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return objBean;
    }

    public UpdateCompanyInformationBean getViewCompInfo(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        UpdateCompanyInformationBean objBean = new UpdateCompanyInformationBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select exchange_abbr,exchange_security_code,company_exchange_status from companyexchange where company_id=" + cid + "";
            rs = stmt.executeQuery(q);

            while (rs.next()) {
                objBean.setDdlExchangeType(rs.getString(1));
                if (rs.getString(1).equalsIgnoreCase("NSE")) {
                    objBean.setTxtSecurityCode0(rs.getString(2));
                    objBean.setDdlStatus0(rs.getString(3));
                } else if (rs.getString(1).equals("BSE")) {
                    objBean.setTxtSecurityCode1(rs.getString(2));
                    objBean.setDdlStatus1(rs.getString(3));
                }
            }
        } catch (Exception e) {
            System.out.println("In getViewCompInfo");
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return objBean;
    }

    public UpdateCompanySnapshotBean getViewSnapshot(int companyid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        UpdateCompanySnapshotBean objBean = new UpdateCompanySnapshotBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select c.company_id,c.company_name,c.industry_name,registered_office,telephone_number,fax_number,website,chief_executive_name," +
                    "secretary_name,face_value,market_lot,business_group_name,incorporation_date," +
                    "registrar_of_company,listed_on from company c,companysnapshot cs where c.company_id=cs.company_id and cs.company_id=" + companyid + "";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean.setCompanyid(String.valueOf(rs.getInt("company_id")));
                objBean.setCompanyname(rs.getString("company_name"));
                objBean.setIndustryname(rs.getString("industry_name"));
                objBean.setTaRegisteredOffice(rs.getString("registered_office"));
                objBean.setTxtPhoneNumber(rs.getString("telephone_number"));
                objBean.setTxtFax(rs.getString("fax_number"));
                objBean.setTxtWebsite(rs.getString("website"));
                objBean.setTxtChiefExecutiveName(rs.getString("chief_executive_name"));
                objBean.setTxtSecretaryName(rs.getString("secretary_name"));
                objBean.setTxtFaceValue(rs.getString("face_value"));
                objBean.setTxtMarketLot(rs.getString("market_lot"));
                objBean.setTxtBusinessGroupName(rs.getString("business_group_name"));
                objBean.setTxtIncorporationDate(rs.getString("incorporation_date"));
                objBean.setTaRegistrarOfCompany(rs.getString("registrar_of_company"));
                objBean.setTxtListedOn(rs.getString("listed_on"));
            }
        } catch (Exception e) {
            System.out.println("in getViewSnapshot" + e);

        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return objBean;

    }

    public UpdateFundamentalsBean getCompanyFundamentals(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        UpdateFundamentalsBean objBean = new UpdateFundamentalsBean();
        try {

            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select c.company_id,c.company_name,market_capitalization,book_value,debt_equity,P_E,Dividend_Yield," +
                    "EPS,return_on_net_worth,current_ratio,quick_ration,intrest_cover from company c,companyfundamentals cf " +
                    "where c.company_id=cf.company_id and cf.company_id=" + cid + "";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean.setCompanyid(String.valueOf(rs.getInt("company_id")));
                objBean.setCompanyname(rs.getString("company_name"));
                objBean.setTxtMarketCapitalization(rs.getString("market_capitalization"));
                objBean.setTxtBookValue(rs.getString("book_value"));
                objBean.setTxtDebtEquity(rs.getString("debt_equity"));
                objBean.setTxtPE(rs.getString("P_E"));
                objBean.setTxtDividendYield(rs.getString("Dividend_Yield"));
                objBean.setTxtEPS(rs.getString("EPS"));
                objBean.setTxtReturn(rs.getString("return_on_net_worth"));
                objBean.setTxtCurrentRatio(rs.getString("current_ratio"));
                objBean.setTxtQuickRatio(rs.getString("quick_ration"));
                objBean.setTxtInterestCover(rs.getString("intrest_cover"));
            }
        } catch (Exception e) {
            System.out.println("in getCompanyFundamentals" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return objBean;
    }

    public ArrayList getCapitalStructure(int cid, String name) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        ViewCapitalStructureBean objBean = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select c.company_name,from_year,to_year,class_of_share,authorised_capital,issued_capital,paid_up_shares,face_value,paid_up_capital " +
                    "from company c,companycapitalstructure cs where c.company_id=cs.company_id and " +
                    "cs.company_id=" + cid + " and c.company_name='" + name + "'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new ViewCapitalStructureBean();
                objBean.setFromYear(rs.getString("from_year"));
                objBean.setToYear(rs.getString("to_year"));
                objBean.setClassOfShare(rs.getString("class_of_share"));
                objBean.setAuthorisedCapital(rs.getString("authorised_capital"));
                objBean.setIssuedCapital(rs.getString("issued_capital"));
                objBean.setPaidUpShares(rs.getString("paid_up_shares"));
                objBean.setFaceValue(rs.getString("face_value"));
                objBean.setPaidUpCapital(rs.getString("paid_up_capital"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("in getCapitalStructure" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return al;
    }

    public ViewQuarterlyResultBean getQuaterlyResultCur(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ViewQuarterlyResultBean objBean = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String date = new SimpleDateFormat("yyyy-MM-DD").format(new Date());

            String curYear = date.substring(0, 4);
            String q = "select max(quaterly_result_date)  from company_quaterly_result where company_id=" + cid + "";
            ResultSet rs1 = stmt.executeQuery(q);
            while (rs1.next()) {

                String maxDate = rs1.getString(1);
                String maxYear = maxDate.substring(0, 4);
                if (maxYear.equalsIgnoreCase(curYear)) {

                    String q1 = "select quaterly_result_date,sales_income,expenditure,interest_cover,gross_profit,depriciation," +
                            "tax,pat,equity,OPM,GPM,NPM from company_quaterly_result where company_id=" + cid + " and quaterly_result_date='" + maxDate + "'";
                    rs = stmt.executeQuery(q1);
                    while (rs.next()) {
                        objBean = new ViewQuarterlyResultBean();
                        String quardate = rs.getString("quaterly_result_date");
                        String year = quardate.substring(0, 4);
                        String month = quardate.substring(5, 7);
                        objBean.setYear("year");
                        objBean.setMonth("month");
                        objBean.setTxtSalesIncome(rs.getString("sales_income"));
                        objBean.setTxtExpenditure(rs.getString("expenditure"));
                        objBean.setTxtInterest(rs.getString("interest_cover"));
                        objBean.setTxtGrossProfit(rs.getString("gross_profit"));
                        objBean.setTxtDepriciation(rs.getString("depriciation"));
                        objBean.setTxtTax(rs.getString("tax"));
                        objBean.setTxtPat(rs.getString("pat"));
                        objBean.setTxtEquity(rs.getString("equity"));
                        objBean.setTxtOPM(rs.getString("OPM"));
                        objBean.setTxtGPM(rs.getString("GPM"));
                        objBean.setTxtNPM(rs.getString("NPM"));
                    }
                }


            }

        } catch (Exception e) {
            System.out.println("in getQuaterlyResultCur" + e);
        } finally {
            try {

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return objBean;
    }

    public ViewQuarterlyResultBean getQuaterlyResultPre(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Statement stmt1 = null;
        ViewQuarterlyResultBean objBean = new ViewQuarterlyResultBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            stmt1 = con.createStatement();
            String date = new SimpleDateFormat("yyyy-MM-DD").format(new Date());
            System.out.println(date);
            String curYear = date.substring(0, 4);
            String q = "select max(quaterly_result_date) from company_quaterly_result where company_id=" + cid + "";
            ResultSet rs1 = stmt.executeQuery(q);

            while (rs1.next()) {
                String maxDate = rs1.getString(1);
                System.out.println(maxDate);
                String maxYear = maxDate.substring(0, 4);
                if (maxYear.equalsIgnoreCase(curYear)) {
                    int pYear = Integer.parseInt(curYear) - 1;
                    String strPmnt = maxDate.substring(5, 7);
                    String strPDate = String.valueOf(pYear) + "-" + strPmnt;
                    System.out.println(strPDate);

                    String q1 = "select sales_income,expenditure,interest_cover,gross_profit,depriciation," +
                            "tax,pat,equity,OPM,GPM,NPM from company_quaterly_result where company_id=" + cid + " and substring(quaterly_result_date,1,7)='" + strPDate + "'";
                    System.out.println(q1);
                    rs = stmt1.executeQuery(q1);
                    while (rs.next()) {
                        objBean.setTxtSalesIncome(rs.getString("sales_income"));
                        objBean.setTxtExpenditure(rs.getString("expenditure"));
                        objBean.setTxtInterest(rs.getString("interest_cover"));
                        objBean.setTxtGrossProfit(rs.getString("gross_profit"));
                        objBean.setTxtDepriciation(rs.getString("depriciation"));
                        objBean.setTxtTax(rs.getString("tax"));
                        objBean.setTxtPat(rs.getString("pat"));
                        objBean.setTxtEquity(rs.getString("equity"));
                        objBean.setTxtOPM(rs.getString("OPM"));
                        objBean.setTxtGPM(rs.getString("GPM"));
                        objBean.setTxtNPM(rs.getString("NPM"));
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("in getQuaterlyResultPre" + e);
        } finally {
            try {

                rs.close();
                stmt.close();
                stmt1.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return objBean;
    }

    public String addCompany(CreateCompanyBean objBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("insert into company(company_name,company_code,industry_name,company_status) values(?,?,?,?)");
            pstmt.setString(1, objBean.getTxtCompanyName());
            pstmt.setString(2, objBean.getTxtCompanyCode());
            pstmt.setString(3, objBean.getTxtIndustryName());
            pstmt.setInt(4, 1);
            int i = pstmt.executeUpdate();
            System.out.println(i);
            if (i > 0) {
                int id = 0;
                String m = "select max(company_id) from company";

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(m);
                while (rs.next()) {
                    id = rs.getInt(1);
                }
                String q3 = "insert into companysnapshot(company_id) values(" + id + ")";
                String q4 = "insert into companyfundamentals(company_id) values(" + id + ")";

                int l = stmt.executeUpdate(q3);
                int r = stmt.executeUpdate(q4);

                if (l > 0 && r > 0) {
                    result = "inserted";
                }

            }
        } catch (Exception e) {
            System.out.println("In addCompany" + e);
            return result;
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return result;
    }

    public String add(int seccode, String exabbr) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String result = "failed";

        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            int id = 0;
            String m = "select max(company_id) from company";


            rs = stmt.executeQuery(m);
            while (rs.next()) {
                id = rs.getInt(1);
            }
            String q = "insert into companyexchange(company_id,exchange_security_code,exchange_abbr) values(" + id + "," + seccode + ",'" + exabbr + "')";
            int i = stmt.executeUpdate(q);
            if (i > 0) {
                result = "inserted";
            }
        } catch (Exception e) {
            System.out.println("In add" + e);
            return result;

        } finally {
            try {
                con.close();
                stmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);

            }
        }


        return result;



    }

    public String addExchange(int seccode, String exabbr, int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String result = "failed";

        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();

            String q = "insert into companyexchange(company_id,exchange_security_code,exchange_abbr) values(" + cid + "," + seccode + ",'" + exabbr + "')";
            int i = stmt.executeUpdate(q);
            if (i > 0) {
                result = "Updated";
            }
        } catch (Exception e) {
            System.out.println("In add" + e);
            return result;

        } finally {
            try {
                con.close();
                stmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);

            }
        }


        return result;



    }

    public ArrayList getCompanyExchange(int cid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        CompanyExchangeBean objBean = null;
        try {

            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select * from companyexchange where company_id=" + cid + "";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new CompanyExchangeBean();
                objBean.setCompanyexchangeid(rs.getString("company_exchange_id"));
                objBean.setExchangeabbr(rs.getString("exchange_abbr"));
                objBean.setExchangesecuritycode(rs.getString("exchange_security_code"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("in getCompanyExchange" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }
        return al;
    }

    public UpdateCompanyBean getSharePrice(int exid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        UpdateCompanyBean objBean = new UpdateCompanyBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select c.company_name,c.company_code,ce.company_exchange_id,date,open_price,high_price," +
                    "low_price,close_price,number_of_trades,traded_quantity," +
                    "traded_value from companyexchange ce,companyshare cs,company c " +
                    "where ce.company_exchange_id=cs.company_exchange_id and c.company_id=ce.company_id and " +
                    "ce.company_exchange_id=" + exid + "";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean.setCompanyname(rs.getString("company_name"));
                objBean.setCompanycode(rs.getString("company_code"));
                objBean.setExchangeid(String.valueOf(rs.getInt("company_exchange_id")));
                objBean.setTxtDate(rs.getString("date"));
                objBean.setTxtOpenPrice0(String.valueOf(rs.getInt("open_price")));
                objBean.setTxtHighPrice0(String.valueOf(rs.getInt("high_price")));
                objBean.setTxtLowPrice0(String.valueOf(rs.getInt("low_price")));
                objBean.setTxtClosePrice0(String.valueOf(rs.getInt("close_price")));
                objBean.setTxtTrades0(String.valueOf(rs.getInt("number_of_trades")));
                objBean.setTxtTradedQuantity0(String.valueOf(rs.getInt("traded_quantity")));
                objBean.setTxtTradedValue0(String.valueOf(rs.getString("traded_value")));

            }
        } catch (Exception e) {
            System.out.println("in getSharePrice" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
            }
        }

        return objBean;

    }

    public ArrayList get52Weekdetail(int exid) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        UpdateCompanyBean objBean = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());


            int intCurYear = Integer.parseInt(date.substring(0, 4));
            int intCurMth = Integer.parseInt(date.substring(5, 7));
            int intLastYear = intCurYear - 1;
            int intLastMth = intCurMth - 1;
            String strCurDate = date.substring(0, 7);
            String strLastDate = "";
            if (intLastMth < 10) {
                strLastDate = String.valueOf(intLastYear) + "-0" + String.valueOf(intLastMth);
            } else {
                strLastDate = String.valueOf(intLastYear) + "-" + String.valueOf(intLastMth);
            }
            System.out.println(strCurDate + "  " + strLastDate);
            String q = "select max(high_price) as high_price,min(low_price) as low_price from companyshare where company_exchange_id=" + exid + " and substring(date,1,7) between '" + strLastDate + "'and '" + strCurDate + "'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new UpdateCompanyBean();
                objBean.setTxt52WeekHigh0(String.valueOf(rs.getInt("high_price")));
                objBean.setTxt52WeekLow0(String.valueOf(rs.getInt("low_price")));
                al.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("in set52Weekdetail : " + e);
        }
        return al;
    }

    public String updateCompany(UpdateCompanyInformationBean objBean, int cid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update company set company_name=?,company_code=?,industry_name=? where company_id=" + cid + "");
            pstmt.setString(1, objBean.getTxtCompanyName());
            pstmt.setString(2, objBean.getTxtCompanyCode());
            pstmt.setString(3, objBean.getTxtIndustryName());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.println("In updateCompany" + e);
        } finally {
            try {
                pstmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
                return result;
            }
        }
        return result;
    }

    public String updateCompInfo(UpdateCompanyInformationBean objBean, int cid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();


            if (objBean.getDdlStatus0() != null) {
                pstmt = con.prepareStatement("update companyexchange set exchange_security_code=?,company_exchange_status=? where company_exchange_id=?");
                pstmt.setString(1, objBean.getTxtSecurityCode0());

                pstmt.setString(2, objBean.getDdlStatus0());
                pstmt.setString(3, objBean.getTxtExchangeid0());

                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "updated";
                }
            }  if (objBean.getDdlStatus1() != null) {
                pstmt = con.prepareStatement("update companyexchange set exchange_security_code=?,company_exchange_status=? where company_exchange_id=?");
                pstmt.setString(1, objBean.getTxtSecurityCode1());
                pstmt.setString(2, objBean.getDdlStatus1());
                pstmt.setString(3, objBean.getTxtExchangeid1());

                System.out.println(objBean.getTxtSecurityCode1());
                System.out.println(objBean.getDdlExchangeType());
                System.out.println(objBean.getDdlStatus1());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "updated";
                }

            }


        } catch (Exception e) {
            System.out.println("In updateCompInfo" + e);
        } finally {
            try {
                pstmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
                return result;
            }
        }
        return result;
    }

    public String udpateCompSnapshot(UpdateCompanySnapshotBean objBean, int cid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update companysnapshot set registered_office=?,telephone_number=?,fax_number=?,website=?,chief_executive_name=?,secretary_name=?,face_value=?,market_lot=?,business_group_name=?,incorporation_date=?,registrar_of_company=?,listed_on=?  where company_id=" + cid + "");
            pstmt.setString(1, objBean.getTaRegisteredOffice());
            pstmt.setString(2, objBean.getTxtPhoneNumber());
            pstmt.setString(3, objBean.getTxtFax());
            pstmt.setString(4, objBean.getTxtWebsite());
            pstmt.setString(5, objBean.getTxtChiefExecutiveName());
            pstmt.setString(6, objBean.getTxtSecretaryName());
            pstmt.setString(7, objBean.getTxtFaceValue());
            pstmt.setString(8, objBean.getTxtMarketLot());
            pstmt.setString(9, objBean.getTxtBusinessGroupName());
            pstmt.setString(10, objBean.getTxtIncorporationDate());
            pstmt.setString(11, objBean.getTaRegistrarOfCompany());
            pstmt.setString(12, objBean.getTxtListedOn());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.println("In updateRecord" + e);
            return result;
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return result;
    }

    public String updateCompFundamentals(UpdateFundamentalsBean objBean, int cid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update companyfundamentals set market_capitalization=?,book_value=?,debt_equity=?,P_E=?,Dividend_Yield=?,EPS=?,return_on_net_worth=?,current_ratio=?,quick_ration=?,intrest_cover=? where company_id=" + cid + "");
            pstmt.setString(1, objBean.getTxtMarketCapitalization());
            pstmt.setString(2, objBean.getTxtBookValue());
            pstmt.setString(3, objBean.getTxtDebtEquity());
            pstmt.setString(4, objBean.getTxtPE());
            pstmt.setString(5, objBean.getTxtDividendYield());
            pstmt.setString(6, objBean.getTxtEPS());
            pstmt.setString(7, objBean.getTxtReturn());
            pstmt.setString(8, objBean.getTxtCurrentRatio());
            pstmt.setString(9, objBean.getTxtQuickRatio());
            pstmt.setString(10, objBean.getTxtInterestCover());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.println("In updateCompFundamentals" + e);
            return result;
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
            return result;
        }
    }

    public String updateCapStruct(UpdateCapitalStructureBean objBean, int cid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select company_capital_structure_id,count(company_capital_structure_id) from companycapitalstructure where company_id=" + cid + " and to_year='" + objBean.getTxtToYear() + "' group by company_id");
            int count = 0;
            while (rs.next()) {
                int id = rs.getInt(1);
                count = rs.getInt(2);
                if (count > 0) {
                    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    String curyear = date.substring(0, 4);
                    String toyear = objBean.getTxtToYear();
                    if (curyear.equals(toyear)) {
                        pstmt = con.prepareStatement("update companycapitalstructure set from_year=?,to_year=?,class_of_share=?,authorised_capital=?,issued_capital=?,paid_up_shares=?,face_value=?,paid_up_capital=? where company_id=" + cid + "");
                        pstmt.setString(1, objBean.getDdlFromYear());
                        pstmt.setString(2, objBean.getTxtToYear());
                        pstmt.setString(3, objBean.getTxtClassOfShare());
                        pstmt.setString(4, objBean.getTxtAuthorisedCapital());
                        pstmt.setString(5, objBean.getTxtIssuedCapital());
                        pstmt.setString(6, objBean.getTxtPaidUpShares());
                        pstmt.setString(7, objBean.getTxtFaceValue());
                        pstmt.setString(8, objBean.getTxtPaidUpCapital());
                        int i = pstmt.executeUpdate();
                        if (i > 0) {
                            result = "updated";
                        }

                    } else {
                        result = "can not update for this year";
                    }
                }
            }
            if (count == 0) {
                pstmt = con.prepareStatement("insert into companycapitalstructure(from_year,to_year,class_of_share,authorised_capital,issued_capital,paid_up_shares,face_value,paid_up_capital,company_id) values(?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, objBean.getDdlFromYear());
                pstmt.setString(2, objBean.getTxtToYear());
                pstmt.setString(3, objBean.getTxtClassOfShare());
                pstmt.setString(4, objBean.getTxtAuthorisedCapital());
                pstmt.setString(5, objBean.getTxtIssuedCapital());
                pstmt.setString(6, objBean.getTxtPaidUpShares());
                pstmt.setString(7, objBean.getTxtFaceValue());
                pstmt.setString(8, objBean.getTxtPaidUpCapital());
                pstmt.setInt(9, cid);
                int i = pstmt.executeUpdate();
                System.out.println(pstmt.toString());
                if (i > 0) {
                    result = "updated";
                }

            }
        } catch (Exception e) {
            System.out.println("In updateRecord" + e);
            return result;
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return result;
    }

    public String updateQuaterlyResult(UpdateQuarterlyResultBean objBean, int cid) {
        String result = "Failed";
        Connection con = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;
        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String curYear = date.substring(0, 4);
        String curMonth = date.substring(5, 7);
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select company_quaterly_result_id,count(company_quaterly_result_id) from company_quaterly_result where company_id=" + cid + " and substring(quaterly_result_date,1,7)='" + objBean.getDdlYear() + "-" + objBean.getDdlMonth() + "' group by company_quaterly_result_id");
            int count = 0;
            while (rs.next()) {
                int id = rs.getInt(1);
                count = rs.getInt(2);
                if (count > 0) {
                    if (curYear.equals(objBean.getDdlYear()) && curMonth.equals(objBean.getDdlMonth())) {
                        pstmt = con.prepareStatement("update company_quaterly_result set quaterly_result_date=?,sales_income=?,expenditure=?,interest_cover=?,gross_profit=?,depriciation=?,tax=?,pat=?,equity=?,OPM=?,GPM=?,NPM=?   where company_quaterly_result_id=?");
                        pstmt.setString(1, objBean.getDdlYear() + "-" + objBean.getDdlMonth());
                        pstmt.setString(2, objBean.getTxtSalesIncome());
                        pstmt.setString(3, objBean.getTxtExpenditure());
                        pstmt.setString(4, objBean.getTxtInterest());
                        pstmt.setString(5, objBean.getTxtGrossProfit());
                        pstmt.setString(6, objBean.getTxtDepriciation());
                        pstmt.setString(7, objBean.getTxtTax());
                        pstmt.setString(8, objBean.getTxtPat());
                        pstmt.setString(9, objBean.getTxtEquity());
                        pstmt.setString(10, objBean.getTxtOPM());
                        pstmt.setString(11, objBean.getTxtGPM());
                        pstmt.setString(12, objBean.getTxtNPM());
                        pstmt.setInt(13, id);
                        System.out.println("1" + pstmt.toString());
                        int i = pstmt.executeUpdate();
                        if (i > 0) {
                            result = "Updated";

                        }
                    }
                }
            }
            if (count == 0) {
                pstmt = con.prepareStatement("insert into company_quaterly_result(quaterly_result_date,sales_income,expenditure,interest_cover,gross_profit,depriciation,tax,pat,equity,OPM,GPM,NPM,company_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, objBean.getDdlYear() + "-" + objBean.getDdlMonth());
                pstmt.setString(2, objBean.getTxtSalesIncome());
                pstmt.setString(3, objBean.getTxtExpenditure());
                pstmt.setString(4, objBean.getTxtInterest());
                pstmt.setString(5, objBean.getTxtGrossProfit());
                pstmt.setString(6, objBean.getTxtDepriciation());
                pstmt.setString(7, objBean.getTxtTax());
                pstmt.setString(8, objBean.getTxtPat());
                pstmt.setString(9, objBean.getTxtEquity());
                pstmt.setString(10, objBean.getTxtOPM());
                pstmt.setString(11, objBean.getTxtGPM());
                pstmt.setString(12, objBean.getTxtNPM());
                pstmt.setInt(13, cid);
                System.out.println("2" + pstmt.toString());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "Updated";

                }
            }


        } catch (Exception e) {
            System.out.println("In Update company Quaterly Result" + e);
        }


        return result;
    }

    public ArrayList getSearch(String cname) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        CompanyListingBean objBean = null;
        ArrayList al = new ArrayList();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select company_id, company_name,company_code from company where company_name like '%" + cname + "%'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new CompanyListingBean();
                objBean.setCompanyid(String.valueOf(rs.getInt("company_id")));
                objBean.setCompanyName(rs.getString("company_name"));
                objBean.setCompanyCode(rs.getString("company_code"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("In getSearch" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return al;
    }

    public ArrayList getRecord(String sort) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        CompanyListingBean objBean = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select company_id,company_name,company_code from company where company_name like '" + sort + "%'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new CompanyListingBean();
                // System.out.println("cname"+rs.getString("company_name"));
                objBean.setCompanyid(String.valueOf(rs.getInt("company_id")));
                objBean.setCompanyName(rs.getString("company_name"));
                objBean.setCompanyCode(rs.getString("company_code"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("In getRecord" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }

        return al;

    }

    public String updateCompanySharePrice(UpdateSharePriceBean objBean) {
        String result = "Failed";
        Connection con = null;
        PreparedStatement pstmt = null;
        System.out.println("objBean.getTxtCompanyExchangeId0() " + objBean.getTxtCompanyExchangeId0());
        System.out.println("objBean.getTxtCompanyExchangeId1()  " + objBean.getTxtCompanyExchangeId1());
        try {
            con = ConnectDB.connect();
            System.out.println(objBean.getTxtCompanyExchangeId0() != null);
            if (objBean.getTxtCompanyExchangeId0() != null) {
                pstmt = con.prepareStatement("insert into companyshare(company_exchange_id,date,close_price,open_price,high_price,low_price,traded_quantity,traded_value,number_of_trades) values(?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, Integer.parseInt(objBean.getTxtCompanyExchangeId0()));
                pstmt.setString(2, objBean.getTxtDate());
                pstmt.setString(3, objBean.getTxtClosePrice0());

                pstmt.setString(4, objBean.getTxtOpenPrice0());

                pstmt.setString(5, objBean.getTxtHighPrice0());
                pstmt.setString(6, objBean.getTxtLowPrice0());
                pstmt.setString(7, objBean.getTxtTradedQuantity0());
                pstmt.setString(8, objBean.getTxtTradedValue0());

                pstmt.setString(9, objBean.getTxtTrades0());

                System.out.println("psmt  " + pstmt.toString());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "Updated";

                }
            }
            System.out.println(objBean.getTxtCompanyExchangeId1() != null);
            if (objBean.getTxtCompanyExchangeId1() != null) {
                 System.out.println("in if 1 ");
                pstmt = con.prepareStatement("insert into companyshare(company_exchange_id,date,close_price,open_price,high_price,low_price,traded_quantity,traded_value,number_of_trades) values(?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, Integer.parseInt(objBean.getTxtCompanyExchangeId1()));
                pstmt.setString(2, objBean.getTxtDate());
                pstmt.setString(3, objBean.getTxtClosePrice1());
                pstmt.setString(4, objBean.getTxtOpenPrice1());
                pstmt.setString(5, objBean.getTxtHighPrice1());
                pstmt.setString(6, objBean.getTxtLowPrice1());
                pstmt.setString(7, objBean.getTxtTradedQuantity1());
                pstmt.setString(8, objBean.getTxtTradedValue1());
                pstmt.setString(9, objBean.getTxtTrades1());
                System.out.println("psmt  " + pstmt.toString());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "Updated";
                }
            }
        } catch (Exception e) {
            System.out.println("In Update company SharePrice" + e);
        }
        return result;
    }
}
