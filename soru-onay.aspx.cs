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
    public partial class soru_onay : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                baglan.Open();
                string id = Request.QueryString["id"];
                object task = Session["task"];
                if (task.ToString() == "admin")
                {
                    SqlDataAdapter da = new SqlDataAdapter("select * from questions where id='" + id + "'", baglan);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    bool state = Convert.ToBoolean(dt.Rows[0]["state"]);
                    if (state == false)
                    {
                        SqlCommand cmd = new SqlCommand("update questions set state='true' where id='" + id + "'", baglan);
                        cmd.ExecuteNonQuery();
                        baglan.Close();
                        Response.Redirect(Request.UrlReferrer.ToString());
                    }
                    else if (state == true)
                    {
                        SqlCommand cmd = new SqlCommand("update questions set state='false' where id='" + id + "'", baglan);
                        cmd.ExecuteNonQuery();
                        baglan.Close();
                        Response.Redirect(Request.UrlReferrer.ToString());

                    }
                }
                else
                {
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
