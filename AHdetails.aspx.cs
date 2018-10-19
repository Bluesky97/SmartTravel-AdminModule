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
public partial class AHdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            checkHotel(); //to check with the hotel information details
        }
        //to show the hotel information details
        if (Session["emailH"] != null)
        {
            Hotel a = (Hotel)Session["emailH"];
            tbxHotel.Text = a.Name;
            tbxEmail.Text = a.OrgEmail;
            tbxRegID.Text = a.RegID;
            tbxAddress.Text = a.Address;
            tbxPcode.Text = a.PostalCode;
            tbxCity.Text = a.City;
            tbxCountry.Text = a.Country;
            tbxPassword.Text = a.Password;
            tbxContact.Text = a.ContactNo;
            tbxDesc.Text = a.Description;
            tbxLicense.Text = a.License;
            imgHotel.ImageUrl = "../images/" + a.Photo;
            tbxSrating.Text = Convert.ToString(a.StarRating);
        }
        //to show the hotel rooms into the gridview
        List<Room> rooms = RoomDB.getHotelRoomByCountry (Session["countryName"].ToString(), Session["hotel"].ToString());
        gvRoom.DataSource = rooms;
        gvRoom.DataBind();
    }
    //to check with the verification
    //if true, disabled the accept button
    //else, enabled the accept button
    void checkHotel()
    {
        Hotel ht = (Hotel)Session["emailH"];
        if (ht.Verification == true)
        {
            btnAccept.Enabled = false;
        }
        else
        {
            btnAccept.Enabled = true;

        }
    }
    //to accept the attraction information details (update verification from false to true) -- user can show the attraction information into public website
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        Hotel a = (Hotel)Session["emailH"];
        a.Verification = true;
        Session["emailH"] = a;
        int row = HotelDB.updateHotelVerify(a); //to update the row into database
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Hotel a = (Hotel)Session["emailH"];
        string id = a.OrgEmail;
        int row = HotelDB.deleteHotel(id); //to delete the row from database
        Response.Redirect("Homepage.aspx"); //to redirect to the homepage
    }
}