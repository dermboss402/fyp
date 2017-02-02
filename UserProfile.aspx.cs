using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string UserId = Session["UserID"].ToString();
            Debug.WriteLine(UserId);
            string insertquery = "Update [Users] Set Subject =@subject, Level=@level, addressline1=@addressline1, addressline2=@addressline2, City=@city, County=@county, Phone=@phone, Otheremail=@otheremail Where [UserID] = '" + UserId+ "'";

            SqlCommand comm = new SqlCommand(insertquery, conn);

            comm.Parameters.AddWithValue("@subject", DropDownList2.Text);
            comm.Parameters.AddWithValue("@level", DropDownList1.Text);
            comm.Parameters.AddWithValue("@addressline1", TextBox5.Text);
            comm.Parameters.AddWithValue("@addressline2", TextBox8.Text);
            comm.Parameters.AddWithValue("@city", TextBox9.Text);
            comm.Parameters.AddWithValue("@county", TextBox10.Text);
            comm.Parameters.AddWithValue("@phone", TextBox6.Text);
            comm.Parameters.AddWithValue("@otheremail", TextBox7.Text);

            comm.ExecuteNonQuery();


            Response.Write("User Profile updated");
            conn.Close();

            Response.Redirect("UserProfile.aspx");


        
    }
           catch (Exception ex)
        {
            Response.Write("error" + ex.ToString());
        }


    }
}

