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
public partial class DividendPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gvDividendPendingH.Visible = false;
        gvDividendPendingA.Visible = false;
        gvDividendPaidH.Visible = false;
        gvDividendPaidA.Visible = false;
        pnlEdit.Visible = false;
        if (ddlSP.SelectedItem.Text == "Hotel Owner")
        {
            //show the related grid view
            gvDividendPendingH.Visible = true;
            gvDividendPaidH.Visible = true;

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPendingList = DividendDB.getAllHotelPendingDividends();
            gvDividendPendingH.DataSource = dvPendingList;
            gvDividendPendingH.DataBind();

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPaidList = DividendDB.getAllHotelPaidDividends();
            gvDividendPaidH.DataSource = dvPaidList;
            gvDividendPaidH.DataBind();
        }
        else if (ddlSP.SelectedItem.Text == "Attraction Owner")
        {
            //show the related grid view
            gvDividendPendingA.Visible = true;
            gvDividendPaidA.Visible = true;

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPendingList = DividendDB.getAllAttractionPendingDividends();
            gvDividendPendingA.DataSource = dvPendingList;
            gvDividendPendingA.DataBind();

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPaidList = DividendDB.getAllAttractionPaidDividends();
            gvDividendPaidA.DataSource = dvPaidList;
            gvDividendPaidA.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        gvDividendPendingH.Visible = false;
        gvDividendPendingA.Visible = false;
        gvDividendPaidH.Visible = false;
        gvDividendPaidA.Visible = false;
        pnlEdit.Visible = false;
        if (ddlSP.SelectedItem.Text == "Hotel Owner")
        {
            //show the related grid view
            gvDividendPendingH.Visible = true;
            gvDividendPaidH.Visible = true;

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPendingList = DividendDB.getAllHotelPendingDividends();
            gvDividendPendingH.DataSource = dvPendingList;
            gvDividendPendingH.DataBind();

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPaidList = DividendDB.getAllHotelPaidDividends();
            gvDividendPaidH.DataSource = dvPaidList;
            gvDividendPaidH.DataBind();
        }
        else if (ddlSP.SelectedItem.Text == "Attraction Owner")
        {
            //show the related grid view
            gvDividendPendingA.Visible = true;
            gvDividendPaidA.Visible = true;

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPendingList = DividendDB.getAllAttractionPendingDividends();
            gvDividendPendingA.DataSource = dvPendingList;
            gvDividendPendingA.DataBind();

            //to get all the data from dividendDB by calling the method
            List<Dividend> dvPaidList = DividendDB.getAllAttractionPaidDividends();
            gvDividendPaidA.DataSource = dvPaidList;
            gvDividendPaidA.DataBind();
        }
    }

    protected void gvDividendPendingH_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //to perform paging
        gvDividendPendingH.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from dividendDB by calling the method 
            List<Dividend> dvPendingList = DividendDB.getAllHotelPendingDividends();
            gvDividendPendingH.DataSource = dvPendingList;
            gvDividendPendingH.DataBind();
        }
        else
        {
            //to get all the data from dividendDB by calling the method and search name
            List<Dividend> dvPendingList = DividendDB.getAllHotelPendingDividendsByName(tbxName.Text);
            gvDividendPendingH.DataSource = dvPendingList;
            gvDividendPendingH.DataBind();
        }
    }

    protected void gvDividendPendingH_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlEdit.Visible = true;
        //to get the selected index
        Dividend d = DividendDB.getADividend(e.CommandArgument.ToString());
        if (d == null)
        {
            lblDividendID.Text = "";
            ddlStatus.Text = "Pending";
        }
        else
        {
            //take the value from dividend
            lblDividendID.Text = d.DividendId.ToString();
            ddlStatus.Text = d.Status.ToString();
        }
    }

    protected void gvDividendPendingA_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //to perform paging
        gvDividendPendingA.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from dividendDB by calling the method 
            List<Dividend> dvPendingList = DividendDB.getAllAttractionPendingDividends();
            gvDividendPendingA.DataSource = dvPendingList;
            gvDividendPendingA.DataBind();
        }
        else
        {
            //to get all the data from dividendDB by calling the method and search name
            List<Dividend> dvPendingList = DividendDB.getAllAttractionPendingDividendsByName(tbxName.Text);
            gvDividendPendingA.DataSource = dvPendingList;
            gvDividendPendingA.DataBind();
        }
    }

    protected void gvDividendPendingA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlEdit.Visible = true;
        //to get the selected index
        Dividend d = DividendDB.getADividend(e.CommandArgument.ToString());
        if (d == null)
        {
            lblDividendID.Text = "";
            ddlStatus.Text = "Paid";
        }
        else
        {
            //take the value from dividend
            lblDividendID.Text = d.DividendId.ToString();
            ddlStatus.Text = d.Status.ToString();
        }
    }

    protected void gvDividendPaidH_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //to perform paging
        gvDividendPaidH.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from dividendDB by calling the method 
            List<Dividend> dvPendingList = DividendDB.getAllHotelPaidDividends();
            gvDividendPaidH.DataSource = dvPendingList;
            gvDividendPaidH.DataBind();
        }
        else
        {
            //to get all the data from dividendDB by calling the method and search name
            List<Dividend> dvPaidList = DividendDB.getAllHotelPaidDividendsByName(tbxName.Text);
            gvDividendPaidH.DataSource = dvPaidList;
            gvDividendPaidH.DataBind();
        }
    }

    protected void gvDividendPaidA_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //to perform paging
        gvDividendPaidA.PageIndex = e.NewPageIndex;
        if (tbxName.Text == "")
        {
            //to get all the data from dividendDB by calling the method 
            List<Dividend> dvPendingList = DividendDB.getAllAttractionPaidDividends();
            gvDividendPaidA.DataSource = dvPendingList;
            gvDividendPaidA.DataBind();
        }
        else
        {
            //to get all the data from dividendDB by calling the method and search name
            List<Dividend> dvPaidList = DividendDB.getAllHotelPaidDividendsByName(tbxName.Text);
            gvDividendPaidA.DataSource = dvPaidList;
            gvDividendPaidA.DataBind();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //to get all the data from dividendDB by calling the method and search by id
        Dividend d = DividendDB.getADividend(lblDividendID.Text);
        //get the selected one
        d.Status = ddlStatus.SelectedItem.Text;
        //updating by calling the method from dividend
        int result = DividendDB.updateDividend(d);
        if (result > 0)

            Page_Load(sender, e);
    }
}