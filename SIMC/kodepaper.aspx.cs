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
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter adp;
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
         
                loadData();
        }
       public void loadData()
            {
            using (SqlCommand cmd = new SqlCommand("SELECT abstrak.IdAbstrak, event.NameEvent, abstrak.title, abstrak.topic,  abstrak.submittedby AS submittedbyID, abstrak.reviewedby AS reviewedbyID, event.IdEvent, detailabstrak.statusKarya, r.namaUser AS reviewedby,abstrak.kodepaper, abstrak.statusDistribusi,detailabstrak.modifieddate, abstrak.deadlineRevisi, users.email, users.namaUser, users.IdUser, users.namaUser AS submittedby, detailabstrak.abstract, payment.statusPayment FROM detailabstrak JOIN abstrak ON detailabstrak.IdAbstrak = abstrak.IdAbstrak JOIN event ON event.IdEvent = abstrak.IdEvent JOIN users ON abstrak.submittedby = users.IdUser LEFT JOIN users r ON abstrak.reviewedby = r.IdUser LEFT JOIN fullpaper ON abstrak.IdAbstrak = fullpaper.IdAbstract LEFT JOIN payment ON abstrak.IdAbstrak=payment.IdAbstract WHERE event.IdEvent = '" + Session["IdEvent"].ToString() + "'"))
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

            protected void BtnSubmitAdd_Click(object sender, EventArgs e)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                try
                {

                    adp = new SqlDataAdapter("select email, namaUser from users where email=@email", con);
                    //here a i am passing parameter tokend email from the email.Text's value
                    adp.SelectCommand.Parameters.AddWithValue("@email", Convert.ToString(txtemail.Text));
                    dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        lbresult.Text = "Enter valid email address ";
                        txtemail.Text = "";

                        return;
                    }
                    else
                    {

                        string email = Convert.ToString(txtemail.Text);
                        StringBuilder sbody = new StringBuilder();
                        // here i am sendind a image as logo with the path http://usingaspdotnet.blogspot.com
                        // here i am sending a link to the user's mail address with the three values email,token,uname
                        // these three values i am sending  this link with the values using querystring method.
                        sbody.Append(" Dear Bapak/Ibu  " + txtnama.Text + ", <br>Kami ucapkan Selamat karena Abstrak Paper Bapak/Ibu dinyatakan diterima dan dilanjutkan untuk presentasi pada Seminar " + txtevent.Text + " <br><br>");
                        sbody.Append("Kode Paper Anda: " + txtkode.Text);

                        sbody.Append("<br><br> Terima kasih. <br> Salam, <br><br> AstraTech Conference </br>");
                        //in the below line i am sending mail with the link to the user.
                        //in this line i am passing four parameters 1st sender's mail address ,2nd receiever mail address, 3rd Subject,4th sbody.ToString() there will be complete link
                        // inside the sbody
                        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("sneemo.polman@gmail.com", email.ToString(), "Reset Your Password", sbody.ToString());

                        //in the below  i am declaring the receiever email address and password
                        System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("sneemo.polman@gmail.com ", "akgjonujrbzgtnpl");
                        // in the below  i am declaring the smtp address of gmail and port number of the gmail
                        System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                        mailclient.EnableSsl = true;
                        mailclient.Credentials = mailAuthenticaion;
                        mail.Subject = "Hasil Review Abstrak";
                        // here am setting the property IsBodyHtml true because i am using html tags inside the mail's token
                        mail.IsBodyHtml = true;
                        mailclient.Send(mail);
                        SqlCommand com = new SqlCommand();
                        com.Connection = con;
                        com.CommandText = "sp_InsertFullpaperNotif";
                        com.CommandType = CommandType.StoredProcedure;
                        com.Parameters.AddWithValue("@kodePaper", Convert.ToString(txtkode.Text));
                        com.Parameters.AddWithValue("@IdAbstrak", Convert.ToInt32(txtid.Text));
                        com.Parameters.AddWithValue("@statusDistribusi", "Belum Mengumpulkan");
                    com.Parameters.AddWithValue("@modifiedby", "");
                    com.Parameters.AddWithValue("@submittedby", "" );
                    com.Parameters.AddWithValue("@reviewedby", txtrev.Text);
                    com.Parameters.AddWithValue("@message", "Selamat karena Abstrak Paper Bapak/Ibu " + txtnama.Text + " dinyatakan diterima dan dilanjutkan untuk presentasi pada Seminar " + txtevent.Text + "");
                        com.Parameters.AddWithValue("@status", "Aktif");
                        com.Parameters.AddWithValue("@IdUser", txtiduser.Text);
                        com.ExecuteNonQuery();

                    com.Dispose();

                        con.Close();
                        lbresult.Text = "Link has been sent to your email address";
                        txtemail.Text = "";
                        Response.Redirect(Request.RawUrl);
                    Response.Write("<script>alert('Kode paper berasil diatur');</script>");
                }
                }
                catch (Exception ex)
                {
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
