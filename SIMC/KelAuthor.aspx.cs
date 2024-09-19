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
    public partial class KelAuthor : System.Web.UI.Page
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
                ViewAuthor.Visible = true;
            }
        }

        protected void DGAuthor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGAuthor.PageIndex = e.NewPageIndex;
            loadData();
        }

        public void bind()
        {

        }

        protected void DGAuthor_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void DGAuthor_Sorting(object sender, GridViewSortEventArgs e)
        {
            //string sortExpression = e.SortExpression;

            //if (GridViewSortDirection == SortDirection.Ascending)
            //{
            //    GridViewSortDirection = SortDirection.Descending;
            //    SortGridView(sortExpression, DESCENDING);
            //}
            //else
            //{
            //    GridViewSortDirection = SortDirection.Ascending;
            //    SortGridView(sortExpression, ASCENDING);
            //}
        }
        public void loadData()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT u.[email], u.[namaUser], u.[role], u.[address], u.[instance], u.[phone], u.[gender], u.[kategori],e.nameEvent,e.IdEvent, u.[LastEducation], u.[IdUser] FROM [users] as u join event as e on u.IdEvent = e.IdEvent where u.role='Author'"))
            {
                SqlDataAdapter dt = new SqlDataAdapter();
                try
                {
                    cmd.Connection = con;
                    con.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    DGAuthor.DataSource = dTable;
                    DGAuthor.DataBind();
                }
                catch(Exception ex)
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

        //private void SortGridView(string sortExpression, string direction)
        //{
        //    DataTable dt = loadData().Tables[0];

        //    DataView dv = new DataView(dt);
        //    dv.Sort = sortExpression + direction;

        //    DGAuthor.DataSource = dv;
        //    DGAuthor.DataBind();
        //}
    }
}