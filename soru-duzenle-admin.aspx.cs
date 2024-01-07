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
    public partial class soru_duzenle_admin : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        static string url;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    baglan.Open();
                    string id = Request.QueryString["id"];
                    SqlDataAdapter da = new SqlDataAdapter("select * from questions where id='" + id + "'", baglan);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    object question = dt.Rows[0]["question"];
                    object true_answer = dt.Rows[0]["true_answer"];
                    object false_answer1 = dt.Rows[0]["false_answer1"];
                    object false_answer2 = dt.Rows[0]["false_answer2"];
                    object false_answer3 = dt.Rows[0]["false_answer3"];
                    object category = dt.Rows[0]["category"];
                    TextBox1.Text = question.ToString();
                    TextBox2.Text = true_answer.ToString();
                    TextBox3.Text = false_answer1.ToString();
                    TextBox4.Text = false_answer2.ToString();
                    TextBox5.Text = false_answer3.ToString();
                    DropDownList1.Text = category.ToString();
                    baglan.Close();
                    url = Request.UrlReferrer.ToString();
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
                    SqlCommand cmd = new SqlCommand("update questions set question='" + TextBox1.Text + "', true_answer='" + TextBox2.Text + "', false_answer1='" + TextBox3.Text + "', false_answer2='" + TextBox4.Text + "', false_answer3='" + TextBox5.Text + "', category='" + DropDownList1.Text + "', state='false' where id='" + id + "'", baglan);
                    cmd.ExecuteNonQuery();
                    baglan.Close();
                    Label1.Text = "Soru Gönderildi. Onaylandıktan sonra Yarışmaya Eklenecektir.";
                    Label1.BackColor = System.Drawing.Color.LightGreen;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(url.ToString());
        }
    }
}