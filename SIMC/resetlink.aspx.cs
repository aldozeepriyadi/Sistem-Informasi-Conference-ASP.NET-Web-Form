using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SIMC
{
    public partial class resetlink : System.Web.UI.Page
    {
        DataTable dt;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMC1ConnectionString"].ConnectionString);

        SqlDataAdapter adp;
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["forgetpassword"].ToString();
            //string email = Session["email"].ToString();

            //with the help of the last page a link will be sent to the user's email address. the user can use this link only
            //one time to change his/her password
            con = new SqlConnection();
            //  here i am declairing connection  with the database
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SIMC1ConnectionString"].ConnectionString;
            con.Open();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            // at the .aspx i am creating two panels. inside the second panel am holding a image named images.jpg that will show thae there is a invalid link,if
            // any user use this link second time.
            //if any user use this link first time then he will see the design that will show the structure of change password
            try
            {
                // here in SqlDataAdapter i am executing sql query if after the execution of this query there will be any data inside the datatable then
                // it will go inside the else condition otherwise it will go inside the if
                adp = new SqlDataAdapter("select email, token from  user_token  where token=@token and email=@email  ", con);
                adp.SelectCommand.Parameters.AddWithValue("@token", Request.QueryString["token"].ToString());
                adp.SelectCommand.Parameters.AddWithValue("@email", Request.QueryString["email"].ToString());
                dt = new DataTable();
                adp.Fill(dt);
                lblEmail.Text = Request.QueryString["email"].ToString();
                if (dt.Rows.Count > 0)
                {

                    //if this condition will be setisfy then Pane_image will true and  Panel_reset_pwd will false


                    return;
                }
                else
                {


                }
            }
            catch
            {

            }
            finally
            {
            }
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            //if the else condition will be setisfy then   Panel_reset_pwd will be true and after entering the new password by the user,
            //this passwordlink will be executed
            //if (con.State == ConnectionState.Closed)
            //{ con.Open(); }
            con.Open();
            string email = Session["forgetpassword"].ToString();
            SqlCommand cmd = new SqlCommand("Update users set password = '" + pw.Text + "'where email= '" + email + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert ('your password has been successfully updated')</script>");
            pw.Text = "";
            //txtcofrmpwd.Text = "";
            //try

            //{
            //    // in the below quesry, after changing the password by the user, i am clearing the passwordlink column's value from the table tb_employee_with_passwordlink
            //    // if there will be no value inside the passwordlink column of the table and user will try to open the link again then at the time of
            //    //page load the user goes inside the first panel
            //    // and the first panel dislay message thar this link is invalid

            //    SqlCommand cmd = new SqlCommand();
            //    cmd.Connection = con;
            //    con.Open();
            //    cmd.CommandText = "sp_UpdatePassword";
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@password", pw.Text);
            //    cmd.Parameters.AddWithValue("@email", lblEmail.Text);


            //    cmd.ExecuteNonQuery();
            //    cmd.Dispose();
            //    con.Close();
            //    Response.Write("<script>alert('Data Telah Diupdate');</script>");
            //    //lbresult.Text = "Your Password has been Changed successfully";
            //    pw.Text = "";
            //    Response.Redirect("~/Login.aspx");

            //}
            //catch
            //{

            //}
            //finally
            //{
            //    con.Close();
            //}


        }
    }
}