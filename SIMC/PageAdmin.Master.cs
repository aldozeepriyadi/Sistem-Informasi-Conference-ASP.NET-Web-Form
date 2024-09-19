using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMC
{
    public partial class PageAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["namaUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["role"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            LblName.Text = Session["namaUser"].ToString();
            LblRole.Text = Session["role"].ToString();
        }

        protected void btnKeluar_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}