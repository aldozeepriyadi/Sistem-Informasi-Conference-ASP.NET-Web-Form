using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class PemetaanKarya : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        DataTable dt;
        SqlDataAdapter adp;
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
            //loadcb(DDLREVIEW);

            string com = "SELECT * FROM abstrak JOIN users on users.IdUser = abstrak.reviewedby";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDLREVIEW.DataSource = dt;
            DDLREVIEW.DataBind();
            DDLREVIEW.DataTextField = "namaUser";
            DDLREVIEW.DataValueField = "reviewedBy";
            DDLREVIEW.DataBind();
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            try
            {

                //adp = new SqlDataAdapter("SELECT abstrak.IdAbstrak, abstrak.title, abstrak.topic, abstrak.submittedby AS submittedbyID, abstrak.reviewedby AS reviewedbyID, event.IdEvent, event.nameEvent ,detailabstrak.statusKarya, r.namaUser AS reviewedby, r.email, r.namaUser , r.IdUser, abstrak.kodepaper, abstrak.statusDistribusi,detailabstrak.modifieddate, abstrak.deadlineRevisi, users.namaUser AS submittedby, detailabstrak.abstract, payment.statusPayment FROM detailabstrak JOIN abstrak ON detailabstrak.IdAbstrak = abstrak.IdAbstrak JOIN event ON event.IdEvent = abstrak.IdEvent  JOIN users r ON abstrak.reviewedby = r.IdUser LEFT JOIN fullpaper ON abstrak.IdAbstrak = fullpaper.IdAbstract LEFT JOIN payment ON abstrak.IdAbstrak=payment.IdAbstract WHERE IdDetailAbs IN (SELECT MAX(IdDetailAbs) FROM detailabstrak GROUP BY IdAbstrak) ", con);
                ////here a i am passing parameter tokend email from the email.Text's value
                //adp.SelectCommand.Parameters.AddWithValue("@email", Convert.ToString(txtemail.Text));
                //adp.SelectCommand.Parameters.AddWithValue("@namaUser", Convert.ToString(txtnama.Text));
                //dt = new DataTable();
                //adp.Fill(dt);
                //if (dt.Rows.Count == 0)
                //{

                //    txtemail.Text = "";

                //    return;
                //}
                //else
                //{

                //    string email = Convert.ToString(txtemail.Text);
                //    StringBuilder sbody = new StringBuilder();
                //    // here i am sendind a image as logo with the path http://usingaspdotnet.blogspot.com
                //    // here i am sending a link to the user's mail address with the three values email,token,uname
                //    // these three values i am sending  this link with the values using querystring method.
                //    sbody.Append(" Dear Bapak/Ibu  " + txtnama.Text + ", <br><br>Mohon kesediaannya untuk melakukan review pada " + txtevent.Text + " <br><br>terhadap abstrak paper, dengan judul:");
                //    sbody.Append("" + txtjudul.Text);

                //    sbody.Append("<br><br> Terima kasih. <br> Salam, <br><br> AstraTech Conference </br>");
                //    //in the below line i am sending mail with the link to the user.
                //    //in this line i am passing four parameters 1st sender's mail address ,2nd receiever mail address, 3rd Subject,4th sbody.ToString() there will be complete link
                //    // inside the sbody
                //    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("sneemo.polman@gmail.com", email.ToString(), "Reset Your Password", sbody.ToString());

                //    //in the below  i am declaring the receiever email address and password
                //    System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("sneemo.polman@gmail.com ", "akgjonujrbzgtnpl");
                //    // in the below  i am declaring the smtp address of gmail and port number of the gmail
                //    System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                //    mailclient.EnableSsl = true;
                //    mailclient.Credentials = mailAuthenticaion;
                //    mail.Subject = txtevent.Text + "Review Abstrak";
                //    // here am setting the property IsBodyHtml true because i am using html tags inside the mail's token
                //    mail.IsBodyHtml = true;
                //    mailclient.Send(mail);
                    SqlCommand com = new SqlCommand();
                    com.Connection = con;
                    com.CommandText = "sp_UpdateAbstrak";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@reviewedby", Convert.ToInt32(DDLREVIEW.SelectedValue));
                    com.Parameters.AddWithValue("@statusDistribusi", "Proses Review");
                    com.Parameters.AddWithValue("@IdAbstrak", txtid.Text);
                    com.Parameters.AddWithValue("@message", "Mohon kesediaannya untuk melakukan review pada " + txtevent.Text + "terhadap abstrak paper, dengan judul: " + txtjudul.Text);
                    com.Parameters.AddWithValue("@status", "Aktif");
                    com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(DDLREVIEW.SelectedValue));
                    com.ExecuteNonQuery();

                    com.Dispose();

                    con.Close();
                    txtemail.Text = "";
                    Response.Redirect(Request.RawUrl);

                }
            
            catch (Exception ex)
            {
                //and display the error in the label
            }
            finally
            {
                con.Close();
            }

        }

        public void Binddata(DropDownList DDL)
        {
            string com = "SELECT * FROM abstrak JOIN users on users.IdUser = abstrak.reviewedby";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDL.DataSource = dt;
            DDL.DataBind();
            DDL.DataTextField = "namaUser";
            DDL.DataValueField = "reviewedBy"; 
            DDL.DataBind();
            


        }
        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

        }

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT abstrak.IdAbstrak, abstrak.title, abstrak.topic, abstrak.submittedby AS submittedbyID, abstrak.reviewedby AS reviewedbyID, event.IdEvent, event.nameEvent ,detailabstrak.statusKarya, r.namaUser AS reviewedby, r.email, r.namaUser , r.IdUser, abstrak.kodepaper, abstrak.statusDistribusi,detailabstrak.modifieddate, abstrak.deadlineRevisi, users.namaUser AS submittedby, detailabstrak.abstract, payment.statusPayment FROM detailabstrak JOIN abstrak ON detailabstrak.IdAbstrak = abstrak.IdAbstrak JOIN event ON event.IdEvent = abstrak.IdEvent JOIN users ON abstrak.submittedby = users.IdUser LEFT JOIN users r ON abstrak.reviewedby = r.IdUser LEFT JOIN fullpaper ON abstrak.IdAbstrak = fullpaper.IdAbstract LEFT JOIN payment ON abstrak.IdAbstrak=payment.IdAbstract WHERE IdDetailAbs IN (SELECT MAX(IdDetailAbs) FROM detailabstrak GROUP BY IdAbstrak) AND event.IdEvent =' " + Session["IdEvent"].ToString() + "'"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGReviewAbstrak.DataSource = dTable;
                    DGReviewAbstrak.DataBind();
                    con.Close();
                }
                catch (Exception ex)
                {

                }
            }
        }

        public void loadcb(DropDownList DDL)
        {
            string com = "Select * from users where role ='Reviewer'";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDL.DataSource = dt;
            DDL.DataBind();
            DDL.DataTextField = "namaUser";
            DDL.DataValueField = "IdUser";
            DDL.DataBind();

        }
    }
}