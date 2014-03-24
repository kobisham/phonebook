<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myDetails.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <h1 style="width:100%;text-align:center;text-decoration:underline;font-family:Tahoma;font-size:70px;">ספר טלפונים</h1>
        <table style="width: 100%;visibility:hidden" >
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
        <table style="width: 100%;" id="resultTbl" runat="server" visible="false">
            <tr>
                <th style="width: 100%">
                    שם
                    
                    </th>
                </tr>
            <tr>

                <td style="width: 100%">
                    <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" ReadOnly="True"></asp:TextBox></td>
           </tr>

              <tr>
                <th style="width: 100%">
                    <asp:Label ID="lblFld1" runat="server" Text="תאור1:" ></asp:Label>
                    </th>
                  </tr>
            <tr>
                <td style="width: 100%">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtBox" ReadOnly="True"></asp:TextBox></td>
           </tr>

            <tr>
                <th style="width: 100%">
                    <asp:Label ID="lblFld2" runat="server" Text="תאור2:" ></asp:Label>
                    </th>
                </tr>
            <tr>
                <td style="width: 100%">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtBox" ReadOnly="True"></asp:TextBox></td>
           </tr>

            <tr>
                <th style="width: 100%">
                    <asp:Label  ID="lblFld3" runat="server" Text="טלפון1:" ></asp:Label>
                    </th>
                </tr>
            <tr>
                <td style="width: 100%;height:100px;">
                    
                    <asp:Label CssClass="lblData" ID="lbl3" runat="server" Text=""></asp:Label> 
                  





                </td>
           </tr>
             <tr>
                <th style="width: 100%">
                    <asp:Label ID="lblFld4" runat="server" Text="טלפון2:" ></asp:Label>
                    </th>
                 </tr>
            <tr>
                <td style="width: 100%;height:100px">
                    
                    <asp:Label CssClass="lblData" ID="lbl4" runat="server" Text=""></asp:Label> 


                </td>
           </tr>
            </table>

        <br />
        <table style="width: 100%;" id="navigationTbl" runat="server" visible="false">
            <tr>
                <td style="text-align:center;height:100px;">
                  
                    
                    <input style="width:100%;height:100%;font-family:Tahoma;font-size:50px;" id="btnBack" type="button" value="חזור" onclick="history.back()" />  
                </td>
    
            </tr>
        </table>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnPB %>" ProviderName="<%$ ConnectionStrings:ConnPB.ProviderName %>" SelectCommand="SELECT * FROM [tblFieldNames]" ></asp:SqlDataSource>
    </form>
</body>
</html>
