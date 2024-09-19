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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindingList();
            BindingList2();
            BindingList3();
            BindingList4();
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
        public void BindingList2()
        {
            String str = "SELECT COUNT(*) AS Author from users WHERE role='Author'";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblAuthor.Text = dr["Author"].ToString();
            }
            con.Close();

        }
        public void BindingList()
        {
            String str = " SELECT COUNT(*) AS Abstrak from abstrak";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblAbstrak.Text = dr["Abstrak"].ToString();
            }
            con.Close();

        }
        public void BindingList3()
        {
            String str = "SELECT COUNT(*) AS Reviewer from users WHERE role='Reviewer'";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblReviewer.Text = dr["Reviewer"].ToString();
            }
            con.Close();

        }

        public void BindingList4()
        {
            String str = "SELECT COUNT(*) AS Fullpaper from fullpaper";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblFullpaper.Text = dr["Fullpaper"].ToString();
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