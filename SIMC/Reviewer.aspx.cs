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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindingList();
            BindingList2();
            BindingList5();
            loadData();
            ViewNotifikasi.Visible = true;
        }

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("Select IdNotif, message, IdUser, status  FROM notifikasi WHERE status='Aktif'and  IdUser ='" + Session["IdUser"].ToString() + "'"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGPeserta.DataSource = dTable;
                    DGPeserta.DataBind();
                }
                catch (Exception ex)
                {

                }
            }

        }

        protected void DGPeserta_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Hapus")
            {
                string id = e.CommandArgument.ToString();
                //String id = DGPeserta.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_DeleteNotifikasi";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p1", id);
                com.Parameters.AddWithValue("@p2", "Tidak Aktif");

                int result = Convert.ToInt32(com.ExecuteNonQuery());

                loadData();
                ViewNotifikasi.Visible = true;
            }
        }
        public void BindingList()
        {
            String str = "select count(IdAbstrak) AS Jumlah from abstrak";

            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotalAbstrakYangMasuk.Text = dr["Jumlah"].ToString();
            }
            con.Close();


        }
        public void BindingList2()
        {
            String str = "select count(IdFullpaper) AS Jumlah from fullpaper";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblFullpaper.Text = dr["Jumlah"].ToString();
            }
            con.Close();

        }
        public void BindingList5()
        {
            String str = "SELECT COUNT(*) AS JumlahNotifikasi from notifikasi WHERE status='Aktif' AND IdUser = '" + Session["IdUser"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblnotif.Text = dr["JumlahNotifikasi"].ToString();
            }
            con.Close();
        }
    }
}