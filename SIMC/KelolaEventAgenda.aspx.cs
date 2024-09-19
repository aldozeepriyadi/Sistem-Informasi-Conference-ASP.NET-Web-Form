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
    public partial class KelolaEventAgenda : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";


        string strConnString = ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString;
        string str;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;
        string tglawaleve = null;
        string tglakhireve =null;
        protected void Page_Load(object sender, EventArgs e)
        {
            loaddataeve();
            DateTime dateawal = DateTime.Parse(tglawaleve);
            DateTime dateakhir = DateTime.Parse(tglakhireve);
            comparevalidator3.ValueToCompare = dateawal.ToShortDateString();
            comparevalidator4.ValueToCompare = dateakhir.ToShortDateString();

            if (!this.IsPostBack)
            {
                loadData();
        
                viewsub.Visible = true;
            }
        }

        public void loaddataeve()
        {
            SqlConnection con = new SqlConnection(strConnString);

            str = "SELECT  e.[tanggalAwal] AS tglAwalEve , e.[tanggalAkhir] AS tglAkhirEve FROM [SubEvent] as s join users as u on s.IdEvent = u.IdEvent join event as e on e.IdEvent = s.IdEvent where s.IdEvent='" + Session["IdEvent"].ToString() + "' AND u.IdUser='" + Session["IdUser"].ToString() + "'";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
                tglawaleve = dt.Rows[i]["tglAwalEve"].ToString();
                tglakhireve = dt.Rows[i]["tglAkhirEve"].ToString();
            }
        }
  

        protected void DGEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void DGEvent_Sorting(object sender, GridViewSortEventArgs e)
        {

        }



        public DataSet loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT s.[IdEvent], s.[kategori], s.[tanggalAwal] , s.[tanggalAkhir], s.[IdSubEvent], e.[tanggalAwal] AS tglAwalEve , e.[tanggalAkhir] AS tglAkhirEve FROM [SubEvent] as s join users as u on s.IdEvent = u.IdEvent join event as e on e.IdEvent = s.IdEvent where s.IdEvent='" + Session["IdEvent"].ToString() + "' AND u.IdUser='" + Session["IdUser"].ToString() + "'"))
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
                }
                catch (Exception ex)
                {

                }
            }


            return ds;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "InsertSubEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@kategori", txtkategoriE.Text);
            com.Parameters.AddWithValue("@tanggalAwal", txtAddtanggalAwalE.Text);
            com.Parameters.AddWithValue("@tanggalAkhir", txtAddtanggalAkhirE.Text);
            com.Parameters.AddWithValue("@IdEvent", Convert.ToInt32(Session["IdEvent"].ToString()));
            Response.Write("<script>alert('Data Berhasil Disimpan');</script>");

            com.ExecuteNonQuery();
            con.Close();
            loadData();

            Response.Redirect(Request.RawUrl);
        }

        protected void BtnSubmitAdde_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "sp_UpdateSubEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@kategori", txtkategori.Text);
            com.Parameters.AddWithValue("@tanggalAwal", txtAddtanggalAwal.Text);
            com.Parameters.AddWithValue("@tanggalAkhir", txtAddtanggalAkhir.Text);
            com.Parameters.AddWithValue("@IdSubEvent", Convert.ToInt32(txtId.Text));


            com.ExecuteNonQuery();
            con.Close();
            loadData();

            Response.Redirect(Request.RawUrl);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "sp_DeleteSubEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IdSubEvent", TextBox2.Text);

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            loadData();
            viewsub.Visible = true;

            Response.Redirect(Request.RawUrl);
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            viewsub.Visible = true;
        }
    }
}