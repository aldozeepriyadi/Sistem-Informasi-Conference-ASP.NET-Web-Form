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
    public partial class BobotNilai : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                Addvalue.Visible = false;
                Editvalue.Visible = false;
                Viewvalue.Visible = true;
                BtnAction.Visible = true;
            }

        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("select * from ratingweight"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGvalue.DataSource = dTable;
                    DGvalue.DataBind();
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
            Addvalue.Visible = true;
            Editvalue.Visible = false;
            Viewvalue.Visible = false;
            BtnAction.Visible = false;
        }

        protected void DGvalue_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGvalue.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void DGvalue_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                string id = DGvalue.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "stp_getnilaibyid";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p1", id);
                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                TxtEditID.Text = dr[0].ToString();
                TxtEditassessmentCriteria.Text = dr[1].ToString();
                TxtEditvalue.Text = dr[2].ToString();
                con.Close();
                Addvalue.Visible = false;
                Editvalue.Visible = true;
                Viewvalue.Visible = false;
                BtnAction.Visible = false;
            }
            else if (e.CommandName == "Hapus")
            {
                String id = DGvalue.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();

                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_DeletedNilai";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@IdRating", id);
                con.Open();
                int result = Convert.ToInt32(com.ExecuteNonQuery());
                con.Close();

                loadData();
                clear();
                Addvalue.Visible = false;
                Editvalue.Visible = false;
                Viewvalue.Visible = true;
                BtnAction.Visible = true;
            }
        }

        //protected void DGvalue_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    string sortExpression = e.SortExpression;

        //    if (GridViewSortDirection == SortDirection.Ascending)
        //    {
        //        GridViewSortDirection = SortDirection.Descending;
        //        SortGridView(sortExpression, DESCENDING);
        //    }
        //    else
        //    {
        //        GridViewSortDirection = SortDirection.Ascending;
        //        SortGridView(sortExpression, ASCENDING);
        //    }
        //}
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
        //    DataTable dt = loadData().Tables[0];

        //    DataView dv = new DataView(dt);
        //    dv.Sort = sortExpression + direction;

        //    DGvalue.DataSource = dv;
        //    DGvalue.DataBind();
        //}

        public void clear()
        {
            TxtTambahvalue.Text = "";
            TxtTambahassessmentCriteria.Text = "";
            DGvalue.SelectedIndex = 0;
        }

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_Updatenilai";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IdRating", TxtEditID.Text.ToUpper());
            com.Parameters.AddWithValue("@assessmentCriteria", TxtEditassessmentCriteria.Text.ToUpper());
            com.Parameters.AddWithValue("@value", TxtEditvalue.Text.ToUpper());

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            Editvalue.Visible = false;
            Viewvalue.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            Addvalue.Visible = false;
            Editvalue.Visible = false;
            Viewvalue.Visible = true;
            BtnAction.Visible = true;
            clear();
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_insertRatingWeight";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@assessmentCriteria", TxtTambahassessmentCriteria.Text);
            com.Parameters.AddWithValue("@value", TxtTambahvalue.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            Addvalue.Visible = false;
            Viewvalue.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {
            Addvalue.Visible = false;
            Viewvalue.Visible = true;
            BtnAction.Visible = true;
            clear();
        }
    }
}