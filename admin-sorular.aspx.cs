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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Session["task"].Equals("admin"))
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

            string selectedCategory = DropDownList1.SelectedValue;
            string selectedApprovalStatus = DropDownList2.SelectedValue;

            // Build the SQL query based on selected filters
            string query = "SELECT * FROM questions WHERE 1=1";

            if (selectedCategory != "Seçiniz")
            {
                query += " AND category = @Category";
            }

            if (selectedApprovalStatus != "Seçiniz")
            {
                query += " AND state = @State";
            }

            SqlDataAdapter da = new SqlDataAdapter(query, baglan);

            if (selectedCategory != "Seçiniz")
            {
                da.SelectCommand.Parameters.AddWithValue("@Category", selectedCategory);
            }

            if (selectedApprovalStatus != "Seçiniz")
            {
                bool isApproved = selectedApprovalStatus.Equals("Onaylandı", StringComparison.OrdinalIgnoreCase);
                da.SelectCommand.Parameters.AddWithValue("@State", isApproved);
            }

            DataTable dt = new DataTable();
            da.Fill(dt);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true; //Sayfalama aktif olması için
            pds.PageSize = 2; //Bir sayfadaki kayıt sayısı

            int soruSayfa;
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

                pnlsyf.Controls.Add(hyper);
            }

            rpt1.DataSource = pds;
            rpt1.DataBind();
            baglan.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call the function or perform actions when the selected index changes
            soruPanel();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call the function or perform actions when the selected index changes
            soruPanel();
        }
    }
}