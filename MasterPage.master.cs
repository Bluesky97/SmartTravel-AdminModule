using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//INFT 3970 - FYP Project
//Start Date : 10th May 2018
//Submission Date : 1st August 2018
//Names     :Andrian Alexander Putra(c3271469)
//          :Zhang Chuhan(c3270145)
//          :Thet Paing Htun(c3271285)
//          :Hay Marn Oo(c3271471)
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
        {
            //show admin is login
            btnUser.Text = Session["admin"].ToString();
            btnLogin.Text = "Logout";
        }
        else
        {
            btnUser.Text = "";
            btnLogin.Text = "Login";
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //transfer page to the login form
        if (btnLogin.Text == "Login")
            Server.Transfer("LoginForm.aspx");
        else
        {
            //session of user is null
            Session["admin"] = null;
            Server.Transfer("Logout.aspx");
            //button of login changed back to login
            btnUser.Text = "";
            btnLogin.Text = "Login";
        }
    }
    protected void btnDividend_Click(object sender, EventArgs e)
    {
        Response.Redirect("DividendPage.aspx");
    }

    protected void btnDiscount_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageDiscountCoupon.aspx");
    }

    protected void btnReview_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageReview.aspx");
    }
    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("Homepage.aspx");
    }
}
