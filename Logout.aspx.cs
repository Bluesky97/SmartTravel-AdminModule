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
public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["admin"] != null) //check the admin session is not null
            {
                Admin a = (Admin)Session["admin"];
                lblUser.Text = "User " + a.AdminID.ToString() + ":";
                Session["admin"] = null; //to make the session for admin is null
            }
            lblSignIn.Text = "Signed in: " + Session["SignInTime"]; //to show the sign in time
            lblSignOut.Text = "Signed out: " + DateTime.Now; //to show the sign out time
            Session["SignInTime"] = null; //session for signin time make it null
        }
    }
}