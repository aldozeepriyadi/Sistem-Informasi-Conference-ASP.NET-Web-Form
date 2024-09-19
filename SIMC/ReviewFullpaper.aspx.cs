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
    public partial class ReviewFullpaper : System.Web.UI.Page
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
                ManageFullpaper.Visible = false;
                ViewFullpaper.Visible = true;
                //BindGridView();
            }
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("  SELECT dfp.[IdDetailFpp],dfp.[statusKarya],fp.[reviewedby],fp.[deadlineRevisi], fp.submittedby AS submittedbyID,dfp.[keterangan],a.[topic],a.[title] ,e.[nameEvent],u.[namaUser] " +
                " FROM[fullpaper] as fp join detailfpp as dfp ON fp.IdFullpaper = dfp.IdFullpaper join[abstrak] as a " +
                "ON a.IdAbstrak = fp.IdAbstract join[event] as e ON e.IdEvent = a.IdEvent  JOIN user s ON fullpaper.submittedby = s.IdUser join [users] as u ON u.IdUser = fp.reviewedby"))
            {

                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {

                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;


                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGReviewFullpaper.DataSource = dTable;
                    DGReviewFullpaper.DataBind();
                }
                catch (Exception ex)
                {

                }
            }



        }
        private void SortGridView(string sortExpression, string direction)
        {
            ///DataTable dt = loadData().Tables[0];


            //DataView dv = new DataView(dt);
            //dv.Sort = sortExpression + direction;

            //DGReviewFullpaper.DataSource = dv;
            //DGReviewFullpaper.DataBind();
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

        protected void DGReviewAbstrak_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnManage_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void DGReviewFullpaper_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Manage")
            {

                using (SqlCommand cmd = new SqlCommand(" SELECT detailfpp.statusKarya,users.namaUser,fullpaper.deadlineRevisi,detailfpp.keterangan,fullpaper.reviewedby" +
                    " FROM fullpaper join users on fullpaper.reviewedby = users.IdUser join detailfpp on detailfpp.IdFullpaper = " +
                    "fullpaper.IdFullpaper where fullpaper.reviewedby = " + Session["IdUser"].ToString() +""))
                {

                    SqlDataAdapter dt = new SqlDataAdapter();
                    try
                    {
                        int id = int.Parse(e.CommandArgument.ToString());

                        cmd.Connection = con;
                        con.Open();
                     
                       
                        SqlDataReader dr = cmd.ExecuteReader();
                        dr.Read();
                        //DDLStatusAbstrak.Text = dr[5].ToString();
                        //txtTinyMCE.Text = dr[14].ToString();

                        //string id = DGReviewAbstrak.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Cells[0].Text;
                        //string role = DGReviewAbstrak.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
                        //lblId.Text = role;
                        //GridViewRow row = GridView.Rows[role];
                        //.SelectedValue = dr[9].ToString();

                        lblId.Text = Convert.ToString(id);
                        //.Visible = true;
                        ManageFullpaper.Visible = true;
                        txtCatatanRevisiFullpaper.Visible = true;
                        DDLStatusFullpaper.Visible = true;
                        ViewFullpaper.Visible = false;
                        btnManage.Visible = true;
                        btnCancel.Visible = true;

                        con.Close();
                        btnCancel.Visible = true;
                    }
                    catch (Exception ex)
                    {

                    }

                }
            }
        }

        protected void DGReviewFullpaper_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void DGReviewFullpaper_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void DGReviewFullpaper_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
      

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            string id = lblId.Text;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_ManageReviewFullpaper";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p2", DDLStatusFullpaper.SelectedValue);
            com.Parameters.AddWithValue("@p4", txtTanggalRevisi.Text);
            com.Parameters.AddWithValue("@p5", Session["IdUser"].ToString());
            com.Parameters.AddWithValue("@p3", txtCatatanRevisiFullpaper.Text);
            com.Parameters.AddWithValue("@p1", id);
            //com.Parameters.AddWithValue("@p4", Session["IdUser"].ToString());
            //com.Parameters.AddWithValue("@p5", lblId.Text);



            con.Open();

            int row = com.ExecuteNonQuery();


            con.Close();
            //loadData();
            // clear();



            ManageFullpaper.Visible = false;
            ViewFullpaper.Visible = true;

            Response.Redirect(Request.RawUrl);
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            ViewFullpaper.Visible = true;
            ManageFullpaper.Visible = false;
        }
    }
}