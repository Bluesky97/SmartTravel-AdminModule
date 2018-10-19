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
public partial class AAdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            checkAttraction(); //check the attraction information details
        }
        //to show the attraction information details
        if (Session["emailA"] != null)
        {
            Attraction a = (Attraction)Session["emailA"];
            tbxAttractionName.Text=a.Name;
            tbxEmail.Text=a.OrgEmail;
            tbxRegID.Text = a.RegID;
            tbxAddress.Text = a.Address;
            tbxPcode.Text = a.PostalCode;
            tbxCity.Text = a.City;
            tbxCountry.Text = a.Country;
            tbxPassword.Text = a.Password;
            tbxContact.Text = a.ContactNo;
            tbxDesc.Text = a.Description;
            tbxHours.Text = a.OpeningHours;
            imgAttraction.ImageUrl = "../images/" + a.Photo;
            tbxSrating.Text = Convert.ToString(a.StarRating);
        }
        //show the ticket types
        List<TicketType> ticketTypes = TicketTypeDB.getTicketTypeByCountry(Session["countryName"].ToString(), Session["attraction"].ToString());
        gvTicket.DataSource = ticketTypes;
        gvTicket.DataBind();
    }
    //to check with the verification
    //if true, disabled the accept button
    //else, enabled the accept button
    void checkAttraction()
    {
        Attraction at = (Attraction)Session["emailA"];
        if (at.Verification == true)
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
        Attraction a = (Attraction)Session["emailA"];
        a.Verification = true;
        Session["emailA"] = a;
        int row = AttractionDB.updateAttractionVerify(a); //update the row into database
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Attraction a = (Attraction)Session["emailA"];
        string id = a.OrgEmail;
        int row = AttractionDB.deleteAttraction(id); //to delete the row from databse
        Response.Redirect("Homepage.aspx"); //redirect to the homepage
    }
}