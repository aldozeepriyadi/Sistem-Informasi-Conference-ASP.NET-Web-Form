using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace SIMC
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMC1ConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadData();
                loadcb(DDLTambahEvent);
                loadcb(DDLEditEvent);
                AddTanggal.Visible = false;
                EditTanggal.Visible = false;
                ViewTanggal.Visible = true;
                BtnAction.Visible = true;
            }
        }
        public DataSet loadData()
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_CariTanggal";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaAgenda", txtSearch.Text);

            SqlDataAdapter adap = new SqlDataAdapter(com);
            adap.Fill(ds);
            DGTanggal.DataSource = ds;
            DGTanggal.DataBind();
            return ds;
        }

        public void loadcb(DropDownList DDL)
        {
            string com = "Select * from Event";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDL.DataSource = dt;
            DDL.DataBind();
            DDL.DataTextField = "name";
            DDL.DataValueField = "IdEvent";
            DDL.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {

            AddTanggal.Visible = true;
            EditTanggal.Visible = false;
            ViewTanggal.Visible = false;
            BtnAction.Visible = false;
        }

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UpdateTanggal";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@tanggalAgenda", TxtEditTanggal.Text.ToUpper());
            com.Parameters.AddWithValue("@IdTanggal", TxtEditID.Text.ToUpper());
            com.Parameters.AddWithValue("@namaAgenda", TxtEditnamaAgenda.Text.ToUpper());
            com.Parameters.AddWithValue("@IdEvent", Convert.ToInt32(DDLEditEvent.SelectedValue));


            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            EditTanggal.Visible = false;
            ViewTanggal.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            AddTanggal.Visible = false;
            EditTanggal.Visible = false;
            ViewTanggal.Visible = true;
            BtnAction.Visible = true;
            clear();
        }

        protected void DGTanggal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGTanggal.PageIndex = e.NewPageIndex;
            loadData();
        }


        protected void DGTanggal_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                string id = DGTanggal.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "stp_getTanggalbyid";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p1", id);
                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                TxtEditnamaAgenda.Text = dr[1].ToString();
                DDLEditEvent.SelectedValue = dr[3].ToString();
                TxtEditTanggal.Text = dr[2].ToString();

                TxtEditID.Text = dr[0].ToString();

                con.Close();
                AddTanggal.Visible = false;
                EditTanggal.Visible = true;
                ViewTanggal.Visible = false;
                BtnAction.Visible = false;
            }
            else if (e.CommandName == "Hapus")
            {
                String id = DGTanggal.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();

                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_DeletedTanggal";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@IdTanggal", id);
                con.Open();
                int result = Convert.ToInt32(com.ExecuteNonQuery());
                con.Close();

                loadData();
                clear();
                AddTanggal.Visible = false;
                EditTanggal.Visible = false;
                ViewTanggal.Visible = true;
                BtnAction.Visible = true;
            }
        }

        protected void DGTanggal_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, DESCENDING);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, ASCENDING);
            }
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

        private void SortGridView(string sortExpression, string direction)
        {
            DataTable dt = loadData().Tables[0];

            DataView dv = new DataView(dt);
            dv.Sort = sortExpression + direction;

            DGTanggal.DataSource = dv;
            DGTanggal.DataBind();
        }

        public void clear()
        {
            TxtTambahTanggal.Text = "";
            TxtTambahnamaAgenda.Text = "";
            DDLTambahEvent.SelectedIndex = 0;
            DGTanggal.SelectedIndex = 0;
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "InsertTanggal";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaAgenda", TxtTambahnamaAgenda.Text.ToUpper());
            com.Parameters.AddWithValue("@IdEvent", Convert.ToInt32(DDLTambahEvent.SelectedValue));
            com.Parameters.AddWithValue("@tanggalAgenda", TxtTambahTanggal.Text.ToUpper());

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            AddTanggal.Visible = false;
            ViewTanggal.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

            AddTanggal.Visible = false;
            ViewTanggal.Visible = true;
            BtnAction.Visible = true;
            clear();
        }
    }
}
