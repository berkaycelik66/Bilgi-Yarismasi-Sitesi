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
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            object user = Session["username"];
            String username = Request.QueryString["uname"];
            if (username == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            else if (usernameCheck(username))
            {
                Label1.Text = username + " Adlı Kullanıcının Profili";
                if (user != null)
                {
                    if (username == user.ToString())
                    {
                        Label1.Text ="Profilim";
                        pnlQuestions.Visible = true;
                    }
                    else
                    {
                        pnlQuestions.Visible = false;
                    }
                }
                else
                {
                    pnlQuestions.Visible = false;
                }

                baglan.Open();

                /*Kullanıcının Puanları*/
                SqlDataAdapter da = new SqlDataAdapter("select * from pointsList where username='" + username + "' ORDER BY dates DESC", baglan);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else
                {
                    if (user != null && user.ToString() != username)
                    {
                        Label2.Visible = true;
                        Label2.Text = "Bu kullanıcıya ait henüz yarışma bilgisi bulunmamaktadır.";
                    }
                    else if(user == null)
                    {
                        Label2.Visible = true;
                        Label2.Text = "Bu kullanıcıya ait henüz yarışma bilgisi bulunmamaktadır.";
                    }
                    
                }

                /*Kullanıcının Eklediği Sorular*/
                SqlDataAdapter da2 = new SqlDataAdapter("select * from questions where sender='" + username + "' or sender='" + username + "@admin' ORDER BY id DESC", baglan);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                Repeater2.DataSource = dt2;
                Repeater2.DataBind();
                baglan.Close();
            }
            else
            {
                Label1.Text = "Böyle bir kullanıcı mevcut değildir.";
                pnlQuestions.Visible = false;
                pnlPoints.Visible = false;
            }
        }

        protected Boolean usernameCheck(String username)
        {
            baglan.Open();
            SqlCommand cmd = new SqlCommand("select * from users where username= '" + username + "'", baglan);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                baglan.Close();
                return true;
            }
            else
            {
                baglan.Close();
                return false;
            }

        }
    }
}