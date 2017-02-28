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
            string prevLat = "";
            string prevLng = "";
            string content = "";
            string saveDir = @"Images\";
            int i = 0;
            int j = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string user = "Select * from [Users] where Level = '" + DropDownList1.Text + "' and Subject =  '" + DropDownList2.Text + "' ORDER BY Lat DESC, Lng DESC";
            SqlCommand commandD = new SqlCommand(user, conn);
            using (SqlDataReader dr = commandD.ExecuteReader())
            {
                
                while (dr.Read())
                {
                    i++;
                    Debug.WriteLine(dr["UserName"].ToString());


                    if (prevLat != dr["Lat"].ToString().Trim() && prevLng != dr["Lng"].ToString().Trim())
                    {

                        j++;

                        if ((j - 1) > 0)
                        {
                            //markers += content;
                            markers += @" var contentstring" + (j - 1).ToString() + "= \"" + content + "\"; var infowindow" + (j - 1).ToString() + " = new google.maps.InfoWindow({content: contentstring" + (j - 1).ToString() + "}); "
                            +
                            @"marker" + (j - 1).ToString() + ".addListener('click', function() {infowindow" + (j - 1).ToString() + ".open(map, marker" + (j - 1).ToString() + ");});";
                            content = "";

                        }
                        //content+= saveDir + dr["UserPhoto"].ToString().Trim()+"<br />";

                        content += dr["UserName"].ToString().Trim() + "<br />"
                    + dr["Level"].ToString().Trim() + "<br />"
                    + dr["Subject"].ToString().Trim() + "<br />"
                    + dr["email"].ToString().Trim() + "<br />";

                        markers += @" var marker" + j.ToString()
                            + @" = new google.maps.Marker({position: new google.maps.LatLng(" + dr["Lat"].ToString().Trim()
                            + ", "
                            + dr["Lng"].ToString().Trim() + "),"
                            + @"map: map}); ";




                    }
                    else
                    {
                        content +=
                     "<br />"
                    + dr["UserName"].ToString().Trim() + "<br />"
                    + dr["Level"].ToString().Trim() + "<br />"
                    + dr["Subject"].ToString().Trim() + "<br />"
                    + dr["email"].ToString().Trim() + "<br />";
                    
                        

                    }

                    Debug.WriteLine(content);

                    prevLat = dr["Lat"].ToString().Trim();
                        prevLng = dr["Lng"].ToString().Trim();
                    
                    }
                markers += @" var contentstring" + j.ToString() + "= \"" + content + "\"; var infowindow" + j.ToString() + " = new google.maps.InfoWindow({content: contentstring" + j.ToString() + "}); "
                            +
                            @"marker" + j.ToString() + ".addListener('click', function() {infowindow" + j.ToString() + ".open(map, marker" + j.ToString() + ");});";

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








