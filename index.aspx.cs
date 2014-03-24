using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using Microsoft.VisualBasic;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    static DataTable tblData;
    public static int myIndex;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         
            tblData = new DataTable();
            tblData.Columns.Add("name", typeof(string));
            tblData.Columns.Add("fld1", typeof(string));
            tblData.Columns.Add("fld2", typeof(string));
            tblData.Columns.Add("fld3", typeof(string));
            tblData.Columns.Add("fld4", typeof(string));
            tblData.Columns.Add("concatNameF1F2", typeof(string));
          
        }

    }

   
     
     protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
     {
       
         long myFld3;
         long myFld4;

       //  HtmlGenericControl lblName = (HtmlGenericControl)e.Item.FindControl("lblName");
         HiddenField lblName = (HiddenField)e.Item.FindControl("lblName");
         HiddenField lblFld1 = (HiddenField)e.Item.FindControl("lblFld1");
   

         HtmlAnchor anch3 = (HtmlAnchor)e.Item.FindControl("anchorFld3");
         anch3.Target = "_blank";
         HtmlAnchor a3 = (HtmlAnchor)e.Item.FindControl("anchorFld3Edit");
         HtmlGenericControl liFld3 = (HtmlGenericControl)e.Item.FindControl("liFld3");


         HtmlAnchor anch4 = (HtmlAnchor)e.Item.FindControl("anchorFld4");
         anch3.Target = "_blank";
         HtmlAnchor a4 = (HtmlAnchor)e.Item.FindControl("anchorFld4Edit");
         HtmlGenericControl liFld4 = (HtmlGenericControl)e.Item.FindControl("liFld4");

         if (long.TryParse(tblData.Rows[myIndex][3].ToString(), out myFld3))
         {
             if (myFld3.ToString() != "")
             {
                 anch3.Visible = true;
                 a3.Visible = true;
                 anch3.HRef = "Tel:+9724835:" + myFld3.ToString();
                 anch3.InnerText = myFld3.ToString();
                 a3.HRef = "mailto:kobi.shamir@b-zion.org.il?subject=בקשה לתיקון מספר טלפון שגוי " + myFld3.ToString() + "&body=שם העובד/ת: " + lblName.Value + "%0A" + "מחלקה: " + lblFld1.Value + "%0A" + "מספר טלפון מתוקן: ";
             }

             else
             {
                 liFld3.Visible = false;
             
               
             }
         }

         else
         {
             liFld3.Visible = false;

         }


         if (long.TryParse(tblData.Rows[myIndex][4].ToString(), out myFld4))
         {
             if (myFld4.ToString() != "")
             {
                 liFld4.Visible = true;
                 anch4.HRef = "Tel:+972:" + myFld4.ToString();
                 anch4.InnerText = tblData.Rows[myIndex][4].ToString().Trim();
                 a4.HRef = "mailto:kobi.shamir@b-zion.org.il?subject=בקשה לתיקון מספר טלפון שגוי " + myFld4.ToString() + "&body=שם העובד/ת: " + lblName.Value + "%0A" + "מחלקה: " + lblFld1.Value + "%0A" + "מספר טלפון מתוקן: ";
             }

             else
             {
                 liFld4.Visible = false;

             }
         }

         else
         {
             liFld4.Visible = false;

         }

        

         myIndex++;
     }

     



     protected void btnFind_click(object sender, EventArgs e)
     {
   

         string srchVal = txtSearchValue.Text.Trim();
        
         srchVal = srchVal.Replace("'", "");
         srchVal = srchVal.Replace("%", "");
         srchVal = srchVal.Replace("\"", "");

         if (srchVal == "") return;
         OleDbConnection conn = new OleDbConnection(SqlDataSource1.ConnectionString);
         OleDbCommand cmd = new OleDbCommand("select top 30 contactName,fld1,fld2,fld3,fld4 from tblPhones where orgID=1 and (contactName like '%" + srchVal + "%' OR fld1 like '%" + srchVal + "%') order by contactName", conn);
         cmd.CommandType = CommandType.Text;
         OleDbDataReader dr;

         //initialize data table
         tblData.Clear();
         myIndex = 0;
         conn.Open();
         dr = cmd.ExecuteReader();

         while (dr.Read())
         {
             tblData.Rows.Add(dr["contactName"].ToString(), dr["fld1"].ToString(), dr["fld2"].ToString(), dr["fld3"].ToString(), dr["fld4"].ToString(), dr["contactName"].ToString() + "\r\n" + dr["fld1"].ToString() + "\r\n" + dr["fld2"].ToString());
         }

         if (dr.HasRows)
         {


             msgTbl.Visible = false;

             Repeater1.DataSource = tblData;
             Repeater1.DataBind();

         }

         else
         {



             lblNoResults.Value = "לא נמצאו תוצאות עבור: " + srchVal;
             msgTbl.Visible = true;
             Repeater1.DataSource = null;
             Repeater1.DataBind();

         }


         conn.Close();
     }
}