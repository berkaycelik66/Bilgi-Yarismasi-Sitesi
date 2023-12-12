using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class giris : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            object user = Session["username"];

            if (user != null)
            {
                Response.Redirect("anasayfa.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            baglan.Open();

            SqlCommand cmd = new SqlCommand("select * from users where (mail='" + TextBox1.Text + "' or username= '" + TextBox1.Text + "') " + "and password='" + TextBox2.Text + "'", baglan);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session.Add("username", dr["username"].ToString());
                Label1.BackColor = System.Drawing.Color.LightGray;
                Label1.Text = "Hoşgeldin " + TextBox1.Text;
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                Label1.BackColor = System.Drawing.Color.Red;
                Label1.Text = "Hatalı Giriş Bilgilerini Kontrol Et";
            }

            baglan.Close();
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("giris.aspx");
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            Response.Redirect("kayit.aspx");
        }
    }
}