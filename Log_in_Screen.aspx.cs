using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

public partial class Log_in_Screen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String uName = TextBox1.Text;
        String pword = TextBox2.Text;


    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        bool uNameValidate = validateUser(TextBox1.Text);
        bool pswrdValidate = validateUserInput(TextBox2.Text);

        if(uNameValidate && pswrdValidate)
        {
            accessUserDB();
        }
    }
    public bool validateUser(String uName)
    {
        var positiveIntRegex = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9]+$");
        if (!positiveIntRegex.IsMatch(uName))
        {
            return false;

        }
        else
        {
            return true;
        }

    }

    public bool validateUserInput(String pword)
    {
        var positiveIntRegex = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9]+$");
        if (!positiveIntRegex.IsMatch(pword))
        {
            return false;

        }
        else
        {
            return true;
        }

    }
    protected void accessUserDB()
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string checkuser = "Select [UserID] from [Users] where Username = '" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
            SqlCommand cmd = new SqlCommand(checkuser, conn);


            conn.Open();

            {
                var reader = cmd.ExecuteReader();

                if (reader.Read())
                {

                    Debug.WriteLine(reader.HasRows);
                    // Debug.WriteLine(reader.Read().ToString());
                    Session["UserID"] = reader.GetString(0);
                    Response.Redirect("Default.aspx");
                    reader.Close();
                    conn.Close();
                }
                else
                {
                    Label1.Text = "You're username and password is incorrect";
                    Label1.ForeColor = System.Drawing.Color.Red;

                }
            }
        }

        catch (Exception ex)
        {
            Debug.WriteLine("{0} Exception caught.", ex);
        }
    }
}



