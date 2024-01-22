using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class admin_sorular : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        int soruSayfa;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["task"] == null || !Session["task"].Equals("admin"))
                {
                    Response.Redirect("anasayfa.aspx");
                }
                else
                {
                    soruPanel();
                }
            }
        }

        protected void soruPanel()
        {
            baglan.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM questions ORDER BY id DESC", baglan);
            DataTable dt = new DataTable();
            da.Fill(dt);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true; //Sayfalama aktif olması için
            pds.PageSize = 10; //Bir sayfadaki kayıt sayısı

            
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
                hyper.NavigateUrl = "admin-sorular.aspx?soruSayfa=" + i;
                if (i == soruSayfa)
                {
                    hyper.CssClass = "current-page";
                }
                pnlsyf.Controls.Add(hyper);
            }

            rpt1.DataSource = pds;
            rpt1.DataBind();
            baglan.Close();
        }
    }
}