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
    public partial class SubAbstrak : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                loadcb(DDLTambahEvent);
                ViewSubAbstrak.Visible = true;
                BtnAction.Visible = true;
                TambahAbstrak.Visible = false;
            }
        }


        protected void DGSubAbstrak_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGSubAbstrak.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void DGSubAbstrak_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void DGSubAbstrak_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT a.[title], a.[deadlineRevisi], a.[IdAbstrak], a.[Topic], a.[statusDistribusi], a.[submittedby], a.[modifiedby], a.[reviewedby], e.[IdEvent], d.[statusKarya], d.[modifieddate], d.[abstract], d.[keterangan] FROM[abstrak] as a join detailabstrak as d on a.IdAbstrak = d.IdAbstrak join event as e on a.IdEvent=e.IdEvent WHERE a.submittedby ='" + Session["IdUser"].ToString() + "'"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGSubAbstrak.DataSource = dTable;
                    DGSubAbstrak.DataBind();
                }
                catch (Exception ex)
                {

                }
            }

        }

        public void loadcb(DropDownList DDL)
        {
            string com = "Select * from Event";
            SqlDataAdapter adapter = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDL.DataSource = dt;
            DDL.DataBind();
            DDL.DataTextField = "nameEvent";
            DDL.DataValueField = "IdEvent";
            DDL.DataBind();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            TambahAbstrak.Visible = true;
            ViewSubAbstrak.Visible = false;
            BtnAction.Visible = false;
            TxtTambahId.Visible = false;
            TxtTambahIdAbstrak.Visible = false;
        }

        protected void BtnEditCancel_Click(object sender, EventArgs e)
        {
            ViewSubAbstrak.Visible = true;
            BtnAction.Visible = true;
            TambahAbstrak.Visible = false;
        }

        public void clear()
        {
            TXTABSTRAK.Text = "";
        }

        protected void BtnEditSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "sp_revisi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p2", TXTABSTRAK.Text);
            com.Parameters.AddWithValue("@p3", DateTime.Today);
            com.Parameters.AddWithValue("@p1", lblId.Text);
            com.Parameters.AddWithValue("@p4", "Berhasil Dikumpulkan");
            com.Parameters.AddWithValue("@modifiedby", Convert.ToInt32(Session["IdUser"]));



            com.ExecuteNonQuery();
            con.Close();
            loadData();
            clear();

            Response.Redirect(Request.RawUrl);
        }

        protected void BtnAddSubmit_Click(object sender, EventArgs e)
        {
            string namapres, judul, topic,abstrak, katakunci, temp="0";
            int idevent, idabstrak;
            namapres = TxtTambahNamaPresenter.Text;
            judul = txtTambahJudul.Text;
            topic = txtTambahTopic.Text;
            katakunci = txtTambahKeyword.Text;
            idevent = Convert.ToInt32(DDLTambahEvent.SelectedValue);


            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "InsertAbstrak";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@presenter", namapres);
            com.Parameters.AddWithValue("@IdEvent", idevent);
            com.Parameters.AddWithValue("@title", judul);
            com.Parameters.AddWithValue("@Topic", topic);
            com.Parameters.AddWithValue("@kataKunci", katakunci);
            com.Parameters.AddWithValue("@statusDistribusi", "Berhasil Dikumpulkan");
            com.Parameters.AddWithValue("@submittedby", Convert.ToInt32(Session["IdUser"]));
            com.ExecuteNonQuery();
            con.Close();

            //SqlCommand cmd = new SqlCommand ("Select * FROM abstrak ");


            using (SqlCommand cmd = new SqlCommand("select * from abstrak where title = '" + judul + "'"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.CommandType = CommandType.Text;
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    //if (dr.HasRows)
                    //{
                    while (dr.Read())
                    {
                        temp = dr["IdAbstrak"].ToString();
                        Session["IdAbstrak"] = dr["IdAbstrak"].ToString();
                        //lblllllcoba.Text = Session["IdAbstrak"].ToString();
                    }

                    ////}
                }
                con.Close();
            }
            //cmd.Connection = con;

            //SqlDataReader sdr = cmd.ExecuteReader();
            //sdr.Read();
            //con.Close();

            con.Open();
            abstrak = TxtTambahAbstrak.Text;
            idabstrak = Convert.ToInt32(temp);
            SqlCommand ipt = new SqlCommand();
            ipt.Connection = con;
            ipt.CommandText = "InsertDetail";
            ipt.CommandType = CommandType.StoredProcedure;
            ipt.Parameters.AddWithValue("@IdAbstrak", idabstrak);
            ipt.Parameters.AddWithValue("@abstract", abstrak);
            ipt.Parameters.AddWithValue("@modifieddate", DateTime.Now);
            ipt.Parameters.AddWithValue("@statusKarya", "");
            ipt.Parameters.AddWithValue("@IdUser", TxtTambahId.Text);            
            ipt.Parameters.AddWithValue("@jenisAuthor", "Author 1");
            
            
            ipt.ExecuteNonQuery();
            con.Close();




            ////status = "Aktif";
            //com.Parameters.AddWithValue("@namaUser", TxtTambahNama.Text);
            //com.Parameters.AddWithValue("@email", TxtTambahEmail.Text);
            //com.Parameters.AddWithValue("@role", "Author");
            //com.Parameters.AddWithValue("@address", TxtTambahAlamat.Text);
            //com.Parameters.AddWithValue("@instance", TxtTambahInstansi.Text);
            //com.Parameters.AddWithValue("@phone", TxtTambahHP.Text);
            ////com.Parameters.AddWithValue("@kategori", ddlstatus.SelectedValue);
            //com.Parameters.AddWithValue("@gender", rbJK.SelectedValue);
            ////com.Parameters.AddWithValue("@pendidikanTerakhir", ddlpdkakhir.SelectedValue);
            ///com.Parameters.AddWithValue("@abstract", TxtTambahAbstrak.Text);


            //con.Open();
            
            //con.Close();
            loadData();
            //clear();
            ViewSubAbstrak.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnAddCancel_Click(object sender, EventArgs e)
        {
            TambahAbstrak.Visible = false;
            ViewSubAbstrak.Visible = true;
            BtnAction.Visible = true;
            
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

        protected void BtnSearchAut_Click(object sender, EventArgs e)
        {

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "stp_getUserbyName";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaUser", TxtSearchAuthor.Text);
            SqlDataReader sdr = com.ExecuteReader();
            sdr.Read();
            TxtTambahId.Text = sdr["IdUser"].ToString();
            TxtTambahNama.Text = sdr["namaUser"].ToString();
            TxtTambahEmail.Text = sdr["email"].ToString();
            TxtTambahAlamat.Text = sdr["address"].ToString();
            TxtTambahInstansi.Text = sdr["instance"].ToString();
            TxtTambahHP.Text = sdr["phone"].ToString();
            TxtTambahJS.Text = sdr["kategori"].ToString();
            TxtTambahPddT.Text = sdr["LastEducation"].ToString();
            TxtTambahJK.Text= sdr["gender"].ToString();
            con.Close();

            //using (SqlCommand cmd = new SqlCommand("SELECT IdAuthor, namaUser, email FROM users WHERE namaUser = Aditya Arya Pratama"))
            //{
            //    cmd.CommandType = CommandType.Text;
            //    cmd.Connection = con;
            //    con.Open();
            //    using (SqlDataReader sdr = cmd.ExecuteReader())
            //    {
            //        sdr.Read();
            //        TxtTambahNama.Text = sdr["IdAuthor"].ToString();
            //        TxtTambahEmail.Text = sdr["namaUser"].ToString();
            //        TxtTambahAlamat.Text = sdr["email"].ToString();
            //    }
            //    con.Close();
            //}
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {

        }

       
    }
}