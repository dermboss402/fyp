using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            //   lblName.Text = Session["Username"].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Response.Write("Session terminated");
        Response.Redirect("Default.aspx");

    }
}