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
    public partial class RevAbstrak : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
            if (!IsPostBack)
            {
                loadData();
                loadDDL();


                //ViewTransaksiReviewer.Visible = true;
                //ManageAbstrak.Visible = true;
                ViewReviewAbstrak.Visible = true;
                ViewReviewAbstrak.Visible = true;



            }
        }
        public void loadDDL()
        {

            DDLTambahStatus.Items.Clear();
            DDLTambahStatus.Items.Insert(0, new ListItem("Pilih Status", ""));
            DDLTambahStatus.Items.Insert(1, new ListItem("Diterima", "Diterima"));
            DDLTambahStatus.Items.Insert(2, new ListItem("Revisi", "Revisi"));
            DDLTambahStatus.Items.Insert(3, new ListItem("Ditolak", "Ditolak"));

        }
        public void loadData()
        {

            using (SqlCommand cmd = new SqlCommand("SELECT a.[title], a.[IdAbstrak], a.[Topic], d.[statusKarya], d.[keterangan] FROM [abstrak] as a join detailabstrak as d on a.IdAbstrak = d.IdAbstrak"))
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

        protected void DGReviewAbstrak_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Manage")
            {
                string id = e.CommandArgument.ToString();

                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_getAbstrakById";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p1", id);


                SqlDataReader dr = com.ExecuteReader();
                dr.Read();



                txtCatatanRevisi.Visible = true;
                DDLTambahStatus.Visible = true;
                ViewReviewAbstrak.Visible = false;

            }
        }
        public void reviewAbstrak()
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_ReviewAbstrak2";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p2", DDLTambahStatus.SelectedValue);
            com.Parameters.AddWithValue("@p3", txtCatatanRevisi.Text);
            com.Parameters.AddWithValue("@p1", Convert.ToInt32(TXTID.Text));
            com.Parameters.AddWithValue("@p4", "Selesai Direview");

            com.ExecuteNonQuery();
            Response.Clear();
            Response.Write("Data updated successfully!");
            Response.End();

            loadData();
            clear();

            ViewReviewAbstrak.Visible = true;
            Response.Redirect(Request.RawUrl);
        }
        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_ReviewAbstrak2";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p2", DDLTambahStatus.SelectedValue);
            com.Parameters.AddWithValue("@p3", txtCatatanRevisi.Text);
            com.Parameters.AddWithValue("@p1", Convert.ToInt32(TXTID.Text));
            com.Parameters.AddWithValue("@p4", "Selesai Direview");
            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", "Swal.fire('Success', 'Your data has been updated successfully!', 'success');", true);
            com.ExecuteNonQuery();
           

            loadData();
            clear();

            ViewReviewAbstrak.Visible = true;
            Response.Redirect(Request.RawUrl);
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void DGReviewAbstrak_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGReviewAbstrak.PageIndex = e.NewPageIndex;
            loadData();
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
        public void clear()
        {
            txtCatatanRevisi.Text = "";
            DDLTambahStatus.Text = "";

        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {

            DDLTambahStatus.Visible = false;
            txtCatatanRevisi.Visible = false;

            //ViewTransaksiReviewer.Visible = true;
            //ManageAbstrak.Visible = true;
            ViewReviewAbstrak.Visible = true;
            loadData();
        }

        protected void DGReviewAbstrak_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;

            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;

            }
        }
    }
}