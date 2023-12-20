using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class soru_gonder : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            baglan.Open();
            object user = Session["username"];
            if (user != null)
            {
                if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox5.Text) || DropDownList1.Text.Equals("Seçiniz"))
                {
                    Label1.Text = "Lütfen tüm alanları doldurun.";
                    Label1.BackColor = System.Drawing.Color.Red;
                }
                else
                {
                    TextBox1.Text = TextBox1.Text.Replace("'", "’");
                    TextBox2.Text = TextBox2.Text.Replace("'", "’");
                    TextBox3.Text = TextBox3.Text.Replace("'", "’");
                    TextBox4.Text = TextBox4.Text.Replace("'", "’");
                    TextBox5.Text = TextBox5.Text.Replace("'", "’");

                    SqlCommand cmd = new SqlCommand("insert into questions(question,true_answer,false_answer1,false_answer2,false_answer3,category,sendername,state) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + DropDownList1.Text + "','" + user.ToString() + "','false')", baglan);

                    cmd.ExecuteNonQuery();
                    Label1.Text = "Soru Gönderildi. Onaylandıktan sonra Yarışmaya Eklenecektir.";
                    Label1.BackColor = System.Drawing.Color.LightGreen;
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                }    
            }
            else
            {
                Label1.Text = "Soru Göndermek için Lütfen Giriş Yapınız.";
                Label1.BackColor = System.Drawing.Color.Red;
            }

            baglan.Close();
        }
    }
}