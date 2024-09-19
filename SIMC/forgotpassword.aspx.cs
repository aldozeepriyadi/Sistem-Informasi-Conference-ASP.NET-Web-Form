﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;

namespace SIMC
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter adp;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString;
            con.Open();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            { con.Open(); }
            try
            {
                // here in SqlDataAdapter i am executing sql query if after the execution of this query there will be any data inside the datatable then
                // execute the else condition. otherwise it enter in the if condition and display message "Enter valid email address or utoken".
                // in the below query i am checking utoken and email address entered by the user with the values inside the database
                adp = new SqlDataAdapter("select email from users where email=@email", con);
                //here a i am passing parameter tokend email from the email.Text's value
                adp.SelectCommand.Parameters.AddWithValue("@email", Convert.ToString(email.Text));
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    lbresult.Text = "Enter valid email address ";
                    email.Text = "";

                    return;
                }
                else
                {
                    // if the values entered by the user will be correct then this token will execute.
                    // below inside the token variable i am catching the autogenerated value which will different evertime.
                    string token;
                    token = Guid.NewGuid().ToString();
                    // and am updating the token column of the table with this value. i mean inside the token column i'll store the value
                    // that was inside the token variable
                    cmd = new SqlCommand("insert user_token values(@email,@token) ", con);
                    cmd.Parameters.AddWithValue("@token", token);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    // here i am difinning a StringBuilder class named sbody
                    StringBuilder sbody = new StringBuilder();
                    // here i am sendind a image as logo with the path http://usingaspdotnet.blogspot.com
                    // here i am sending a link to the user's mail address with the three values email,token,uname
                    // these three values i am sending  this link with the values using querystring method.

                    sbody.Append("<a href=http://localhost:60778/resetlink.aspx?email=" + email.Text);
                    sbody.Append("&token=" + token + ">Click here to change your password</a>");
                    //in the below line i am sending mail with the link to the user.
                    //in this line i am passing four parameters 1st sender's mail address ,2nd receiever mail address, 3rd Subject,4th sbody.ToString() there will be complete link
                    // inside the sbody
                    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("simcpoltekastra@gmail.com", dt.Rows[0]["email"].ToString(), "Reset Your Password", sbody.ToString());

                    //in the below  i am declaring the receiever email address and password
                    System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("simcpoltekastra@gmail.com ", "tdcafpnkbmykjdrs");
                    // in the below  i am declaring the smtp address of gmail and port number of the gmail
                    System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    mailclient.EnableSsl = true;
                    mailclient.Credentials = mailAuthenticaion;
                    // here am setting the property IsBodyHtml true because i am using html tags inside the mail's token
                    mail.IsBodyHtml = true;
                    mailclient.Send(mail);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    lbresult.Text = "Link has been sent to your email address";
                    email.Text = "";



                }
            }
            catch (Exception ex)
            {
                // if there will be any error created at the time of the sending mail then it goes inside the catch
                //and display the error in the label
                lbresult.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}