using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class puan_sil : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null && Session["username"] != null)
            {
                baglan.Open();
                string id = Request.QueryString["id"];
                object user = Session["username"];
                SqlDataAdapter da = new SqlDataAdapter("select * from pointsList where id='" + id + "'", baglan);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    object username = dt.Rows[0]["username"];
                    if (user.ToString() == username.ToString())
                    {

                        SqlCommand cmd = new SqlCommand("delete from pointsList where id='" + id + "'", baglan);
                        cmd.ExecuteNonQuery();
                        baglan.Close();
                        Response.Redirect("kullanici.aspx?uname=" + user + "&YarışmaSil=ok");
                    }
                    else
                    {
                        baglan.Close();
                        Response.Redirect("kullanici.aspx?uname=" + user + "&YarışmaSil=hata");

                    }
                }
            }
            else
            {
                Response.Redirect("anasayfa.aspx");
            }
        }
    }
}