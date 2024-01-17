using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class top_list : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack == true))
            {
                String category = Request.QueryString["k"];

                SqlDataAdapter da;
                baglan.Open();
                if (category == null)
                {
                    da = new SqlDataAdapter("select * from pointsList ORDER BY points DESC, dates ASC", baglan);
                }
                else
                {
                    da = new SqlDataAdapter("select * from pointsList where category='" + category + "' ORDER BY points DESC, dates ASC", baglan);
                }
                
                DataTable dt = new DataTable();
                da.Fill(dt);

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                baglan.Close();

            }
        }
    }
}