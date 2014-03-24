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


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string srchVal = txtSearchValue.Text.Trim();
        string srchVal1 = txtSearchValue.Text.Trim().Substring(srchVal.IndexOf(" ")+1).Trim();
        Response.Write(srchVal1);
        string srchval2 = txtSearchValue.Text.Trim();
        string srchval3 = txtSearchValue.Text.Trim();

        if (srchVal=="") return;
        OleDbConnection conn = new OleDbConnection(SqlDataSource1.ConnectionString);
        OleDbCommand cmd = new OleDbCommand("select contactName,fld1,fld2,fld3,fld4 from tblPhones where orgID=1 and (contactName like '%" + srchVal + "%' OR contactName like '%" + srchVal1 + "%' OR fld1 like '%" + srchVal + "%') order by contactName", conn);
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


           
            lblNoResults.Text = "לא נמצאו תוצאות עבור: " + srchVal;
            msgTbl.Visible = true;
            Repeater1.DataSource = null;
            Repeater1.DataBind();

        }

        
        conn.Close();

    }

    //protected void updateDataOnScreen()
    //{
    //    long myFld3;

    //    if (tblData.Rows.Count - 1 >= myIndex)
    //    {
    //        txtName.Text = tblData.Rows[myIndex][0].ToString();
    //        TextBox1.Text = tblData.Rows[myIndex][1].ToString();
    //        TextBox2.Text = tblData.Rows[myIndex][2].ToString();
    //        if (long.TryParse(tblData.Rows[myIndex][3].ToString(), out myFld3))
    //        {
    //            lbl3.Text = "<a href=\"Tel:+9724835:" + myFld3.ToString() + "\">" + tblData.Rows[myIndex][3].ToString() + "</a>";
               
    //        }
    //        else
    //        {
    //            lbl3.Text = "";

    //        }
    //            TextBox4.Text = tblData.Rows[myIndex][4].ToString();
    //        lblNumOfResults.Text = " רשומה " + (myIndex + 1).ToString() + " מתוך " + tblData.Rows.Count.ToString() + " רשומות";
    //    } 
      
    //}

    protected void btnNext_Click(object sender, EventArgs e)
    {
        myIndex++;
        if (myIndex == tblData.Rows.Count) 
            myIndex = tblData.Rows.Count-1;
        //else
            //updateDataOnScreen();

    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        myIndex--;
        if (myIndex == -1) 
            myIndex = 0;
        //else
        //updateDataOnScreen();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
       
        long myFld3;
        long myFld4;

        Label lblName = (Label)e.Item.FindControl("lblName");
        Label lblFld1 = (Label)e.Item.FindControl("lblFld1");

        Label lbl3 = (Label)e.Item.FindControl("lblFld3");
        Label lbl4 = (Label)e.Item.FindControl("lblFld4");
        
        Image img3=(Image)e.Item.FindControl("img3");
        Image img4 = (Image)e.Item.FindControl("img4");

        Image img3_err = (Image)e.Item.FindControl("img3_err");
        Image img4_err = (Image)e.Item.FindControl("img4_err");

        HtmlGenericControl br3_1 = (HtmlGenericControl)e.Item.FindControl("br3_1");
        HtmlGenericControl br3_2 = (HtmlGenericControl)e.Item.FindControl("br3_2");

        

        if (long.TryParse(tblData.Rows[myIndex][3].ToString(), out myFld3))
        {
            lbl3.Visible = true;
            lbl3.Text = "&nbsp;<a target=\"_blank\" href=\"Tel:+9724835:" + myFld3.ToString() + "\">" + tblData.Rows[myIndex][3].ToString().Trim() + "</a>";
            HtmlAnchor a3 = (HtmlAnchor)e.Item.FindControl("aFld3");
            a3.HRef = "mailto:kobi.shamir@b-zion.org.il?subject=בקשה לתיקון מספר טלפון שגוי " + myFld3.ToString() + "&body=שם העובד/ת: " + lblName.Text + "%0A" + "מחלקה: " + lblFld1.Text + "%0A" + "מספר טלפון מתוקן: ";
            img3.Visible = true;
            img3_err.Visible = true;
            br3_1.Visible = true;
            br3_2.Visible = true;
        }
        else
        {
            img3.Visible = false;
            img3_err.Visible = false;
            lbl3.Visible = false;
            br3_1.Visible = false;
            br3_2.Visible = false;
            

        }
        if (long.TryParse(tblData.Rows[myIndex][4].ToString(), out myFld4))
        {
            lbl4.Visible = true;
            lbl4.Text = "&nbsp;<a target=\"_blank\" href=\"Tel:+972:" + myFld4.ToString() + "\">" + Strings.Right(tblData.Rows[myIndex][4].ToString().Trim(), 40) + "</a>";
            HtmlAnchor a4 = (HtmlAnchor)e.Item.FindControl("aFld4");
            a4.HRef = "mailto:kobi.shamir@b-zion.org.il?subject=בקשה לתיקון מספר טלפון שגוי " + myFld4.ToString() + "&body=שם העובד/ת: " + lblName.Text + "%0A" + "מחלקה: " + lblFld1.Text + "%0A" + "מספר טלפון מתוקן: ";
            img4.Visible = true;
            img4_err.Visible = true;
        }
        else
        {
            img4.Visible = false;
            img4_err.Visible = false;
            lbl4.Visible = false;

        }

        myIndex++;
    }


    protected void btnFind_Click(object sender, ImageClickEventArgs e)
    {
 
        string srchVal = txtSearchValue.Text.Trim();
        //string srchVal1 = txtSearchValue.Text.Trim().Substring(srchVal.IndexOf(" ") + 1).Trim();
 

       
        srchVal = srchVal.Replace("'", "");
        srchVal = srchVal.Replace("%", "");
        srchVal = srchVal.Replace("\"", "");

        if (srchVal == "") return;
        OleDbConnection conn = new OleDbConnection(SqlDataSource1.ConnectionString);
        OleDbCommand cmd = new OleDbCommand("select top 50 contactName,fld1,fld2,fld3,fld4 from tblPhones where orgID=1 and (contactName like '%" + srchVal + "%' OR fld1 like '%" + srchVal + "%') order by contactName", conn);
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



            lblNoResults.Text = "לא נמצאו תוצאות עבור: " + srchVal;
            msgTbl.Visible = true;
            Repeater1.DataSource = null;
            Repeater1.DataBind();

        }


        conn.Close();

    }
}