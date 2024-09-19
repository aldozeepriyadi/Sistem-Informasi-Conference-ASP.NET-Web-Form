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
    public partial class KelEvent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        string status;
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentdate = DateTime.Today.ToShortDateString();
            comparevalidator2.ValueToCompare = currentdate;
            comparevalidator4.ValueToCompare = currentdate;
            if (!IsPostBack)
            {
                loadData();
                ViewEvent.Visible = true;
                BtnAction.Visible = true;

                //txtid.Visible = false;
            }
        }

        protected void DGEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGEvent.PageIndex = e.NewPageIndex;
            loadData();
        }


        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * from event where statusEvent='Aktif'"))
            {

                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGEvent.DataSource = dTable;
                    DGEvent.DataBind();
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

        protected void btnTambah_Click(object sender, EventArgs e)
        {


            ViewEvent.Visible = false;
            BtnAction.Visible = false;
        }

      

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            ViewEvent.Visible = true;
            BtnAction.Visible = true;
            clear();
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


        public void clear()
        {
            TxtTambahNama.Text = "";
            TxtTambahTema.Text = "";
            DGEvent.SelectedIndex = 0;
        }

        public void ShowAlertMessage(string pesan)
        {
            System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
            if (page != null)
            {
                pesan = pesan.Replace("'", "\'");
                System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + pesan + "'", true);
            }
        }

        public void notif(int result)
        {
            if (result > 0)
            {
                ShowAlertMessage("Success, Berhasil Menyimpan Data");
                loadData();
                clear();
            }
            else
            {
                ShowAlertMessage("Failed, Contact Super Admin");
            }
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            status = "Aktif";
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "InsertEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nameEvent", TxtTambahNama.Text);
            com.Parameters.AddWithValue("@theme", TxtTambahTema.Text);
            com.Parameters.AddWithValue("@topic", txtAddTopic.Text);
            com.Parameters.AddWithValue("@tanggalAwal", txtAddtanggalAwal.Text);
            com.Parameters.AddWithValue("@tanggalAkhir", txtAddtanggalAkhir.Text);
            com.Parameters.AddWithValue("@statusEvent", status);
            com.Parameters.AddWithValue("@kategori", txtkategori.Text);
            com.Parameters.AddWithValue("@biaya", TxtAddBiaya.Text);
            ShowAlertMessage("Success, Berhasil Menyimpan Data");
            com.ExecuteNonQuery();

            loadData();
            clear();
            con.Close();
            ViewEvent.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

            ViewEvent.Visible = true;
            BtnAction.Visible = true;
            clear();
        }

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            status = "Aktif";
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "sp_UpdateEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IdEvent", txtid.Text);
            com.Parameters.AddWithValue("@nameEvent", TxtEditNama.Text);
            com.Parameters.AddWithValue("@theme", TxtEditTema.Text);
            com.Parameters.AddWithValue("@topic", txtEdtTopic.Text);
            com.Parameters.AddWithValue("@tanggalAkhir", TxtEdittanggalAkhir.Text);
            com.Parameters.AddWithValue("@tanggalAwal", TxtEdittanggalAwal.Text);
            com.Parameters.AddWithValue("@statusEvent", status);
            com.Parameters.AddWithValue("@biaya", TxtEditBiaya.Text);
            com.Parameters.AddWithValue("@kategori", txtEdtkategori.Text);

            com.ExecuteNonQuery();

            loadData();
            clear();
            con.Close();
            ViewEvent.Visible = true;
            Response.Redirect(Request.RawUrl);
            Response.Write("<script>alert('Data Berhasil Disimpan');</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "sp_DeleteEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p1", TextBox2.Text);
            com.Parameters.AddWithValue("@p2", "Tidak Aktif");


            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            loadData();
            ViewEvent.Visible = true;

            Response.Redirect(Request.RawUrl);
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    ViewEvent.Visible = true;
        //    BtnAction.Visible = true;
        //    clear();
        //}







        //protected void edit_Click(object sender, EventArgs e)
        //{
        //    SqlCommand com = new SqlCommand();
        //    com.Connection = con;
        //    com.CommandText = "sp_UpdateEvent";
        //    com.CommandType = CommandType.StoredProcedure;
        //    com.Parameters.AddWithValue("@nameEvent", TxtEditNama.Text);
        //    com.Parameters.AddWithValue("@theme", TxtEditTema.Text);
        //    com.Parameters.AddWithValue("@topic", txtEdtTopic.Text);
        //    com.Parameters.AddWithValue("@tanggalAkhir", TxtEdittanggalAkhir.Text);
        //    com.Parameters.AddWithValue("@tanggalAwal", TxtEdittanggalAwal.Text);
        //    //TxtEditTanggal.Text = Convert.ToDateTime(dr[11]).ToString("yyyy-MM-dd"); con.Open();
        //    con.Open();
        //    com.ExecuteNonQuery();
        //    con.Close();
        //    loadData();
        //    clear();

        //    ViewEvent.Visible = true;
        //    Response.Redirect(Request.RawUrl);
        //}

    }
}