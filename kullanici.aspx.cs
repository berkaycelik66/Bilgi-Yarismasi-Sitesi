using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class kullanici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            object user = Session["username"];
            String username = Request.QueryString["uname"];

            /*if (username == user.ToString())
            {

            }
            else
            {
                Response.Redirect("anasayfa.aspx");
            }*/
        }
    }
}