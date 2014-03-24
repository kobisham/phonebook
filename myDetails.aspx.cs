using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    static DataTable tblData;
    static int myIndex;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getFieldNames();
            tblData = new DataTable();
            tblData.Columns.Add("name", typeof(string));
            tblData.Columns.Add("fld1", typeof(string));
            tblData.Columns.Add("fld2", typeof(string));
            tblData.Columns.Add("fld3", typeof(string));
            tblData.Columns.Add("fld4", typeof(string));
            txtSearchValue.Text = Request["myVal"].ToString();
            myIndex = Int32.Parse(Request["myIndex"].ToString());
            btnSearch_Click(null, null);
            //updateDataOnScreen();
        }

    }

    private void getFieldNames()
    {
        OleDbConnection conn = new OleDbConnection(SqlDataSource1.ConnectionString);
        OleDbCommand cmd = new OleDbCommand("select fld1,fld2,fld3,fld4 from tblFieldNames where orgID=1", conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataReader dr;
        conn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblFld1.Text = dr["fld1"].ToString();
            lblFld2.Text = dr["fld2"].ToString();
            lblFld3.Text = dr["fld3"].ToString();
            lblFld4.Text = dr["fld4"].ToString();

        }
        conn.Close();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string srchVal = txtSearchValue.Text.Trim();
        if (srchVal=="") return;
        OleDbConnection conn = new OleDbConnection(SqlDataSource1.ConnectionString);
        OleDbCommand cmd = new OleDbCommand("select contactName,fld1,fld2,fld3,fld4 from tblPhones where orgID=1 and (contactName like '%" + srchVal + "%' OR fld1 like '%" + srchVal + "%') order by contactName", conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataReader dr;

        //initialize data table
        tblData.Clear();
        //myIndex = 0;


        conn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            tblData.Rows.Add(dr["contactName"].ToString(), dr["fld1"].ToString(), dr["fld2"].ToString(), dr["fld3"].ToString(), dr["fld4"].ToString());

        }

        if (dr.HasRows)
        { 
            resultTbl.Visible = true;
            navigationTbl.Visible = true;
            msgTbl.Visible = false;
            updateDataOnScreen();
       

        }

        else
        {

            resultTbl.Visible = false;
            navigationTbl.Visible = false;
            lblNoResults.Text = "לא נמצאו תוצאות עבור: " + srchVal;
            msgTbl.Visible = true;

        }

       
        conn.Close();

    }

    protected void updateDataOnScreen()
    {
        long myFld3;
        long myFld4;

        if (tblData.Rows.Count - 1 >= myIndex)
        {
            txtName.Text = tblData.Rows[myIndex][0].ToString();
            TextBox1.Text = tblData.Rows[myIndex][1].ToString();
            TextBox2.Text = tblData.Rows[myIndex][2].ToString();
            if (long.TryParse(tblData.Rows[myIndex][3].ToString(), out myFld3))
            {
                lbl3.Text = "<a href=\"Tel:+9724835:" + myFld3.ToString() + "\">" + tblData.Rows[myIndex][3].ToString() + "</a>";
               
            }
            else
            {
                lbl3.Text = "";

            }
            if (long.TryParse(tblData.Rows[myIndex][4].ToString(), out myFld4))
            {
                lbl4.Text = "<a href=\"Tel:+972:" + myFld4.ToString() + "\">" + tblData.Rows[myIndex][4].ToString() + "</a>";
            }
            //lblNumOfResults.Text = " רשומה " + (myIndex + 1).ToString() + " מתוך " + tblData.Rows.Count.ToString() + " רשומות";
        } 
      
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        myIndex++;
        if (myIndex == tblData.Rows.Count) 
            myIndex = tblData.Rows.Count-1;
        else
            updateDataOnScreen();

    }
  
}