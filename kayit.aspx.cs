using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class kayit : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

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
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text))
            {
                Label1.Text = "Lütfen tüm alanları doldurun.";
                Label1.BackColor = System.Drawing.Color.Red;
            }
            else
            {
                // TextBox'lar boş değilse, veritabanına ekleme işlemini gerçekleştir
                baglan.Open();
                SqlCommand cmd = new SqlCommand("insert into users(mail,username,password,task) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','user')", baglan);

                cmd.ExecuteNonQuery();

                Label1.Text = "Kayıt Başarılı";
                Label1.BackColor = System.Drawing.Color.ForestGreen;
                TextBox1.Text = "";
                TextBox2.Text = "";
                baglan.Close();
            }

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