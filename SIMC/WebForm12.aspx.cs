using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        string fileimg;
        string status;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT abstrak.IdAbstrak, abstrak.title, abstrak.topic, abstrak.submittedby AS submittedbyID, abstrak.reviewedby AS reviewedbyID, event.IdEvent, event.nameEvent ,detailabstrak.statusKarya, r.namaUser AS reviewedby, r.email, r.namaUser , r.IdUser, abstrak.kodepaper, abstrak.statusDistribusi, users.namaUser AS submittedby, detailabstrak.abstract, payment.statusPayment FROM detailabstrak JOIN abstrak ON detailabstrak.IdAbstrak = abstrak.IdAbstrak JOIN event ON event.IdEvent = abstrak.IdEvent JOIN users ON abstrak.submittedby = users.IdUser LEFT JOIN users r ON abstrak.reviewedby = r.IdUser LEFT JOIN fullpaper ON abstrak.IdAbstrak = fullpaper.IdAbstract LEFT JOIN payment ON abstrak.IdAbstrak=payment.IdAbstract WHERE IdDetailAbs IN (SELECT MAX(IdDetailAbs) FROM detailabstrak GROUP BY IdAbstrak) AND detailabstrak.statusKarya='Diterima' AND users.IdUser ='4' "))
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
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            try
            {
                fileimg = Path.GetFileName(fileuploadimg.PostedFile.FileName);
                fileuploadimg.SaveAs(Server.MapPath("~/BuktiPaymentFile/" + fileimg));
            }
            catch (Exception ex)
            {

            }

            status = "Sudah dibayar";
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "InsertPayment";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nameSender", TxtTambahNP.Text);
            com.Parameters.AddWithValue("@accountNumber", TxtTambahNK.Text);
            com.Parameters.AddWithValue("@TotalPayment", Convert.ToInt32(TxtTambahTP.Text));
            com.Parameters.AddWithValue("@statusPayment", "Sudah dibayar");
            com.Parameters.AddWithValue("@proofOfPayment", fileimg);
            com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(Session["IdUser"]));
            com.Parameters.AddWithValue("@IdAbtract", TXTID.Text);
            com.Parameters.AddWithValue("@kwitansi", "");
            com.Parameters.AddWithValue("@dateConfirmation", DateTime.Today);
            com.Parameters.AddWithValue("@message", "Halo, Tolong Segera dikonfirmasi pembayaran yang masuk yaa dari" +TxtTambahNP.Text);
            com.Parameters.AddWithValue("@status", "Aktif");



            com.ExecuteNonQuery();

            loadData();

            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

        }
    }
}