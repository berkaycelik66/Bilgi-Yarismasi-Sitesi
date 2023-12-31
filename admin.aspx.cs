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
    public partial class admin : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        int soruSayfa = 1;
        int userSayfa = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                soruPanel();
                kullaniciPanel();
            }
        }

        protected void soruPanel()
        {
            baglan.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from questions", baglan);
            DataTable dt = new DataTable();
            da.Fill(dt);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true; //Sayfalama aktif olması için
            pds.PageSize = 2; //Bir sayfadaki kayıt sayısı


            if (Request.QueryString["soruSayfa"] != null)
            {
                soruSayfa = Convert.ToInt32(Request.QueryString["soruSayfa"]);
            }
            else
            {
                soruSayfa = 1;
            }

            pds.CurrentPageIndex = soruSayfa - 1;

            for (int i = 1; i <= pds.PageCount; i++)
            {
                HyperLink hyper = new HyperLink();
                hyper.Text = i.ToString();
                hyper.NavigateUrl = "admin.aspx?soruSayfa=" + i + "&userSayfa=" + userSayfa;

                pnlsyf.Controls.Add(hyper);
            }

            rpt1.DataSource = pds;
            rpt1.DataBind();
            baglan.Close();
        }

        protected void kullaniciPanel()
        {
            baglan.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from users", baglan);
            DataTable dt = new DataTable();
            da.Fill(dt);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true; //Sayfalama aktif olması için
            pds.PageSize = 2; //Bir sayfadaki kayıt sayısı


            if (Request.QueryString["userSayfa"] != null)
            {
                userSayfa = Convert.ToInt32(Request.QueryString["userSayfa"]);
            }
            else
            {
                userSayfa = 1;
            }

            pds.CurrentPageIndex = userSayfa - 1;

            for (int i = 1; i <= pds.PageCount; i++)
            {
                HyperLink hyper = new HyperLink();
                hyper.Text = i.ToString();
                hyper.NavigateUrl = "admin.aspx?soruSayfa=" + soruSayfa + "&userSayfa=" + i;

                pnlsyf2.Controls.Add(hyper);
            }

            rpt2.DataSource = pds;
            rpt2.DataBind();
            baglan.Close();
        }
    }
}