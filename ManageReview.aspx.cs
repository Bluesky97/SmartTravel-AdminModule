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
public partial class ManageReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session for admin is null 
        if (Session["admin"] == null)
        {
            Response.Redirect("LoginForm.aspx"); //redirect to the loginform page
        }

        gvReviewReportedAttraction.Visible = false;
        gvReviewReportedHotel.Visible = false;
        gvReviewReportedRestaurant.Visible = false;
        gvReviewH.Visible = false;
        gvReviewA.Visible = false;
        gvReviewR.Visible = false;
        lblDelete.Visible = false;
        pnlEdit.Visible = false;

        if (ddlSP.SelectedItem.Text == "Attraction Owner") //admin checks the review for attraction owner
        {
            gvReviewReportedAttraction.Visible = true;
            gvReviewA.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllAttractionReportedReview();
            gvReviewReportedAttraction.DataSource = revList;
            gvReviewReportedAttraction.DataBind();
            List<Review> rvList = ReviewDB.getAllAttractionReportedReview();

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllAttractionReview();
            gvReviewA.DataSource = dvList;
            gvReviewA.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllAttractionReview();
        }
        else if (ddlSP.SelectedItem.Text == "Hotel Owner") //admin checks the review for hotel owner
        {
            gvReviewReportedHotel.Visible = true;
            gvReviewH.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllHotelReportedReview();
            gvReviewReportedHotel.DataSource = revList;
            gvReviewReportedHotel.DataBind();
            List<Review> rvList = ReviewDB.getAllHotelReportedReview();

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllHotelReview();
            gvReviewH.DataSource = dvList;
            gvReviewH.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllHotelReview();
        }
        else if (ddlSP.SelectedItem.Text == "Restaurant Owner") //admin checks the review for restaurant owner
        {
            gvReviewReportedRestaurant.Visible = true;
            gvReviewR.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllRestaurantReportedReview();
            gvReviewReportedRestaurant.DataSource = revList;
            gvReviewReportedRestaurant.DataBind();
            List<Review> rvList = ReviewDB.getAllRestaurantReportedReview();

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllRestaurantReview();
            gvReviewR.DataSource = dvList;
            gvReviewR.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllRestaurantReview();
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        gvReviewReportedAttraction.Visible = false;
        gvReviewReportedHotel.Visible = false;
        gvReviewReportedRestaurant.Visible = false;
        gvReviewH.Visible = false;
        gvReviewA.Visible = false;
        gvReviewR.Visible = false;
        lblDelete.Visible = false;
        pnlEdit.Visible = false;

        if (ddlSP.SelectedItem.Text == "Attraction Owner")
        {
            gvReviewReportedAttraction.Visible = true;
            gvReviewA.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllAttractionReportedReviewByName(tbxName.Text);
            gvReviewReportedAttraction.DataSource = revList;
            gvReviewReportedAttraction.DataBind();
            List<Review> rvList = ReviewDB.getAllAttractionReportedReview();

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllAttractionReviewByName(tbxName.Text);
            gvReviewA.DataSource = dvList;
            gvReviewA.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllAttractionReview();
        }
        else if (ddlSP.SelectedItem.Text == "Hotel Owner")
        {
            gvReviewReportedHotel.Visible = true;
            gvReviewH.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllHotelReportedReviewByName(tbxName.Text);
            gvReviewReportedHotel.DataSource = revList;
            gvReviewReportedHotel.DataBind();
            List<Review> rvList = ReviewDB.getAllHotelReportedReviewByName(tbxName.Text);

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllHotelReviewByName(tbxName.Text);
            gvReviewH.DataSource = dvList;
            gvReviewH.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllHotelReviewByName(tbxName.Text);
        }
        else if (ddlSP.SelectedItem.Text == "Restaurant Owner")
        {
            gvReviewReportedRestaurant.Visible = true;
            gvReviewR.Visible = true;
            //get all the data from feedbackDB by calling the method
            List<Review> revList = ReviewDB.getAllRestaurantReportedReviewByName(tbxName.Text);
            gvReviewReportedRestaurant.DataSource = revList;
            gvReviewReportedRestaurant.DataBind();
            List<Review> rvList = ReviewDB.getAllRestaurantReportedReviewByName(tbxName.Text);

            //get all the data from feedbackDB by calling the method
            List<Review> dvList = ReviewDB.getAllRestaurantReviewByName(tbxName.Text);
            gvReviewR.DataSource = dvList;
            gvReviewR.DataBind();
            List<Review> fbNormalList = ReviewDB.getAllRestaurantReviewByName(tbxName.Text);
        }
    }

    protected void gvReviewReportedAttraction_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbList = ReviewDB.getAllAttractionReportedReview();

        //to perform paging
        Review fb = fbList[gvReviewReportedAttraction.PageIndex * gvReviewReportedAttraction.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewReportedAttraction.DataSource = ReviewDB.getAllAttractionReportedReview();
            gvReviewReportedAttraction.DataBind();
        }
    }

    protected void gvReviewReportedAttraction_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlEdit.Visible = true;
        //to get all the data from feedbackDb by calling methold and select the index
        Review d = ReviewDB.getReviewByID(e.CommandArgument.ToString());
        if (d == null)
        {
            lblFeedbackID.Text = "";
            ddlStatus.Text = "Reported!";
        }
        else
        {
            lblFeedbackID.Text = d.RevID.ToString();
            ddlStatus.Text = d.ReportStatus.ToString();
        }
    }

    protected void gvReviewReportedAttraction_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        pnlEdit.Visible = false;

        //to perform paging
        gvReviewReportedAttraction.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method
            List<Review> revList = ReviewDB.getAllAttractionReportedReview();
            gvReviewReportedAttraction.DataSource = revList;
            gvReviewReportedAttraction.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllAttractionReportedReviewByName(tbxName.Text);
            gvReviewReportedAttraction.DataSource = revList;
            gvReviewReportedAttraction.DataBind();
        }

    }

    protected void gvReviewA_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReviewA.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method 
            List<Review> dvList = ReviewDB.getAllAttractionReview();
            gvReviewA.DataSource = dvList;
            gvReviewA.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllAttractionReviewByName(tbxName.Text);
            gvReviewA.DataSource = revList;
            gvReviewA.DataBind();
        }
    }

    protected void gvReviewA_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbNormalList = ReviewDB.getAllAttractionReview();

        //to perform paging
        Review fb = fbNormalList[gvReviewA.PageIndex * gvReviewA.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewA.DataSource = ReviewDB.getAllAttractionReview();
            gvReviewA.DataBind();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //to get all the data from feedbackDb by calling methold and search by ID
        Review d = ReviewDB.getReviewByID(lblFeedbackID.Text);
        //get the selected item
        d.ReportStatus = ddlStatus.SelectedItem.Text;
        //to update the feedback by calling method from feedbackDB
        int result = ReviewDB.updateReview(d);
        if (result > 0)
            Page_Load(sender, e);
    }

    protected void gvReviewReportedHotel_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReviewReportedHotel.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method 
            List<Review> dvList = ReviewDB.getAllHotelReportedReview();
            gvReviewReportedHotel.DataSource = dvList;
            gvReviewReportedHotel.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllHotelReportedReviewByName(tbxName.Text);
            gvReviewReportedHotel.DataSource = revList;
            gvReviewReportedHotel.DataBind();
        }
    }

    protected void gvReviewReportedHotel_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlEdit.Visible = true;
        //to get all the data from feedbackDb by calling methold and select the index
        Review d = ReviewDB.getReviewByID(e.CommandArgument.ToString());
        if (d == null)
        {
            lblFeedbackID.Text = "";
            ddlStatus.Text = "Reported!";
        }
        else
        {
            lblFeedbackID.Text = d.RevID.ToString();
            ddlStatus.Text = d.ReportStatus.ToString();
        }
    }

    protected void gvReviewReportedHotel_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbNormalList = ReviewDB.getAllHotelReportedReview();

        //to perform paging
        Review fb = fbNormalList[gvReviewReportedHotel.PageIndex * gvReviewReportedHotel.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewReportedHotel.DataSource = ReviewDB.getAllHotelReportedReview();
            gvReviewReportedHotel.DataBind();
        }
    }

    protected void gvReviewH_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReviewH.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method 
            List<Review> dvList = ReviewDB.getAllHotelReview();
            gvReviewH.DataSource = dvList;
            gvReviewH.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllHotelReviewByName(tbxName.Text);
            gvReviewH.DataSource = revList;
            gvReviewH.DataBind();
        }
    }

    protected void gvReviewH_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbNormalList = ReviewDB.getAllHotelReview();

        //to perform paging
        Review fb = fbNormalList[gvReviewH.PageIndex * gvReviewH.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewH.DataSource = ReviewDB.getAllHotelReview();
            gvReviewH.DataBind();
        }
    }

    protected void gvReviewReportedRestaurant_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReviewReportedRestaurant.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method 
            List<Review> dvList = ReviewDB.getAllHotelReportedReview();
            gvReviewReportedRestaurant.DataSource = dvList;
            gvReviewReportedRestaurant.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllHotelReportedReviewByName(tbxName.Text);
            gvReviewReportedRestaurant.DataSource = revList;
            gvReviewReportedRestaurant.DataBind();
        }
    }

    protected void gvReviewReportedRestaurant_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlEdit.Visible = true;
        //to get all the data from feedbackDb by calling methold and select the index
        Review d = ReviewDB.getReviewByID(e.CommandArgument.ToString());
        if (d == null)
        {
            lblFeedbackID.Text = "";
            ddlStatus.Text = "Reported!";
        }
        else
        {
            lblFeedbackID.Text = d.RevID.ToString();
            ddlStatus.Text = d.ReportStatus.ToString();
        }
    }

    protected void gvReviewReportedRestaurant_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbNormalList = ReviewDB.getAllRestaurantReportedReview();

        //to perform paging
        Review fb = fbNormalList[gvReviewReportedRestaurant.PageIndex * gvReviewReportedRestaurant.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewReportedRestaurant.DataSource = ReviewDB.getAllRestaurantReportedReview();
            gvReviewReportedRestaurant.DataBind();
        }
    }

    protected void gvReviewR_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReviewH.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from feedbackDB by calling method 
            List<Review> dvList = ReviewDB.getAllRestaurantReview();
            gvReviewR.DataSource = dvList;
            gvReviewR.DataBind();
        }
        else
        {
            //to get all the data from feedbackDB by calling method and search by name
            List<Review> revList = ReviewDB.getAllHotelReviewByName(tbxName.Text);
            gvReviewR.DataSource = revList;
            gvReviewR.DataBind();
        }
    }

    protected void gvReviewR_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblDelete.Visible = true;
        //get the list from FeedbackDB by calling the method and get the session
        List<Review> fbNormalList = ReviewDB.getAllRestaurantReview();

        //to perform paging
        Review fb = fbNormalList[gvReviewR.PageIndex * gvReviewR.PageSize + e.RowIndex];
        pnlEdit.Visible = false;

        //call the delete method from FeedbackDB
        int result = ReviewDB.deleteReview(fb);

        if (result > 0)
        {
            lblDelete.Text = "Feedback Deleted!";
            gvReviewR.DataSource = ReviewDB.getAllRestaurantReview();
            gvReviewR.DataBind();
        }
    }
}