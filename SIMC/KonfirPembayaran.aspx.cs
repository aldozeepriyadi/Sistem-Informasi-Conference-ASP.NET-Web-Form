using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class KonfirPembayaran : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                ViewPayment.Visible = true;
            }
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT  a.[title], c.[nameSender], c.[accountNumber],  c.[proofOfPayment],c.[statusPayment] , u.IdUser, c.[totalPayment], c.[statusPayment], c.[IdPayment] , d.[statusKarya],e.[NameEvent] FROM [payment] as c  join abstrak as a on c.IdAbstract = a.IdAbstrak join event as e on a.IdEvent = e.IdEvent join users as u on a.submittedby = u.IdUser join detailabstrak as d on a.IdAbstrak = d.IdAbstrak where d.[statusKarya]='Diterima' "))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGPayment.DataSource = dTable;
                    DGPayment.DataBind();
                    con.Close();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_statuspayment";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@statusPayment", rbKonfir.SelectedValue);
            com.Parameters.AddWithValue("@IdPayment", TXTID.Text);
            com.Parameters.AddWithValue("@dateConfirmation", DateTime.Today);
            com.Parameters.AddWithValue("@status", "Aktif");
            com.Parameters.AddWithValue("@message", "Halo, Pembayaran anda telah" + rbKonfir.SelectedValue);
            com.Parameters.AddWithValue("@IdUser", txtidD.Text);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            //clear();
            //EditTanggal.Visible = false;
            //ViewTanggal.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {
            rbKonfir.Visible = false;
            ViewPayment.Visible = true;
            loadData();
        }
        protected void ENameLinkBtn_Click(object sender, CommandEventArgs e)
        {
            string path = Server.MapPath(e.CommandArgument.ToString());
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(path);


            if (buffer != null)
            {
                Response.ContentType = "application/img";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }

    }
}