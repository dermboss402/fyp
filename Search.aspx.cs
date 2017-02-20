using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
    }

    public string GetMarkers()
    {
        if (IsPostBack)
        {
            string markers = "";
            ArrayList profile = new ArrayList();
            ArrayList loc = new ArrayList();

            string window = "";
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string user = "Select * from [Users] where Level = '" + DropDownList1.Text + "' and Subject =  '" + DropDownList2.Text + "'";
            SqlCommand commandD = new SqlCommand(user, conn);
            using (SqlDataReader dr = commandD.ExecuteReader())
            {
                if(dr.HasRows)

                while (dr.Read())
                {
                    i++;
                        profile.Add(dr["UserName"].ToString().Trim());
                        profile.Add(dr["Level"].ToString().Trim());
                        profile.Add(dr["Subject"].ToString().Trim());
                        profile.Add(dr["email"].ToString().Trim());

                        markers +=
                    @"var contentstring" + i.ToString() + " =  \"" 
                    + dr["UserName"].ToString().Trim()+ "<br />"
                    + dr["Level"].ToString().Trim() + "<br />"
                    + dr["Subject"].ToString().Trim() + "<br />" 
                    + dr["email"].ToString().Trim() + "\";" 
                    + @" var marker" + i.ToString() 
                    + @" = new google.maps.Marker({position: new google.maps.LatLng(" + dr["Lat"].ToString().Trim()
                    + ", " 
                    +  dr["Lng"].ToString().Trim() + "),"
                    + @"map: map}); " 
                    + @"var infowindow" + i.ToString() + " = new google.maps.InfoWindow({content: contentstring" + i.ToString()  + "}); " 
                    +
                    @"marker" + i.ToString() + ".addListener('click', function() {infowindow" + i.ToString() + ".open(map, marker" + i.ToString() + ");});" ;

                        profile.Add(markers);
                }

                Debug.WriteLine("Markers!!!: " + markers);
            }
            return markers;
        }
        else
        {
            return "";
        }
    }
 
    }








