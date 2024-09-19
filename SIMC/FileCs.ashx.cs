using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SIMC
{
    /// <summary>
    /// Summary description for FileCs
    /// </summary>
    public class FileCs : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int id = int.Parse(context.Request.QueryString["IdProsiding"]);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT year, title, IdUser, IdEvent,ProsidingFile FROM prosidingBook WHERE IdUser=@IdUser";
                    cmd.Parameters.AddWithValue("@IdProsiding", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["title"].ToString();
                    }
                    con.Close();
                }
            }

            context.Response.Buffer = true;
            context.Response.Charset = "";
            if (context.Request.QueryString["download"] == "1")
            {
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            }
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.ContentType = "application/pdf";
            context.Response.BinaryWrite(bytes);
            context.Response.Flush();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}