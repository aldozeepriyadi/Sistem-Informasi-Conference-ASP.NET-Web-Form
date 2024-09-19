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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMC1ConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            if(TxtTambahHP.Text == "" && nama.Text=="")
            {
                Response.Write("<script>alert('Isi Data Terlebih dahulu');</script>");

            }
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            Response.Write("<script>alert('Proses pendaftaran user berhasil, silakan lakukan login');</script>");
            com.CommandText = "InsertUsers";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaUser", nama.Text);
            com.Parameters.AddWithValue("@email", email.Text);
            com.Parameters.AddWithValue("@password", pw.Text);
            com.Parameters.AddWithValue("@address", Alamat.Text);
            com.Parameters.AddWithValue("@kategori", ddlstatus.SelectedValue);
            com.Parameters.AddWithValue("@LastEducation", ddlpdkakhir.SelectedValue);
            com.Parameters.AddWithValue("@instance", Instansi.Text);
            com.Parameters.AddWithValue("@phone", Convert.ToString(TxtTambahHP.Text));
            com.Parameters.AddWithValue("@role", "Peserta");
            com.Parameters.AddWithValue("@gender", rbJK.SelectedValue);
            com.Parameters.AddWithValue("@IdEvent", "");
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
           
            Response.Redirect("~/Login.aspx");
            
        }
    }
}