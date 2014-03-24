<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPhones.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title>בני ציון-ספר טלפונים</title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
        <table style="width: 100%;background-color:#3b5999;margin:auto;">
            <tr>
                <td style="padding-right:20px; text-align: right; width: 80%;text-decoration:underline;font-family:Arial;font-size:70px;background-color:#3b5999;color:white;font-weight:bold;">
              ספר טלפונים</td>
                <td style="text-align: left;background-color:#3b5999;">
                    <img src="images/373017_614127035266733_1433681647_q.jpg" style="border:0" width="80px" height="80px" />

                </td>
            </tr>
        </table>
    <br />
        <table style="width: 100%;">
            <tr >
                <td style="width: 70%;padding-right:20px;">
                   
                    <asp:TextBox ID="txtSearchValue" runat="server" CssClass="txtBox"></asp:TextBox></td>

                <td style="width: 30%">
                    <asp:Button ID="btnSearch" runat="server" Text="חפש" CssClass="btn" OnClick="btnSearch_Click" />


                </td>
            </tr>


        </table>
        <table style="width: 100%;text-align:center;margin:0" id="msgTbl" runat="server" visible="false">
            <tr>
                <td>                
                    <asp:Label CssClass="errLbl" id="lblNoResults" runat="server" Text=""></asp:Label>
            
                    </td>

          </tr>
            </table>

        <br />

        <table style="width: 100%; border: 1px solid black;">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td style="width: 100%; padding-right: 20px; border: 0; background-color: #eeeff4;">

                            <table style="width: 100%; border: 0; background-color: #e3e3e3; border: 1px solid black;padding:0;">
                                <tr style="height: 100px">
                                    <td>
                                        <a href="myDetails.aspx?myVal=<%# txtSearchValue.Text %>&myIndex=<%# myIndex.ToString() %>" style="color: black; text-decoration: none">
                                            <asp:Label ID="lblName" CssClass="lblName" runat="server" Text='<%# Eval("name").ToString() %>'></asp:Label>
                                        </a>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom:30px;">
                                        <asp:Label ID="lblFld1" CssClass="lblFld1" runat="server" Text='<%# Eval("fld1").ToString() %>'></asp:Label>

                                        <asp:Label ID="lblFld3" CssClass="lblFld3" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lblFld4" CssClass="lblFld4" runat="server" Text=""></asp:Label>



                                    </td>

                                </tr>

                            </table>
                        </td>
                    </tr>

                </ItemTemplate>


            </asp:Repeater>


        </table>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnPB %>" ProviderName="<%$ ConnectionStrings:ConnPB.ProviderName %>" SelectCommand="SELECT * FROM [tblFieldNames]" ></asp:SqlDataSource>
    </form>
</body>
</html>
