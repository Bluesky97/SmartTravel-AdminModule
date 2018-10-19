using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
public partial class Homepage : System.Web.UI.Page
{
    public static string conStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
    SqlConnection con;
    bool verification = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session of user is null
        if (Session["user"] == null)
        {
            //if session of admin is not null
            if (Session["admin"] != null)
            {
                if (!IsPostBack)
                {
                    getAllAttraction();
                    getAllHotel();
                    getAllRestaurant();
                    getAllCustomer();

                    //to count how many customer registered into our website
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(custEmail) FROM Customer", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            con.Open();
                            object o = cmd.ExecuteScalar();
                            if (o != null)
                            {
                                lblCust.Text = o.ToString();
                            }
                            con.Close();
                        }
                    }
                    //to count how many attraction owner registered into our website
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(attractionID) FROM Attraction", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            con.Open();
                            object o = cmd.ExecuteScalar();
                            if (o != null)
                            {
                                lblAttraction.Text = o.ToString();
                            }
                            con.Close();
                        }
                    }
                    //to count how many hotel owner registered into our website
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(hotelID) FROM Hotel", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            con.Open();
                            object o = cmd.ExecuteScalar();
                            if (o != null)
                            {
                                lblHotel.Text = o.ToString();
                            }
                            con.Close();
                        }
                    }
                    //to count how many restaurant owner registered into our website
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(restaurantID) FROM Restaurant", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            con.Open();
                            object o = cmd.ExecuteScalar();
                            if (o != null)
                            {
                                lblRestaurant.Text = o.ToString();
                            }
                            con.Close();
                        }
                    }
                }

            }
            else
            {
                //redirect to the invalid page
                Response.Redirect("InvalidPage.aspx");
            }
        }
        else
        {
            //redirect to the invalid page
            Response.Redirect("InvalidPage.aspx");
        }
        pnlCustomer.Visible = true;
        pnlAttraction.Visible = false;
        pnlHotel.Visible = false;
        pnlRestaurant.Visible = false;

    }
    private void getAllCustomer()
    {
        //list the gridview from database
        List<Customer> customers = CustomerDB.getAllCustomers();
        gvCustomer.DataSource = customers;
        gvCustomer.DataBind();
    }
    private void getAllAttraction()
    {
        //list the gridview from database
        List<Attraction> attractions = AttractionDB.getAllAttraction();
        gvAttraction.DataSource = attractions;
        gvAttraction.DataBind();
    }
    private void getAllHotel()
    {
        //list the gridview from database
        List<Hotel> hotels = HotelDB.getAllHotel();
        gvHotel.DataSource = hotels;
        gvHotel.DataBind();
    }
    private void getAllRestaurant()
    {
        //list the gridview from database
        List<Restaurant> restaurants = RestaurantDB.getAllRestaurant();
        gvRestaurant.DataSource = restaurants;
        gvRestaurant.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e) //to allow admin search for the customer name
    {
        if (sqlCust != null)
        {
            List<Customer> customers = CustomerDB.getAllCustomers();
            gvCustomer.DataSource = sqlCust;
            gvCustomer.DataBind();
        }
        else
        {
            lblOutput.Text = "cannot find!";
        }
    }
    //to show customer list
    protected void btnShowCust_Click(object sender, EventArgs e)
    {
        pnlCustomer.Visible = true;
        pnlAttraction.Visible = false;
        pnlHotel.Visible = false;
        pnlRestaurant.Visible = false;
    }
    //to show attraction list
    protected void btnAttraction_Click(object sender, EventArgs e)
    {
        pnlCustomer.Visible = false;
        pnlAttraction.Visible = true;
        pnlHotel.Visible = false;
        pnlRestaurant.Visible = false;
    }
    //to show hotel list
    protected void btnHotel_Click(object sender, EventArgs e)
    {
        pnlCustomer.Visible = false;
        pnlAttraction.Visible = false;
        pnlHotel.Visible = true;
        pnlRestaurant.Visible = false;
    }
    //to show the restaurant list
    protected void btnRestaurant_Click(object sender, EventArgs e)
    {
        pnlCustomer.Visible = false;
        pnlAttraction.Visible = false;
        pnlHotel.Visible = false;
        pnlRestaurant.Visible = true;
    }

    protected void gvAttraction_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Attraction> attractions = AttractionDB.getAllAttraction();
        Attraction a = attractions[gvAttraction.SelectedIndex];
        Session["emailA"] = a;
        Session["attraction"] = a.Name;
        Session["countryName"] = a.Country;
        Response.Redirect("AAdetails.aspx");
    }

    protected void gvHotel_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Hotel> hotels = HotelDB.getAllHotel();
        Hotel h = hotels[gvHotel.SelectedIndex];
        Session["emailH"] = h;
        Session["hotel"] = h.Name;
        Session["countryName"] = h.Country;
        Response.Redirect("AHdetails.aspx");
    }

    protected void gvRestaurant_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Restaurant> restaurants = RestaurantDB.getAllRestaurant();
        Restaurant r = restaurants[gvRestaurant.SelectedIndex];
        Session["emailR"] = r;
        Session["restaurant"] = r.Name;
        Session["countryName"] = r.Country;
        Response.Redirect("ARdetails.aspx");
    }

    protected void btnDiscount_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageDiscountCoupon.aspx"); //redirect to the manage discount coupon page
    }

    protected void gvCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Booking")
        {
            Session["customer"] = e.CommandArgument.ToString(); //create a session of customer

            Response.Redirect("ViewBookingDetails.aspx"); //redirect to the view booking details and brings the session of customer
        }
    }

    protected void btnReview_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageReview.aspx"); //redirect to the manage review
    }

    protected void btnDividend_Click(object sender, EventArgs e)
    {
        Response.Redirect("DividendPage.aspx"); //redirect to the dividend page 
    }

    protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)gvCustomer.Rows[e.RowIndex];
        Label Label1 = (Label)row.FindControl("Label1");
        con = new SqlConnection(conStr);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Customer where custEmail=@custEmail", con);
        cmd.Parameters.AddWithValue("@custEmail", Label1.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        getAllCustomer();

        SmtpClient client = new SmtpClient("smtp.gmail.com");
        client.EnableSsl = true;
        client.Credentials = new NetworkCredential("smarttravel1005@gmail.com", "smart-travel1005");
        MailMessage msg;
        msg = new MailMessage("smarttravel1005@gmail.com", Label1.Text);
        msg.Subject = "Notice Period";
        msg.Body = "Sorry, You're not longer to login into our website." + Environment.NewLine + "Your account information is not accpetable, Please next time you give a proper data information!" + Environment.NewLine + "Best Regards," + Environment.NewLine + "SmartTravel Management Team.";
        client.Send(msg); //send email
    }
}