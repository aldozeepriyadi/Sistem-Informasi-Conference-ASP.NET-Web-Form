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
    public partial class WebForm2 : System.Web.UI.Page
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
                BindGridView();
                AddEvent.Visible = false;
                EditEvent.Visible = false;
                ViewEvent.Visible = true;
                BtnAction.Visible = true;
            }
        }
        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from Event", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DGEvent.DataSource = dt;
            DGEvent.DataBind();
        }


        protected void DGEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGEvent.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void DGEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DGEvent.Rows[index];
                Response.Redirect("~/KelolaEventAgenda.aspx?IdEvent=" + row.Cells[3].Text);
                Label4.Text = row.Cells[3].Text;
            }
            //if (e.CommandName == "Ubah")
            //{
            //    String id = DGEvent.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            //    SqlCommand com = new SqlCommand();
            //    com.Connection = con;
            //    com.CommandText = "stp_getEventbyid";
            //    com.CommandType = CommandType.StoredProcedure;
            //    com.Parameters.AddWithValue("@p1", id);
            //    con.Open();
            //    SqlDataReader dr = com.ExecuteReader();
            //    dr.Read();
            //    TxtEditId.Text = dr[0].ToString();
            //    TxtEditNama.Text = dr[1].ToString();
            //    TxtEditTema.Text = dr[2].ToString();
            //    TxtEditTanggal.Text = dr[3].ToString();
            //    con.Close();
            //    AddEvent.Visible = false;
            //    EditEvent.Visible = true;
            //    ViewEvent.Visible = false;
            //    BtnAction.Visible = false;
            //    TxtEditId.Visible = false;
            //}

        }

        protected void DGEvent_Sorting(object sender, GridViewSortEventArgs e)
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

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * from event"))
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
            AddEvent.Visible = true;
            EditEvent.Visible = false;
            ViewEvent.Visible = false;
            BtnAction.Visible = false;
        }

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_UpdateEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IdEvent", TxtEditId.Text);
            com.Parameters.AddWithValue("@name", TxtEditNama.Text);
            com.Parameters.AddWithValue("@theme", TxtEditTema.Text);
            com.Parameters.AddWithValue("@deadlineConference", TxtEditTanggal.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            EditEvent.Visible = false;
            ViewEvent.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            AddEvent.Visible = false;
            EditEvent.Visible = false;
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

        private void SortGridView(string sortExpression, string direction)
        {

            DGEvent.DataBind();
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
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "InsertEvent";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@name", TxtTambahNama.Text);
            com.Parameters.AddWithValue("@theme", TxtTambahTema.Text);
            com.Parameters.AddWithValue("@deadlineConference", TxtTambahTanggal.Text);


            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();
            AddEvent.Visible = false;
            ViewEvent.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {
            AddEvent.Visible = false;
            ViewEvent.Visible = true;
            BtnAction.Visible = true;
            clear();
        }

    }
}