<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myPhonesNew.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <link href="CSS/style.css" rel="stylesheet" />
    <title>בני ציון-ספר טלפונים</title>
</head>
<body dir="rtl">
  

    
    <form id="form1" runat="server">
        <header>
            <table class="tblHeader">
                <tr>
                    <td class="tdHeaderRight">ספר טלפונים</td>
                    <td class="tdHeaderLeft">
                        <img src="images/373017_614127035266733_1433681647_q.jpg" style="border: 0; width:80px; height:80px;" />

                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 90%; ">

                        <asp:TextBox ID="txtSearchValue" runat="server" CssClass="txtBox" placeHolder="שם פרטי/שם משפחה/מחלקה"></asp:TextBox></td>

                    <td style="width: 10%">
                        <asp:ImageButton ID="btnFind"  CssClass="imgFind" runat="server"   ImageAlign="Left" ImageUrl="~/images/search.png" OnClick="btnFind_Click" />


                    </td>
                </tr>


            </table>
        </header>
        <table class="tblNoResult"    id="msgTbl" runat="server">
            <tr>
                <td>
                    <asp:Label CssClass="errLbl" ID="lblNoResults" runat="server" Text=""></asp:Label>

                </td>

            </tr>
        </table>

        <br />

     
        <table style="width: 100%; border: 1px solid black;">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td style="width: 100%; padding-right: 20px; border: 0;background:beige;">

                            <table class="tblResults">
                                <tr >
                                    <td>
                                        <asp:Label ID="lblName" CssClass="lblName" runat="server" Text='<%# Eval("name").ToString() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblFld1" CssClass="lblFld1" runat="server" Text='<%# Eval("fld1").ToString() %>'></asp:Label>
                                        <!--
                                          <a href="myDetails.aspx?myVal=<%# txtSearchValue.Text %>&myIndex=<%# myIndex.ToString() %>" style="color: black; text-decoration: none">
                                          
                                        </a>-->

                                    </td>
                                </tr>
                                <tr >
                                 

                                    <td style="text-align:left;padding-bottom: 10px;">

                                        <!-- Phone -->
                                       
                                        <asp:Label ID="lblFld3" CssClass="lblFld3" runat="server" Text=""></asp:Label>
                                         <asp:Image ID="img3" runat="server" ImageUrl="~/images/phone.png" Width="48" Height="48" />
                                        <br id="br3_1" runat="server" /><br  id="br3_2" runat="server" />
                                    
                                        <!-- CellPhone -->
                                        
                                        <asp:Label ID="lblFld4" CssClass="lblFld4" runat="server" Text="" ></asp:Label>
                                         <asp:Image ID="img4" runat="server" ImageUrl="~/images/cell.png" Width="48" Height="48" />
                                       

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
