using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class engel : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                baglan.Open();
                string id = Request.QueryString["id"];
                SqlDataAdapter da = new SqlDataAdapter("select * from users where id='" + id + "'", baglan);
                DataTable dt = new DataTable();
                da.Fill(dt);
                string task = dt.Rows[0]["task"].ToString();
                if (task != "banned" && task != "admin")
                {
                    SqlCommand cmd = new SqlCommand("update users set task='banned' where id='" + id + "'", baglan);
                    cmd.ExecuteNonQuery();
                    baglan.Close();
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
                else if(task == "banned")
                {
                    SqlCommand cmd = new SqlCommand("update users set task='user' where id='" + id + "'", baglan);
                    cmd.ExecuteNonQuery();
                    baglan.Close();
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
            }
            else
            {
                Response.Redirect("anasayfa.aspx");
            }
        }
    }
}