using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class yarismaya_basla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenelSorular_Click(object sender, EventArgs e)
        {
            Session["YarismaK"] = "Genel";
            Response.Redirect("yarisma.aspx");
        }

        protected void btnSanat_Click(object sender, EventArgs e)
        {
            Session["YarismaK"] = "Sanat";
            Response.Redirect("yarisma.aspx");
        }

        protected void btnSpor_Click(object sender, EventArgs e)
        {
            Session["YarismaK"] = "Spor";
            Response.Redirect("yarisma.aspx");
        }

        protected void btnTarih_Click(object sender, EventArgs e)
        {
            Session["YarismaK"] = "Tarih";
            Response.Redirect("yarisma.aspx");
        }
    }
}