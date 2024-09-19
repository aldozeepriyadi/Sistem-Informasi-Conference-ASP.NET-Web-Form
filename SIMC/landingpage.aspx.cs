using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;

namespace SIMC
{
    public partial class landingpage : System.Web.UI.Page
    {
            public int rowcount = 0;
            public int rowcolumn = 0;
            SqlCommand cmd;
            SqlDataAdapter da;
            DataSet ds;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);

            string strConnString = ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString;
            string str;
            SqlCommand com;
            SqlDataAdapter sqlda;
            DataTable dt;
            int RowCount;
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                Bind();
                loadData();
                loadDataBiaya();
                    RepeterData();
                

            }
        }
            public void Bind()
            {
                SqlCommand cmd = new SqlCommand("Select * from prosidingbook", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "prosidingbook");
                dl1.DataSource = ds.Tables[0];
                dl1.DataBind();
            }
            public void loadData()
            {
                SqlConnection con = new SqlConnection(strConnString);

                str = "Select p.ProsidingImg, e.topic, p.title ,p.IdEvent, p.IdProsiding,p.ProsidingFile from prosidingbook p join event e on p.IdEvent = e.IdEvent where p.year='" + DateTime.Now.Year.ToString() + "'";
                com = new SqlCommand(str);
                sqlda = new SqlDataAdapter(com.CommandText, con);
                dt = new DataTable();
                sqlda.Fill(dt);
                RowCount = dt.Rows.Count;
                for (int i = 0; i < RowCount; i++)
                {
                    lbltitle.Text = dt.Rows[i]["title"].ToString();
                    lbltopik.Text = dt.Rows[i]["topic"].ToString();
                    Image1.ImageUrl= Page.ResolveUrl("~/ProsidingImg/") + dt.Rows[i]["ProsidingImg"].ToString();
                //detailsButton.Attributes["href"] = Page.ResolveUrl("~/ProsidingFile/") + dt.Rows[i]["ProsidingFile"].ToString();
                ENameLinkBtn.CommandArgument = dt.Rows[i]["ProsidingFile"].ToString();


                string IdEvent = dt.Rows[i]["IdEvent"].ToString();
                }

            }
   
        public void RepeterData()
            {
                con.Open();
                cmd = new SqlCommand("Select p.tanggalAwal, p.tanggalAkhir, p.kategori from SubEvent p join event e on p.IdEvent = e.IdEvent where e.statusEvent='Aktif' AND YEAR(e.tanggalAkhir)='" + DateTime.Now.Year.ToString() + "'", con);
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                RepterDetails.DataSource = ds;
                RepterDetails.DataBind();
            }


        protected void datalist1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "MoreDetailsPlease")
            {
                string url = Page.ResolveUrl("~/ProsidingFile/") + e.CommandArgument.ToString();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "myalert", "javascript:openModalPopup('" + url + "');", true);
                string path = Server.MapPath(e.CommandArgument.ToString());
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(path);


                if (buffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", buffer.Length.ToString());
                    Response.BinaryWrite(buffer);
                }




                //url now holds the url of the clicked on link
            }
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

        public void loadDataBiaya()
        {
            SqlConnection con = new SqlConnection(strConnString);
            string pmklh=null, ung=null;
            str = "Select * from event where statusEvent='Aktif' AND YEAR(tanggalAkhir)='" + DateTime.Now.Year.ToString() + "'";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
               ung = dt.Rows[i]["biaya"].ToString();
               pmklh = dt.Rows[i]["kategori"].ToString();
        
                
            }

            char[] delimiterChars = { ' '};

            string text = ung;

            string[] words = text.Split(delimiterChars);

            uang1.Text = words[0];
            uang2.Text = words[1];

            char[] chrs = { ' ' };

            string jns = pmklh;

            string[] kata = jns.Split(chrs);

            pemakalah1.Text = kata[0];
            pemakalah2.Text = kata[1];

        }
    }
}
