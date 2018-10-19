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
public partial class ARdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            checkRestaurant(); //to check with the restaurant information details
        }
        //show the restaurant information
        if (Session["emailR"] != null)
        {
            Restaurant a = (Restaurant)Session["emailR"];
            tbxRestaurantName.Text = a.Name;
            tbxEmail.Text = a.OrgEmail;
            tbxRegID.Text = a.RegID;
            tbxAddress.Text = a.Address;
            tbxPcode.Text = a.PostalCode;
            tbxCity.Text = a.City;
            tbxCountry.Text = a.Country;
            tbxPassword.Text = a.Password;
            tbxContact.Text = a.ContactNo;
            tbxLicense.Text = a.License;
            tbxDesc.Text = a.Description;
            tbxHours.Text = a.OpeningHours;
            imgRestaurant.ImageUrl = "../images/" + a.Photo;
            tbxSrating.Text = Convert.ToString(a.StarRating);
        }
        //get menu items 
        List<MenuItem> menuItems = MenuItemDB.getMenuItemByCountry(Session["countryName"].ToString(), Session["restaurant"].ToString());
        gvMenu.DataSource = menuItems;
        gvMenu.DataBind();
    }
    void checkRestaurant() //function to accept the verification
    {
        Restaurant at = (Restaurant)Session["emailR"];
        if (at.Verification == true)
        {
            btnAccept.Enabled = false;
        }
        else
        {
            btnAccept.Enabled = true;

        }
    }

    protected void btnAccept_Click(object sender, EventArgs e) //to accept the restaurant info provided by the organization
    {
        Restaurant a = (Restaurant)Session["emailR"];
        a.Verification = true;
        Session["emailR"] = a;
        int row = RestaurantDB.updateRestaurantVerify(a); //update row into database
    }

    protected void btnDelete_Click(object sender, EventArgs e) //to delete the restaurant information by the organization
    {
        Restaurant a = (Restaurant)Session["emailR"];
        string id = a.OrgEmail;
        int row = RestaurantDB.deleteRestaurant(id);
        Response.Redirect("Homepage.aspx"); //move back to the homepage
    }
}