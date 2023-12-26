using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class anasayfa1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object user = Session["username"];

            if(user != null)
            {
                pnlGiris.Visible = false; 
                pnlUser.Visible = true;
                lblKullaniciAdi.Text = user.ToString();
            }
            else
            {
                pnlGiris.Visible = true;
                pnlUser.Visible = false;

            }
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("giris.aspx");
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            Response.Redirect("kayit.aspx");
        }
    }
}