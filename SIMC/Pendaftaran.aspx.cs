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
    public partial class Pendaftaran : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
           
            SqlCommand com = new SqlCommand();
            com.Connection = con;

            com.CommandText = "InsertUsers";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@name", nama.Text.ToUpper());
            com.Parameters.AddWithValue("@email", email.Text.ToUpper());
            com.Parameters.AddWithValue("@password", pw.Text.ToUpper());
            com.Parameters.AddWithValue("@address", Alamat.Text.ToUpper());
            com.Parameters.AddWithValue("@jenisStatus", ddlstatus.SelectedValue);
            com.Parameters.AddWithValue("@pendidikanTerakhir", ddlpdkakhir.SelectedValue);
            com.Parameters.AddWithValue("@instance", Instansi.Text.ToUpper());
            com.Parameters.AddWithValue("@phone", Convert.ToString(TxtTambahHP.Text.ToUpper()));
            com.Parameters.AddWithValue("@role", "peserta");
            com.Parameters.AddWithValue("@gender", rbJK.SelectedValue);
            com.Parameters.AddWithValue("@IdEvent", "");
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Login.aspx");
        }
    }
}