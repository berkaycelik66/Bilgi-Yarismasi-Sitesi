using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
	public partial class soru_sil : System.Web.UI.Page
	{
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["id"] != null)
            {
                baglan.Open();
                string id = Request.QueryString["id"];
                object user = Session["username"];
                SqlDataAdapter da = new SqlDataAdapter ("select * from questions where id='"+id+"'",baglan);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    object senderValue = dt.Rows[0]["sender"];  
                    if (user.ToString() == senderValue.ToString())
                    {
                        
                        SqlCommand cmd = new SqlCommand("delete from questions where id='" + id + "'", baglan);
                        cmd.ExecuteNonQuery();
                        baglan.Close();
                        Response.Redirect("kullanici.aspx?uname=" + user + "&SoruSil=ok");
                    }
                    else
                    {
                        baglan.Close();
                        Response.Redirect("kullanici.aspx?uname= " + user + "&SoruSil=hata");
                        
                    }
                }
            }
            else
            {
                Response.Redirect("anasayfa.aspx");
            }
        }
    }
}