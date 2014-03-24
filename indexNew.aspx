<%@ Page Language="C#" AutoEventWireup="true" CodeFile="indexNew.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
    <head>
        <meta charset="utf-8" />
        <title></title>
 
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
 
    <asp:TextBox runat="server" name="txtSearchValue" id="txtSearchValue"  placeholder="שם פרטי/שם משפחה/מחלקה" style="width: 100%;text-align: center"></asp:TextBox>
</td>
   <td>&nbsp;</td>
 <td style="text-align: left">
  <%--  <input type="button" runat="server" onclick="btnFind_Click"  id="btnFind" data-icon="search" data-iconpos="notext" value="" style="text-align: left;width: 100%">--%>
     <asp:Button ID="btnFind" runat="server" Text="" data-icon="search" data-iconpos="notext" style="text-align: left;width: 100%" OnClick="btnFind_click" />
 </td>
</tr>
    

</table>

            <table class="tblNoResult"    id="msgTbl" runat="server">
            <tr>
                <td>
                    <asp:Label CssClass="errLbl" ID="lblNoResults" runat="server" Text=""></asp:Label>

                </td>

            </tr>
 </table>


 <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate>

    <div runat="server" data-role="collapsible" data-collapsed="false" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-theme="b">
        <h4 ><%# Eval("name").ToString() %></h4>
        <asp:HiddenField ID="lblName" runat="server" Value='<%# Eval("name").ToString() %>'/>
        <ul data-role="listview" data-icon="info" runat="server">
             <li>
                 <a href="#" runat="server" id="anchorFld1"><%# Eval("fld1").ToString() %></a>
                 <asp:HiddenField ID="lblFld1" runat="server" Value='<%# Eval("fld1").ToString() %>'/>
             </li>

                <li>
                    <a runat="server" style="width: 100%" href="#"  data-icon="phone"  data-iconpos="left" id="anchorFld3"></a>
                    <a runat="server" href="#" data-icon="edit" data-iconpos="notext" id="anchorFld3Edit"></a>
        
                </li>
            <li>
                <a runat="server" style="width: 100%" href="#" data-icon="phone"  data-iconpos="left" id="anchorFld4"></a><a href="mailto:1@2.com" data-icon="edit" data-iconpos="notext"></a>
    
            </li> 
        </ul>
    
    </div> <!--collapsible-->
</ItemTemplate>
 </asp:Repeater>   









<div  data-role="footer"  data-position="fixed">
   <hr>
    <div data-role="navbar">
        <ul>
            <li><a href="#top" data-icon="info" ></a></li>
            <li><a href="javascript:window.location.href='indexNew.aspx';" data-icon="refresh"></a></li>
            <li><a href="javascript:window.close();" data-icon="delete"></a></li>
        </ul>
    </div><!-- /navbar -->
</div><!-- /footer -->
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnPB %>" ProviderName="<%$ ConnectionStrings:ConnPB.ProviderName %>"  ></asp:SqlDataSource>
  
      </form>       
        </body>
</html>
