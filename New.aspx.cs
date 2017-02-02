using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class Log_in_Select : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Label5.Visible = false;
        }     
    }
          protected void Button1NewUser_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection connA = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            string checkuser = "Select count (*)from [Users] where UserName = '" + TextBox1.Text + "'";
            connA.Open();
            SqlCommand com = new SqlCommand(checkuser, connA);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Replace(" ", ""));
            connA.Close();

            if (temp == 1)
            {
                Label5.Visible = true;
            }
            else
            {
                Guid id = Guid.NewGuid();
                SqlConnection connB = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                connB.Open();
                string insertquery = "insert into [Users] (UserID, UserName, Password, email) values(@userid, @name, @password, @email)";
                SqlCommand comm = new SqlCommand(insertquery, connB);
                comm.Parameters.AddWithValue("@userid", id);
                comm.Parameters.AddWithValue("@name", TextBox1.Text);
                comm.Parameters.AddWithValue("@password", TextBox2.Text);
                comm.Parameters.AddWithValue("@email", TextBox4.Text);

                comm.ExecuteNonQuery();

                Response.Write("Registration successful");
                connB.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("error" + ex.ToString());
        }

    }
}

