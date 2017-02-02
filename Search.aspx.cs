using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "Select (*)from [Table] where UserName = '" + DropDownList1.Text +  DropDownList2 +"'";
            SqlCommand com = new SqlCommand(checkuser, conn);
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}