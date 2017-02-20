using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using GoogleMaps.LocationServices;

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

            var address = TextBox5.Text + ", " + TextBox8.Text + ", ";

            var locationService = new GoogleLocationService();
            var point = locationService.GetLatLongFromAddress(address);

            var latitude = point.Latitude;
            var longitude = point.Longitude;

          //  Debug.WriteLine(latitude);
           // Debug.WriteLine(longitude);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
         
            string UserId = Session["UserID"].ToString();
            Debug.WriteLine(UserId);
            string updatequery = "Update [Users] Set Subject =@subject, Level=@level, addressline1=@addressline1, addressline2=@addressline2, City=@city, County=@county, Phone=@phone, Otheremail=@otheremail, Lat=@lat, Lng=@lng Where [UserID] = '" + UserId+ "'";

            SqlCommand comm = new SqlCommand(updatequery, conn);

            comm.Parameters.AddWithValue("@subject", DropDownList2.Text);
            comm.Parameters.AddWithValue("@level", DropDownList1.Text);
            comm.Parameters.AddWithValue("@addressline1", TextBox5.Text);
            comm.Parameters.AddWithValue("@addressline2", TextBox8.Text);
            comm.Parameters.AddWithValue("@city", TextBox9.Text);
            comm.Parameters.AddWithValue("@county", TextBox10.Text);
            comm.Parameters.AddWithValue("@phone", TextBox6.Text);
            comm.Parameters.AddWithValue("@otheremail", TextBox7.Text);
            comm.Parameters.AddWithValue("@lat", latitude);
            comm.Parameters.AddWithValue("@lng", longitude);

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
    protected bool checkFileType(string f)
    {
        string extension = Path.GetExtension(f);
        extension = extension.ToLower();
        switch (extension)
        {
            case ".gif":
            case ".png":
            case ".jpg":
            case ".jpeg": return true;
            default: return false;
        }
    }
    
    protected void Button2_Click(object sender, EventArgs e)

        
    {
        try
        {


            string saveDir = @"Images\";
            string appPath = Request.PhysicalApplicationPath;
            string savePath;

            if (Fileupload1.HasFile)
            {
                if (checkFileType(Fileupload1.FileName) == true)

                {
                    savePath = appPath + saveDir + Fileupload1.FileName;
                    Fileupload1.SaveAs(savePath);
                    // savePath = "C:/Users/dermot/Desktop/photo.JPG";
                    // Fileupload1.SaveAs(savePath);
                    SqlConnection connectionA = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    connectionA.Open();
                    string UserId = Session["UserID"].ToString();
                    Debug.WriteLine(UserId);
                    string updatequery = "Update [Users] Set UserPhoto=@userphoto Where [UserID] = '" + UserId + "'";

                    SqlCommand comm = new SqlCommand(updatequery, connectionA);
                    comm.Parameters.AddWithValue("@userphoto", Fileupload1.FileName);
                    comm.ExecuteNonQuery();


                    Response.Write("User Profile updated");
                    connectionA.Close();
                    
                }
            }
        }

        catch (Exception ex)
        {
            Response.Write("error" + ex.ToString());
        }
        
    }
    



   
}


