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
    public partial class KelUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        DataTable dt;
        SqlDataAdapter adp;
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                loadDDL();
                ViewUser.Visible = true;
            }
        }



        public void loadDDL()
        {
            string com = "Select * from Event";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDLTambahEvent.DataSource = dt;
            DDLTambahEvent.DataBind();
            
            DDLTambahEvent.DataTextField = "nameEvent";
            DDLTambahEvent.DataValueField = "IdEvent";
            DDLTambahEvent.DataBind();
            DDLTambahEvent.Items.Insert(0, new ListItem("Semua Event", "Semua Event"));
            DDLEditROLE.Items.Insert(0, new ListItem("--- Pilih Role ---", ""));
            DDLEditROLE.Items.Insert(1, new ListItem("Peserta", "Peserta"));
            DDLEditROLE.Items.Insert(2, new ListItem("Admin", "Admin"));
            DDLEditROLE.Items.Insert(3, new ListItem("Reviewer", "Reviewer"));

        }

        protected void DGUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGUser.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void DGUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                String id = DGUser.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "stp_getUserbyid";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p1", id);
                lblId.Text = id;

                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                //string role = DGUser.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
                string role = DGUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
                //lblId.Text = role;
                //GridViewRow row = GridView.Rows[role];
                DDLTambahEvent.SelectedValue = dr[9].ToString();
                DDLEditROLE.SelectedValue = dr[3].ToString();



                //SqlDataReader dr = com.ExecuteReader();
                //dr.Read();

                con.Close();

                ViewUser.Visible = false;
                TXTID.Visible = false;
            }

        }

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT u.[email], u.[namaUser], u.[role], u.[address], u.[phone], u.[gender], e.nameEvent, e.IdEvent, u.[LastEducation], u.[IdUser] FROM[users] as u left join event as e on u.IdEvent = e.IdEvent where u.role='Reviewer' or u.instance='Politeknik Astra' or u.role='Admin' or u.kategori='Dosen' or u.role='Peserta'"))
            { 

                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGUser.DataSource = dTable;
                    DGUser.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;
                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }

        //private void SortGridView(string sortExpression, string direction)
        //{
        //   DataTable dt = loadData().Tables[0];

        //    DataView dv = new DataView(dt);
        //    dv.Sort = sortExpression + direction;

        //    DGUser.DataSource = dv;
        //    DGUser.DataBind();
        //}

        

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {

        }

  

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            if( DDLTambahEvent.SelectedValue == "Semua Event" && DDLEditROLE.SelectedValue == "Reviewer"  )
            {
                try
                {

                    adp = new SqlDataAdapter("Select email from users", con);
                    //here a i am passing parameter tokend email from the email.Text's value
                    adp.SelectCommand.Parameters.AddWithValue("@email", Convert.ToString(txtemail.Text));
                    dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {

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
                        sbody.Append(" Dear Bapak/Ibu  " + txtnama.Text); 
                        sbody.Append("<br>Mohon kesediannya, bahwa Bapak/Ibu kami jadikan Reviewer pada kegiatan " + txtevent.Text);
                        sbody.Append("<br><br> Terima kasih. <br> Salam, <br><br> AstraTech Conference </br>");
                        //in the below line i am sending mail with the link to the user.
                        //in this line i am passing four parameters 1st sender's mail address ,2nd receiever mail address, 3rd Subject,4th sbody.ToString() there will be complete link
                        // inside the sbody
                        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("sneemo.polman@gmail.com", email, "Informasi Reviewer Conference", sbody.ToString());

                        //in the below  i am declaring the receiever email address and password
                        System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("sneemo.polman@gmail.com ", "akgjonujrbzgtnpl");
                        // in the below  i am declaring the smtp address of gmail and port number of the gmail
                        System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                        mailclient.EnableSsl = true;
                        mailclient.Credentials = mailAuthenticaion;
                        mail.Subject = txtevent.Text + "Informasi Reviewer Conference";
                        // here am setting the property IsBodyHtml true because i am using html tags inside the mail's token
                        mail.IsBodyHtml = true;
                        mailclient.Send(mail);
                        SqlCommand com = new SqlCommand();
                        com.Connection = con;
                        com.CommandText = "sp_UpdateUserNoEvent";
                        com.CommandType = CommandType.StoredProcedure;
                        com.Parameters.AddWithValue("@role", Convert.ToString(DDLEditROLE.SelectedValue));
                        com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(TXTID.Text));
                        com.Parameters.AddWithValue("@message", sbody.ToString());
                        com.Parameters.AddWithValue("@status", "Aktif");
                        con.Open();
                        
                        com.ExecuteNonQuery();

                        com.Dispose();

                        con.Close();
                        txtemail.Text = "";
                        Response.Redirect(Request.RawUrl);
                        Response.Write("<script>alert('Data Berhasil Disimpan');</script>");

                    }
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
            else if (DDLEditROLE.SelectedValue == "Admin")
            {
                try
                {
                
                    adp = new SqlDataAdapter("Select a.[IdAbstrak], a.[title], a.[Topic], a.[statusDistribusi],a.[reviewedby], u.[email], u.[IdUser], u.[namaUser], e.[nameEvent] FROM[abstrak] as a  join users as u on a.reviewedby = u.IdUser join event as e on u.IdEvent = e.IdEvent", con);
                    //here a i am passing parameter tokend email from the email.Text's value
                    adp.SelectCommand.Parameters.AddWithValue("@email", Convert.ToString(txtemail.Text));
                    dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {

                        txtemail.Text = "";

                        return;
                    }
                    else
                    {

                        string email = Convert.ToString(txtemail.Text);
                        StringBuilder sbody = new StringBuilder();
                        
                        sbody.Append(" Dear Bapak/Ibu  " + txtnama.Text + ", <br><br>Mohon kesediannya, bahwa Bapak/Ibu kami jadikan Admin  pada kegiatan " + txtevent.Text );
                        sbody.Append("<br><br> Terima kasih. <br> Salam, <br><br> AstraTech Conference </br>");
                        
                        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("sneemo.polman@gmail.com", email.ToString(), "Informasi Admin Conference", sbody.ToString());

                        //in the below  i am declaring the receiever email address and password
                        System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("sneemo.polman@gmail.com ", "akgjonujrbzgtnpl");
                        // in the below  i am declaring the smtp address of gmail and port number of the gmail
                        System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                        mailclient.EnableSsl = true;
                        mailclient.Credentials = mailAuthenticaion;
                        mail.Subject = txtevent.Text + "Informasi Admin Conference";
                        // here am setting the property IsBodyHtml true because i am using html tags inside the mail's token
                        mail.IsBodyHtml = true;
                        mailclient.Send(mail);
                        SqlCommand com = new SqlCommand();
                        com.Connection = con;
                        com.CommandText = "sp_UpdateUser";
                        com.CommandType = CommandType.StoredProcedure;
                        com.Parameters.AddWithValue("@role", Convert.ToString(DDLEditROLE.SelectedValue));
                        com.Parameters.AddWithValue("@IdEvent", Convert.ToInt32(DDLTambahEvent.SelectedValue));
                        com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(TXTID.Text));
                        com.Parameters.AddWithValue("@message", sbody.ToString());
                        com.Parameters.AddWithValue("@status", "Aktif");
                        con.Open();
                        com.ExecuteNonQuery();
                        com.Dispose();

                        con.Close();
                        txtemail.Text = "";
                        Response.Redirect(Request.RawUrl);
                        Response.Write("<script>alert('Data Berhasil Disimpan');</script>");

                    }
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
            else
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_UpdateUserPeserta";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@role", Convert.ToString(DDLEditROLE.SelectedValue));
                com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(TXTID.Text));
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Data Berhasil Disimpan');</script>");
            }
            Response.Write("<script>alert('Data Berhasil Disimpan');</script>");
            loadData();
            
            Response.Redirect(Request.RawUrl);
        }
    }
}