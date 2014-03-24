<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
    <head>
        <meta charset="utf-8" />
        <meta name="mobile-web-app-capable" content="yes">
         <title>בני ציון-ספר טלפונים</title>
        <link rel="shortcut icon"  sizes="196x196" href="images/favicon.ico" type="image/x-icon" />
 
       <!--<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css" />--> 
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>


        <link href="CSS/rtl.jquery.mobile-1.4.0.css" rel="stylesheet" />

    <!--  
    
         <link rel="stylesheet" href="rtl.jquery.mobile-1.4.0.css" />
         <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css" />
        <script src="rtl.jquery.mobile-1.4.0.js"></script>
          <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        -->
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">

        <script>

            function refresh() {
                var sURL = unescape("http://(some web page)/");
                window.location.replace(sURL);
            }
    

            function close_window() {
                if (confirm("האם לצאת?")) {
                    var newWindow = window.open('', '_self', ''); //open the current window
                    newWindow.close();
                }
            }

            function backToTop() {

                $('html, body').animate({ scrollTop: 0 }, 800);
            }


           
        </script>
    </head>

    <body dir="rtl" style="text-align: right">
         <form id="form1" runat="server">
         <header data-role="header"  >
           
             <table style="width: 100%">
             <tr>
             <td style="text-align: center;width: 100%"><h3 >ספר טלפונים</h3></td>
                 <td style="text-align: left"><img   src="images/bnz_logo.jpg" alt="logo" data-inline="true" width="48" height="48"/></td>
             </tr>
             </table>
         </header>

       
     
              <table style="width: 100%">
<tr>
<td style="width: 90%;text-align: right">
 
    <asp:TextBox runat="server" CssClass="txtsrch" name="txtSearchValue" id="txtSearchValue"  placeholder="שם פרטי/שם משפחה/מחלקה" style="width: 100%;text-align: center"></asp:TextBox>
</td>
   <td>&nbsp;</td>
 <td style="text-align: left">
  <%--  <input type="button" runat="server" onclick="btnFind_Click"  id="btnFind" data-icon="search" data-iconpos="notext" value="" style="text-align: left;width: 100%">--%>
     <asp:Button ID="btnFind" runat="server" Text="" data-icon="search" data-iconpos="notext" style="text-align: left;width: 100%" OnClick="btnFind_click" />
 </td>
</tr>
    

</table>

          
           <%--         <asp:Label  ID="lblNoResults" runat="server" Text=""></asp:Label>--%>
                <%--    <input runat="server" type="text" disabled="disabled" name="lblNoResults" id="lblNoResults" value="">--%>
                   <div runat="server"  data-role="fieldcontain" id="msgTbl" visible="false" style="text-align:center">
       
        <input runat="server" type="text"  value="" name="lblNoResults" id="lblNoResults"  data-theme="b"/>
    </div>

                       <%--<input runat="server" type="button" data-theme="b" value=""  name="lblNoResults" id="lblNoResults" data-icon="error" data-iconpos="right">--%>



 <asp:Repeater ID="Repeater1"   runat="server" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate>

    <div runat="server" class="rep" data-role="collapsible" data-collapsed="false" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-theme="b">
        <h4 ><%# Eval("name").ToString() %></h4>
        <asp:HiddenField ID="lblName" runat="server" Value='<%# Eval("name").ToString() %>'/>
      
          <ul data-role="listview" data-icon="info" runat="server">
             <li  runat="server" >
                 <a href="#"  runat="server" id="anchorFld1"><%# Eval("fld1").ToString() %></a>
                 <asp:HiddenField ID="lblFld1" runat="server" Value='<%# Eval("fld1").ToString() %>'/>
             </li>

                <li id="liFld3" runat="server" >
                    <a runat="server" style="width: 100%" href="#"  data-icon="phone"  data-iconpos="left" id="anchorFld3"></a>
                    <a runat="server" href="#" data-icon="edit" data-iconpos="notext" id="anchorFld3Edit"></a>
        
                </li>
            <li id="liFld4" runat="server">
                <a runat="server" style="width: 100%" href="#" data-icon="phone"  data-iconpos="left" id="anchorFld4"></a>
                <a  runat="server" href="#" data-icon="edit" data-iconpos="notext" id="anchorFld4Edit"></a>
    
            </li> 
        </ul>
    
    </div> <!--collapsible-->
</ItemTemplate>
 </asp:Repeater>   

<script>
    function resetForm() {
    
        $('.rep').css('display', 'none');
        $('.txtsrch').val('');
        
         $('#' + '<%= txtSearchValue.ClientID %>').focus();
      
      
    }

</script>

<div  data-role="footer"  data-position="fixed" data-theme="f">
   <hr>
    <div data-role="navbar">
        <ul>
            <li><a href="javascript: backToTop();" data-icon="arrow-u" ></a></li>
            <li><a href="javascript:resetForm();" data-icon="refresh"></a></li>
            <li><a href="#" onclick="close_window();return false;" data-icon="delete"></a></li>
     
        </ul>
    </div><!-- /navbar -->
</div><!-- /footer -->
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnPB %>" ProviderName="<%$ ConnectionStrings:ConnPB.ProviderName %>"  ></asp:SqlDataSource>
  
      </form>       
        </body>
</html>
