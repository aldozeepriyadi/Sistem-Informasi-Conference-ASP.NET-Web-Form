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
    public partial class KelProsiding : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        string filename, fileimg;
        string file;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                loadcb(DDLTambahEvent);
                ViewProsiding.Visible = true;
                //LblUser.Text = Session["IdUser"].ToString();
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

        protected void DGProsiding_Sorting(object sender, GridViewSortEventArgs e)
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

        protected void DGProsiding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        protected void DGProsiding_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGProsiding.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {

        }


        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT u.[year], u.[title], a.namaUser, e.nameEvent, u.[ProsidingFile], u.[ProsidingImg] FROM [prosidingbook] as u join event as e on u.IdEvent = e.IdEvent join users as a on u.IdUser = a.IdUser"))

            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGProsiding.DataSource = dTable;
                    DGProsiding.DataBind();
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

        private void SortGridView(string sortExpression, string direction)
        {

        }
        protected void ENameLinkBtn_Click(object sender, CommandEventArgs e)
        {
            string path = Server.MapPath(e.CommandArgument.ToString());
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(path);


            if (buffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }

        protected void BtnSubmitAdd_Click(object sender, EventArgs e)
        {

            try
            {
                filename = Path.GetFileName(fileupload.PostedFile.FileName);
                fileupload.SaveAs(Server.MapPath( filename));
                fileimg = Path.GetFileName(fileuploadimg.PostedFile.FileName);
                fileuploadimg.SaveAs(Server.MapPath("~/ProsidingImg/"+fileimg));

            }
            catch (Exception ex)
            {

            }

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "InsertProsiding";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@year", TxtTambahTahun.Text.ToUpper());
            com.Parameters.AddWithValue("@IdEvent", Convert.ToInt32(DDLTambahEvent.SelectedValue));
            com.Parameters.AddWithValue("@title", TxtTambahJudul.Text.ToUpper());
            com.Parameters.AddWithValue("@ProsidingFile", filename);
            com.Parameters.AddWithValue("@ProsidingImg", fileimg);
            com.Parameters.AddWithValue("@IdUser", Convert.ToInt32(Session["IdUser"]));


            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            loadData();

            Response.Redirect(Request.RawUrl);

        }

        protected void BtnCancelAdd_Click(object sender, EventArgs e)
        {

        }

        protected void ProsidingImg_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string filelocation = DGProsiding.Rows[rowIndex].Cells[6].Text;

            string FilePath = Server.MapPath(filelocation);
            //WebClient User = new WebClient();
            //Byte[] FileBuffer = User.DownloadData(FilePath);

            //if (FileBuffer != null)
            //{
            //    Response.ContentType = "application/pdf";
            //    Response.AddHeader("Content-disposition", "inline");
            //    Response.BinaryWrite(FileBuffer.ToArray());
            //    Response.AddHeader("content-lenght", FileBuffer.Length.ToString());
            //    Response.BinaryWrite(FileBuffer.ToArray());

            //}

            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(FilePath);

            if (buffer != null)
            {
                Response.ContentType = "application/img";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }

        

        protected void ProsidingFile_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string filelocation = DGProsiding.Rows[rowIndex].Cells[5].Text;

            string FilePath = Server.MapPath(filelocation);
            //WebClient User = new WebClient();
            //Byte[] FileBuffer = User.DownloadData(FilePath);

            //if (FileBuffer != null)
            //{
            //    Response.ContentType = "application/pdf";
            //    Response.AddHeader("Content-disposition", "inline");
            //    Response.BinaryWrite(FileBuffer.ToArray());
            //    Response.AddHeader("content-lenght", FileBuffer.Length.ToString());
            //    Response.BinaryWrite(FileBuffer.ToArray());

            //}

            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(FilePath);

            if (buffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }

        }

    }
}