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
public partial class LoginForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Admin d = AdminDB.getAdminbyID(tbxEmail.Text, tbxPassword.Text); //to get the data from database
        if (d != null)
        {
            if (d.AdminID == tbxEmail.Text)
            {
                if (d.Password == tbxPassword.Text)
                {
                    //create a session for admin
                    Session["admin"] = d;
                    Session["SignInTime"] = DateTime.Now;
                    //redirect to AdminView page
                    Server.Transfer("Homepage.aspx");
                }
            }
        }
        else
        {
            lblOutput.Text = "sorry admin cannot login!"; //to show error message where admin cannot login
        }
    }
}