using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PasswordReset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        Debug.WriteLine(url);
        String user = url.Substring(url.Length - 36);
   
        if (IsPostBack)
        {

        }
    }





    protected void Button1_Click1(object sender, EventArgs e)
    {

        try
        {

            SqlConnection connA = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Debug.WriteLine(url);
            String user = url.Substring(url.Length - 36);

            String checkuser = "Select * from [Users] Where UserID =  '" + user + "'";
            connA.Open();
            SqlCommand com = new SqlCommand(checkuser, connA);
            connA.Close();

            
            SqlConnection connB = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            connB.Open();
            string updatequery = "Update [Users] Set Password =@password Where [UserID] = '" + user + "'";
            SqlCommand comm = new SqlCommand(updatequery, connB);
            comm.Parameters.AddWithValue("@password", TextBox1.Text);

            comm.ExecuteNonQuery();

            Response.Write("Password Changed");
            connB.Close();

            Response.Redirect("Default.aspx");

        }
        catch (Exception ex)
        {
            Response.Write("error" + ex.ToString());
        }

    }
}







