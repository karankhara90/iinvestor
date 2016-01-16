<html>
<head>
  <title></title>
  <script type="text/javascript" language="javascript">
      function validate()
      {
      strDate=document.getElementById("txtDate").value
      strOpenPrice0=document.getElementById("txtOpenPrice0").value
      strOpenPrice1=document.getElementById("txtOpenPrice1").value
      strHighPrice0=document.getElementById("txtHighPrice0").value
      strHighPrice1=document.getElementById("txtHighPrice1").value
      strLowPrice0=document.getElementById("txtLowPrice0").value
      strLowPrice1=document.getElementById("txtLowPrice1").value
      strClosePrice0=document.getElementById("txtClosePrice0").value
      strClosePrice1=document.getElementById("txtClosePrice1").value
      strNoOfTrades0=document.getElementById("txtTrades0").value
      strNoOfTrades1=document.getElementById("txtTrades1").value
      strTradedQuantity0=document.getElementById("txtTradedQuantity0").value
      strTradedQuantity1=document.getElementById("txtTradedQuantity1").value
      strTradedValue0=document.getElementById("txtTradedValue0").value
      strTradedValue1=document.getElementById("txtTradedValue1").value
      str52WeeksHigh0=document.getElementById("txt52WeekHigh0").value
      str52WeeksHigh1=document.getElementById("txt52WeekHigh1").value
      str52WeeksLow0=document.getElementById("txt52WeekLow0").value
      str52WeeksLow1=document.getElementById("txt52WeekLow1").value
      if(isFutureDate(strDate))
          {
              alert("date specified is not correct")
              document.getElementById("txtDate").focus()
              return false
          }
          return true
          }
    </script>
</head>

<body>
    <form name="frmUpdateCompany" method="post" onsubmit="return validate()">
<table>
    <tr>
        <td><jsp:include page="UpdateLeftLinks.jsp"/></td>
    <td>


          <table>
                  <tbody><tr>

        </tr>
        <tr>
           <td colspan="2" height="10"></td>
        </tr>
        <tr>
            <td colspan="2" align="center" width="100%"><h4>Update Company Share Price</h4></td>
        </tr>

        <tr>
         <td>
         <table align="left" border="1" rules="none">
          <tbody><tr>
          <td align="left">
        <table>
        <tbody><tr>
          <td>Alpha net technologies</td>

	</tr>
	<tr>
        <td>Share Symbol:alphait</td>
        </tr></tbody></table></td></tr>

    <tr>

        <td>
            <table>
                <tbody><tr>
                    <td colspan="3"><hr></td>
                </tr>
                <tr>
                    <td></td>

                    <td align="center">BSE</td>

                    <td align="center">NSE</td>


                </tr>

                <tr>
                    <td colspan="3"><hr></td>
                </tr>

                <tr>
                    <td>Date</td>
                    <td colspan="2"><input name="txtDate" id="txtDate" readonly="readonly" type="text">
                    <a href="">DTP</a></td>
               </tr>
              <tr>
                  <td>Open Price</td>


                    <td><input name="txtOpenPrice0" id="txtOpenPrice0" type="text"></td>

                    <td><input name="txtOpenPrice1" id="txtOpenPrice1" type="text"></td>

              </tr>
              <tr>
                  <td>High Price</td>

                    <td><input name="txtHighPrice0" id="txtHighPrice0" type="text"></td>

                    <td><input name="txtHighPrice1" id="txtHighPrice1" type="text"></td>

              </tr>

              <tr>
                 <td>Low Price</td>

                    <td><input name="txtLowPrice0" id="txtLowPrice0" type="text"></td>

                    <td><input name="txtLowPrice1" id="txtLowPrice1" type="text"></td>

              </tr>
              <tr>
                  <td>Close Price</td>

                    <td><input name="txtClosePrice0" id="txtClosePrice0" type="text"></td>


                    <td><input name="txtClosePrice1" id="txtClosePrice1" type="text"></td>

              </tr>
              <tr>
                  <td>Number Of Trades</td>

                    <td><input name="txtTrades0" id="txtTrades0" type="text"></td>

                    <td><input name="txtTrades1" id="txtTrades1" type="text"></td>

              </tr>
              <tr>

                  <td>Traded Quantity</td>

                    <td><input name="txtTradedQuantity0" id="txtTradedQuantity0" type="text"></td>

                    <td><input name="txtTradedQuantity1" id="txtTradedQuantity1" type="text"></td>

              </tr>
              <tr>
                  <td>Traded Value</td>

                    <td><input name="txtTradedValue0" id="txtTradedValue0" type="text"></td>

                    <td><input name="txtTradedValue1" id="txtTradedValue1" type="text"></td>


              </tr>
              <tr>
                  <td>52 Week High</td>

                    <td><input name="txt52WeekHigh0" id="txt52WeekHigh0" readonly="readonly" value="" type="text"></td>

                    <td><input name="txt52WeekHigh1" id="txt52WeekHigh1" readonly="readonly" value="" type="text"></td>

              </tr>
              <tr>
                  <td>52 Week Low</td>


                    <td><input name="txt52WeekLow0" id="txt52WeekLow0" readonly="readonly" value="" type="text"></td>

                    <td><input name="txt52WeekLow1" id="txt52WeekLow1" readonly="readonly" value="" type="text"></td>

              </tr>
              <tr><td height="10"></td></tr>
              <tr>
                  <td colspan="3" align="center">
                      <input id="btnUpdate" name="btnUpdate" value="Update" type="submit"></td>
             </tr>
          </tbody></table>

          </td>
          </tr>
          </tbody></table>
        </td>
    </tr>
  </tbody>
  </table>
    </td>
    </tr>
    </table>
  </form>
</body>
</html>

