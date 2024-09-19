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
    public partial class riwabstak : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMCConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                ViewRiwayatAbstrak.Visible = true;



            }
        }


        public void loadData()
        {

            using (SqlCommand cmd = new SqlCommand("SELECT a.[title], a.[IdAbstrak], a.[Topic], a.[statusDistribusi], a.[deadlineRevisi], a.[kataKunci] FROM [abstrak] as a join detailabstrak as d on a.IdAbstrak = d.IdAbstrak where  reviewedby='" + Session["IdUser"].ToString() + "'"))
            {

                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;
                    
                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGRiwayatAbstrak.DataSource = dTable;
                    DGRiwayatAbstrak.DataBind();

                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void DGRiwayatAbstrak_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void DGRiwayatDetailAbstrak_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}