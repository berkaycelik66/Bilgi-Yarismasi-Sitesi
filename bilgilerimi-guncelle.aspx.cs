using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;
using System.Threading.Tasks;

namespace YarismaSitesi
{
    public partial class bilgilerimi_guncelle : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        static object password;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["guncel"] == "ok")
                {
                    Label1.Text = "Bilgileriniz Başarıyla Güncellenmiştir.";
                    Label1.BackColor = System.Drawing.Color.LightGreen;
                }
                if (Request.QueryString["id"] != null &&
                    Request.QueryString["id"].ToString() == Session["id"].ToString())
                {
                    baglan.Open();
                    string id = Request.QueryString["id"];
                    object user = Session["username"];
                    SqlDataAdapter da = new SqlDataAdapter("select * from users where id='" + id + "'", baglan);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        object username = dt.Rows[0]["username"];
                        if (user.ToString() == username.ToString())
                        {
                            object mail = dt.Rows[0]["mail"];
                            password = dt.Rows[0]["password"];
                            TextBox1.Text = mail.ToString();
                            TextBox2.Text = username.ToString();
                            baglan.Close();
                        }
                    }

                }
                else
                {
                    Response.Redirect("anasayfa.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            baglan.Open();
            string id = Request.QueryString["id"];
            object user = Session["username"];
            if (user != null)
            {
                if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text))
                {
                    Label1.Text = "Lütfen tüm alanları doldurun.";
                    Label1.BackColor = System.Drawing.Color.Red;
                }
                else
                {

                    if (password.ToString() == TextBox3.Text)
                    {
                        TextBox1.Text = TextBox1.Text.Replace("'", "’");
                        TextBox2.Text = TextBox2.Text.Replace("'", "’");
                        TextBox3.Text = TextBox3.Text.Replace("'", "’");

                        if (string.IsNullOrEmpty(TextBox4.Text))
                        {
                            SqlCommand cmd = new SqlCommand("update users set mail='" + TextBox1.Text + "', username='" + TextBox2.Text + "' where id='" + id + "'", baglan);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("update users set mail='" + TextBox1.Text + "', username='" + TextBox2.Text + "', password='" + TextBox4.Text + "' where id='" + id + "'", baglan);
                            cmd.ExecuteNonQuery();
                        }

                        baglan.Close();
                        senderGuncelle(user.ToString(), TextBox2.Text);
                        TextBox3.Text = "";
                        TextBox4.Text = "";
                        password = null;
                        Session["username"] = TextBox2.Text;
                        Response.Redirect("bilgilerimi-guncelle.aspx?id=" + id + "&guncel=ok");
                    }
                    else
                    {
                        Label1.Text = "Mevcut Şifreniz Hatalıdır.";
                        Label1.BackColor = System.Drawing.Color.Red;
                    }

                }
            }
        }

        protected void senderGuncelle(string oldUsername, string newUsername)
        {
            baglan.Open();

            if (Session["task"].ToString() == "admin")
            {
                SqlCommand cmd = new SqlCommand("update questions set sender='" + newUsername + "'@admin where sender='" + oldUsername + "@admin'", baglan);
                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update questions set sender='" + newUsername + "' where sender='" + oldUsername + "'", baglan);
                cmd.ExecuteNonQuery();
            }
            
            baglan.Close();
        }
    }
}