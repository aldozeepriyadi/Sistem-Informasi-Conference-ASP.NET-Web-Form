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
    public partial class iframe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                
                ViewProsiding.Visible = false;
                //LblUser.Text = Session["IdUser"].ToString();
            }
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT u.[year], u.[title], a.namaUser, e.nameEvent, u.[ProsidingFile], u.[ProsidingImg] FROM [prosidingbook] as u join event as e on u.IdEvent = e.IdEvent join users as a on u.IdUser = a.IdUser"))

            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    

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
    }
}