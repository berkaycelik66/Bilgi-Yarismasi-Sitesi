using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace YarismaSitesi
{
    public partial class kullanici : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            object user = Session["username"];
            String username = Request.QueryString["uname"];
            Label1.Text = username + "'nin Profili";

            if (username == user.ToString())
            {
                pnlQuestions.Visible = true;
            }
            else
            {
                pnlQuestions.Visible = false;
            }

            baglan.Open();

            /*Kullanıcının Puanları*/
            SqlDataAdapter da = new SqlDataAdapter("select * from pointsList where username='"+username+ "' ORDER BY dates DESC", baglan);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            /*Kullanıcının Eklediği Sorular*/
            SqlDataAdapter da2 = new SqlDataAdapter("select * from questions where sender='"+ username+ "'", baglan);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
            baglan.Close();
        }
    }
}