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
    public partial class WebForm13 : System.Web.UI.Page
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
                
                ViewFullpaper.Visible = true;
                //BindGridView();
            }
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("  SELECT dfp.[IdDetailFpp],dfp.[statusKarya],fp.[reviewedby],fp.[IdFullpaper],fp.[deadlineRevisi],dfp.[keterangan],a.[topic],a.[title] ,e.[nameEvent],u.[namaUser] " +
                " FROM[fullpaper] as fp left join detailfpp as dfp ON fp.IdFullpaper = dfp.IdFullpaper left join[abstrak] as a " +
                "ON a.IdAbstrak = fp.IdAbstract left join[event] as e ON e.IdEvent = a.IdEvent left join [users] as u ON u.IdUser = fp.reviewedby where fp.reviewedby='" + Session["IdUser"].ToString() + "'"))
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

        protected void DGReviewFullpaper_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Manage")
            {

                using (SqlCommand cmd = new SqlCommand("  SELECT dfp.[IdDetailFpp],dfp.[statusKarya],fp.[reviewedby],fp.[deadlineRevisi],dfp.[keterangan],a.[topic],a.[title] ,e.[nameEvent],u.[namaUser] " +
                " FROM[fullpaper] as fp join detailfpp as dfp ON fp.IdFullpaper = dfp.IdFullpaper join[abstrak] as a " +
                "ON a.IdAbstrak = fp.IdAbstract join[event] as e ON e.IdEvent = a.IdEvent  join [users] as u ON u.IdUser = fp.reviewedby"))
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

                       
                        txtCatatanRevisiFullpaper.Visible = true;
                        DDLStatusFullpaper.Visible = true;
                        ViewFullpaper.Visible = false;
                        
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

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Kode paper berasil diatur');</script>");
            if (txtTanggalRevisi.Text == "01-01-1990")
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_ManageReviewFullpaper";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p2", DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@p4", null);
                com.Parameters.AddWithValue("@p5", Session["IdUser"].ToString());
                com.Parameters.AddWithValue("@p3", txtCatatanRevisiFullpaper.Text);
                com.Parameters.AddWithValue("@p1", TXTID.Text);
                //com.Parameters.AddWithValue("@p4", Session["IdUser"].ToString());
                //com.Parameters.AddWithValue("@p5", lblId.Text);
                com.Parameters.AddWithValue("@status", "Aktif");
                com.Parameters.AddWithValue("@message", "Halo, Pembayaran anda telah" + DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@IdUser", '4');


                con.Open();

                int row = com.ExecuteNonQuery();


                con.Close();
                //loadData();
                // clear();



               
                ViewFullpaper.Visible = true;

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_ManageReviewFullpaper";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p2", DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@p4", txtTanggalRevisi.Text);
                com.Parameters.AddWithValue("@p5", Session["IdUser"].ToString());
                com.Parameters.AddWithValue("@p3", txtCatatanRevisiFullpaper.Text);
                com.Parameters.AddWithValue("@p1", TXTID.Text);
                //com.Parameters.AddWithValue("@p4", Session["IdUser"].ToString());
                //com.Parameters.AddWithValue("@p5", lblId.Text);
                com.Parameters.AddWithValue("@status", "Aktif");
                com.Parameters.AddWithValue("@message", "Halo, Pembayaran anda telah" + DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@IdUser", '4');


                con.Open();

                int row = com.ExecuteNonQuery();


                con.Close();
                //loadData();
                // clear();



              
                ViewFullpaper.Visible = true;

                Response.Redirect(Request.RawUrl);
            }
           
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            ViewFullpaper.Visible = true;
           
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Kode paper berasil diatur');</script>");
            if (txtTanggalRevisi.Text == "01-01-1990")
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_ManageReviewFullpaper";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p2", DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@p4", null);
                com.Parameters.AddWithValue("@p5", Session["IdUser"].ToString());
                com.Parameters.AddWithValue("@p3", txtCatatanRevisiFullpaper.Text);
                com.Parameters.AddWithValue("@p1", TXTID.Text);
                //com.Parameters.AddWithValue("@p4", Session["IdUser"].ToString());
                //com.Parameters.AddWithValue("@p5", lblId.Text);
                com.Parameters.AddWithValue("@status", "Aktif");
                com.Parameters.AddWithValue("@message", "Halo, Pembayaran anda telah" + DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@IdUser", '4');


                con.Open();

                int row = com.ExecuteNonQuery();


                con.Close();
                //loadData();
                // clear();




                ViewFullpaper.Visible = true;

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "sp_ManageReviewFullpaper";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@p2", DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@p4", txtTanggalRevisi.Text);
                com.Parameters.AddWithValue("@p5", Session["IdUser"].ToString());
                com.Parameters.AddWithValue("@p3", txtCatatanRevisiFullpaper.Text);
                com.Parameters.AddWithValue("@p1", TXTID.Text);
                //com.Parameters.AddWithValue("@p4", Session["IdUser"].ToString());
                //com.Parameters.AddWithValue("@p5", lblId.Text);
                com.Parameters.AddWithValue("@status", "Aktif");
                com.Parameters.AddWithValue("@message", "Halo, Pembayaran anda telah" + DDLStatusFullpaper.SelectedValue);
                com.Parameters.AddWithValue("@IdUser", '4');


                con.Open();

                int row = com.ExecuteNonQuery();


                con.Close();
                //loadData();
                // clear();




                ViewFullpaper.Visible = true;

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}