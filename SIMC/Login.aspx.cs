using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class Login : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString;
        string str, email, password, name, role, IdUser;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                str = "Select * from users";
                com = new SqlCommand(str);
                sqlda = new SqlDataAdapter(com.CommandText, con);
                dt = new DataTable();
                sqlda.Fill(dt);
                RowCount = dt.Rows.Count;
                for (int i = 0; i < RowCount; i++)
                {
                    email = dt.Rows[i]["email"].ToString();
                    name = dt.Rows[i]["namaUser"].ToString();
                    password = dt.Rows[i]["password"].ToString();
                    role = dt.Rows[i]["role"].ToString();
                    IdUser = dt.Rows[i]["IdUser"].ToString();
                    string IdEvent = dt.Rows[i]["IdEvent"].ToString();
                    if (email == txtEmail.Text && password == txtPassword.Text)
                    {
                        Session["email"] = email;
                        Session["namaUser"] = name;
                        Session["role"] = role;
                        Session["IdUser"] = IdUser;
                        Session["IdEvent"] = IdEvent;
                        if (dt.Rows[i]["role"].ToString() == "Admin" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/Admin.aspx");
                        else if (dt.Rows[i]["role"].ToString() == "Super Admin" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/SuperAdmin.aspx");
                        else if (dt.Rows[i]["role"].ToString() == "Reviewer" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/Reviewer.aspx");
                        else if (dt.Rows[i]["role"].ToString() == "Peserta" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/Peserta.aspx");
                        else if (dt.Rows[i]["role"].ToString() == "Finance" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/Finance.aspx");
                        else if (dt.Rows[i]["role"].ToString() == "Author" || Session["namaUser"] == null || Session["role"] == null)
                            Response.Redirect("~/Author.aspx");
                        Session.Timeout = 5;
                        errorMsg2.Visible = true;
                        errorMsg1.Visible = false;
                        errorMsg.Visible = false;
                    }
                    else
                    {
                        errorMsg.Text = "Invalid User Name or Password! Please try again!";
                        errorMsg1.Visible = true;
                        errorMsg1.Text = "Email atau Password tidak terdaftar";
                        errorMsg.Visible = true;
                        errorMsg.Text = "Email atau Password tidak terdaftar";
                        errorMsg2.Visible = false;
                        //dr.Close();
                        con.Close();
                    }
                }
            }
        }
    }
}