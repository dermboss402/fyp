using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Diagnostics;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("New.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Log_in_Screen.aspx");
    }




    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string user = "Select * from Users where email = '" + TextBox1.Text + "'";
            SqlCommand commandD = new SqlCommand(user, conn);
            SqlDataReader dr = null;
          

            Debug.WriteLine("it got this far first");
            using (dr = commandD.ExecuteReader())
            {
                while (dr.Read())
                {
                    string UserID = dr["UserID"].ToString();
                    string Username = dr["UserName"].ToString();
                    MailMessage mm = new MailMessage("findatutorrecover@gmail.com", TextBox1.Text);
                    mm.Subject = "Password Recovery";
                    mm.Body = string.Format("Hi, " + Username + "<br /><br />Please follow this link to reset your password.<br />" + "http://localhost:58829/PasswordReset.aspx?uid=" + UserID + "<br />Thank You.");
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Timeout = 10000;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("findatutorrecov@gmail.com", "Jupiter55");

                    NetworkCred.UserName = "findatutorrecov@gmail.com";
                    NetworkCred.Password = "Jupiter55";

                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    Debug.WriteLine("it got this far");
                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Password reset has been sent to your email address.";
                }
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            Debug.WriteLine("{0} Exception caught.", ex);
        }
    }

        /*     else
             {
                 lblMessage.ForeColor = Color.Red;
                 lblMessage.Text = "This email address does not match our records.";
             }
             */

    }

    
    

    
