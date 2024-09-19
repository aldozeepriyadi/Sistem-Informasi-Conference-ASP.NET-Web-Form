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
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SIMC1ConnectionString"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                
                ViewUser.Visible = true;
            }
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT  a.[title], c.[statusPayment] ,e.[NameEvent] FROM [payment] as c  join abstrak as a on c.IdAbstrak= a.IdAbstrak join event as e on a.IdEvent = e.IdEvent"))
                { 
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGUser.DataSource = dTable;
                    DGUser.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

    }
}