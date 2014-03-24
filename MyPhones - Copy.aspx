<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPhones - Copy.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title>בני ציון-ספר טלפונים</title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <h1 style="width:100%;text-align:center;text-decoration:underline;font-family:Tahoma;font-size:70px;">ספר טלפונים</h1>
        <table style="width: 100%">
            <tr >
                <td style="width: 70%">
                   
                    <asp:TextBox ID="txtSearchValue" runat="server" CssClass="txtBox"></asp:TextBox></td>

                <td style="width: 30%">
                    <asp:Button ID="btnSearch" runat="server" Text="חפש" CssClass="btn" OnClick="btnSearch_Click" />


                </td>
            </tr>


        </table>
        <br />
        <table style="width: 100%;text-align:center" id="msgTbl" runat="server" visible="false">
            <tr>
                <td>                
                    <asp:Label CssClass="errLbl" id="lblNoResults" runat="server" Text=""></asp:Label>
            
                    </td>

          </tr>
            </table>

        <br />

        <table style="width: 100%;"">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate >
                    <tr>
                        <td style="width:100%">
                         <a href="myDetails.aspx?myVal=<%# txtSearchValue.Text %>&myIndex=<%# myIndex.ToString() %>" style="color:black;text-decoration:none">
                     <div class="txtBoxName" runat="server">
                   <%# Eval("name").ToString() %>
                    </div>

                    
                    <div class="txtBoxFld1" runat="server">
                   <%# Eval("fld1").ToString() %>
               </div>
                     </a>
                                            </td>
                    </tr>

                </ItemTemplate>
                

            </asp:Repeater>


        </table>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnPB %>" ProviderName="<%$ ConnectionStrings:ConnPB.ProviderName %>" SelectCommand="SELECT * FROM [tblFieldNames]" ></asp:SqlDataSource>
    </form>
</body>
</html>
