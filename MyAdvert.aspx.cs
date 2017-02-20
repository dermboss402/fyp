using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyAdvert : System.Web.UI.Page
{
    SqlConnection connectionA = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string saveDir = @"Images\";



    protected void Page_Load(object sender, EventArgs e)
    {
        string appPath = Request.PhysicalApplicationPath;
        string savePath;
        {
            string id = Session["UserId"].ToString();
            


            connectionA.Open();
            string user = "SELECT * FROM Users WHERE UserID ='" + id + "'";
            SqlCommand commandD = new SqlCommand(user, connectionA);
            using (SqlDataReader dr = commandD.ExecuteReader())
            {
                if (dr.HasRows)
                {


                    while (dr.Read())
                    {
                        Image1.ImageUrl = saveDir + dr["UserPhoto"].ToString().Trim();
                        Label1.Text = dr["UserName"].ToString().Trim();
                        Label2.Text = "Level : " + dr["Level"].ToString().Trim();
                        Label3.Text = "Subject :" + dr["Subject"].ToString().Trim();
                        Label4.Text = "E-mail:" + dr["email"].ToString().Trim();
                    }
                }
            }
        }

    }
}
