using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class SubFullpaperr : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        string filefpp, fileppt;
        static string namaFile;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                ViewSubFullpaper.Visible = true;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT a.[title], a.[IdAbstrak], a.[Topic], f.[statusDistribusi], e.[nameEvent], d.[statusKarya], f.[reviewedby], f.[submittedby], d.[keterangan], p.[statusPayment] FROM[fullpaper] as f join abstrak as a on f.IdAbstract = a.IdAbstrak join detailabstrak as d on a.IdAbstrak = d.IdAbstrak join payment as p on a.IdAbstrak = p.IdAbstract  join event as e on a.IdEvent=e.IdEvent where d.[statusKarya] ='Diterima' and p.statusPayment= 'Diterima' and a.submittedby = ' " + Session["IdUser"].ToString() + "'"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGSubFullpaper.DataSource = dTable;
                    DGSubFullpaper.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {

        }

        

        protected void DGSubFullpaper_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void DGSubFullpaper_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void BtnAddSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void BtnAddCancel_Click(object sender, EventArgs e)
        {

        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {


            string temp = "0";
            int idabstrak, idfullpaper;
            idabstrak = Convert.ToInt32(TxtIdAbstract.Text);

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "UpdateFullpaper";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@statusDistribusi", "Sudah dikirim");
            com.Parameters.AddWithValue("@submittedby", Convert.ToInt32(Session["IdUser"]));
            com.Parameters.AddWithValue("@modifiedby", Convert.ToInt32(Session["IdUser"]));
            com.Parameters.AddWithValue("@IdAbstract", idabstrak);
            com.ExecuteNonQuery();
            con.Close();


            string pathfoto1 = "";
            string pathfoto2 = "";
            string pathfolderfoto1 = "~/FileFPP/";
            string pathfolderfoto2 = "~/FilePPT/";
            string date = DateTime.Now.ToString("yyMMddhhmmss");
            string saveDir = @"\Image\";
            string appPath = Request.PhysicalApplicationPath;

            using (SqlCommand cmd = new SqlCommand("select * from fullpaper where IdAbstract = '" + idabstrak + "'"))
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
                        temp = dr["IdFullpaper"].ToString();
                        Session["IdFullpaper"] = dr["IdFullpaper"].ToString();
                        //lblllllcoba.Text = Session["IdAbstrak"].ToString();
                    }
                  
                }
                con.Close();
            }


            if (fileuploadPdfFpp.HasFile && fileuploadPpt.HasFile)
            {
                try
                {
                    //validasi size file
                    //guard if else
                    if (fileuploadPdfFpp.PostedFile.ContentLength > 100485760 )
                    {
                        Response.Write("<script>alert('Fullpaper berhasil disimpan’');</script>");
                        return;
                    }

                    if (fileuploadPpt.PostedFile.ContentLength > 100485760 )
                    {
                        Response.Write("<script>alert('konten PPT konten harus lebih dari 2 mb dan kurang dari 10 mb');</script>");
                        return;
                    }


                    namaFile = date + "_" + fileuploadPdfFpp.FileName.ToString();
                    fileuploadPdfFpp.PostedFile.SaveAs(Server.MapPath(pathfolderfoto1 + namaFile));
                    pathfoto1 = pathfolderfoto1 + namaFile;

                    namaFile = date + "_" + fileuploadPpt.FileName.ToString();
                    fileuploadPpt.PostedFile.SaveAs(Server.MapPath(pathfolderfoto2 + namaFile));
                    pathfoto2 = pathfolderfoto2 + namaFile;

                    string[] allowedExtensions = { ".pptx", ".pdf" };
                    string extensionPhoto1 = Path.GetExtension(pathfoto1);
                    string extensionPhoto2 = Path.GetExtension(pathfoto2);

                    if (!allowedExtensions.Contains(extensionPhoto1) && !allowedExtensions.Contains(extensionPhoto2))
                    {
                        Response.Write("<script>alert('Jenis ekstensi file tidak diperbolehkan!');</script>");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>Console.log('" + ex.Message + "');</script>");
                }
            }


            con.Open();
            idfullpaper = Convert.ToInt32(temp);
            SqlCommand ipt = new SqlCommand();
            ipt.Connection = con;
            ipt.CommandText = "InsertDetailFPP";
            ipt.CommandType = CommandType.StoredProcedure;
            ipt.Parameters.AddWithValue("@PresentationFile", pathfoto1);
            ipt.Parameters.AddWithValue("@FullpaperFile", pathfoto2 );
            ipt.Parameters.AddWithValue("@VideoLink", TxtTambahLink.Text);
            ipt.Parameters.AddWithValue("@statusKarya", "");
            ipt.Parameters.AddWithValue("@modifieddate", DateTime.Now);
            ipt.Parameters.AddWithValue("@keterangan", "");
            ipt.Parameters.AddWithValue("@IdFullpaper", idfullpaper);


            ipt.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

        }

        //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        TableCell cell = e.Row.Cells[1];
        //        int quantity = int.Parse(cell.Text);
        //        if (quantity == 0)
        //        {
        //            cell.BackColor = Color.Red;
        //        }
        //        if (quantity > 0 && quantity <= 50)
        //        {
        //            cell.BackColor = Color.Yellow;
        //        }
        //        if (quantity > 50 && quantity <= 100)
        //        {
        //            cell.BackColor = Color.Orange;
        //        }
        //    }
        //}
    }
}