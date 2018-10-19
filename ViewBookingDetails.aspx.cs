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
public partial class ViewBookingDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmail.Text = Session["customer"].ToString(); //to show customer email

        Customer c = CustomerDB.getACustomerByEmail(Session["customer"].ToString()); //get the data from database
        List<Booking> bkList = BookingDB.getAllBookingByCID(c); //get the booking data with specific customer
        if (bkList.Count > 0) //if the data is more than zero
        {
            //to show the data in gridview
            lblBooking.Visible = true;
            gvBooking.Visible = true;
            gvBooking.DataSource = bkList;
            gvBooking.DataBind();
            //stored in the session to use it back
            Session["Booking"] = bkList;
        }
        else
        {
            lblBooking.Text = "No Booking made by this customer"; //when there is no booking made by customer, show the message
            lblBooking.Visible = true;
        }
    }

    protected void gvBooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBooking.PageIndex = e.NewPageIndex;
        List<Booking> bookingList = (List<Booking>)Session["Booking"];
        gvBooking.DataSource = bookingList;
        gvBooking.DataBind();
    }

    protected void gvBooking_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Item") //if admin selected on the specific booking id
        {
            dlRestaurant.Visible = false;
            dlRoom.Visible = false;
            dlTicket.Visible = false;
            List<Booking> bookingList = (List<Booking>)Session["Booking"]; //retrieve the booking session
            List<ItemBooking> itemList = ItemBookingDB.getAllRoomItemBooking(); //get the data from database for room details
            List<ItemBooking> item = new List<ItemBooking>(); //add new list into itembooking
            foreach (ItemBooking it in itemList) //use foreach to check with the itembookinglist
            {
                for (int n = 0; n < bookingList.Count; n++) //use for loop to check how many rows are there inside of the database
                {
                    //to check whether booking is available in database
                    if (it.BookingID.BookingID.ToString() == bookingList[n].BookingID.ToString() && bookingList[n].BookingID.ToString() == e.CommandArgument.ToString())
                    {
                        //to show the room details into datalist
                        ItemBooking room = it;
                        item.Add(room);
                        dlRoom.DataSource = item;
                        dlRoom.DataBind();
                        Session["room"] = item;
                    }
                }
            }
            //retrieve the booking session
            //get the ticket item booking from database
            //add new list from itembooking classes
            List<Booking> tList = (List<Booking>)Session["Booking"];
            List<ItemBooking> itemTicketList = ItemBookingDB.getAllTicketItemBooking();
            List<ItemBooking> itemT = new List<ItemBooking>();
            foreach (ItemBooking it in itemTicketList) //use foreach to check the itembooking
            {
                for (int n = 0; n < bookingList.Count; n++) //use for loop to check how many rows are there inside of the database
                {
                    //check with the booking id, if the data is available in database
                    if (it.BookingID.BookingID.ToString() == bookingList[n].BookingID.ToString() && bookingList[n].BookingID.ToString() == e.CommandArgument.ToString())
                    {
                        //to show the ticket into datalist
                        ItemBooking ticket = it;
                        itemT.Add(ticket);
                        dlTicket.DataSource = itemT;
                        dlTicket.DataBind();
                        Session["ticket"] = it.ItemBookingID;
                    }
                }
            }
            //retrieve the booking session
            //get the restaurant item booking from database
            //add new list from itembooking classes
            List<Booking> rList = (List<Booking>)Session["Booking"];
            List<ItemBooking> itemRlist = ItemBookingDB.getAllRestaurantItemBooking();
            List<ItemBooking> itemR = new List<ItemBooking>();
            foreach (ItemBooking it in itemRlist) //use foreach to check the itembooking
            {
                for (int n = 0; n < bookingList.Count; n++) //use for loop to check how many rows are there inside of the database
                {
                    //check with the booking id, if the data is available in database
                    if (it.BookingID.BookingID.ToString() == bookingList[n].BookingID.ToString() && bookingList[n].BookingID.ToString() == e.CommandArgument.ToString())
                    {
                        //to show the restaurant details into datalist
                        ItemBooking restaurant = it;
                        itemR.Add(restaurant);
                        dlRestaurant.DataSource = itemR;
                        dlRestaurant.DataBind();
                        Session["restaurant"] = itemR;
                    }
                }
            }
            //to check the item is more than zero -- ticket, hotel room and resturant
            if (itemT.Count > 0)
                dlTicket.Visible = true;
            if (itemR.Count > 0)
                dlRestaurant.Visible = true;
            if (item.Count > 0)
                dlRoom.Visible = true;
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Homepage.aspx"); //redirect to the homepage
    }
}