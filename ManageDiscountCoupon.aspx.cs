using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
public partial class ManageDiscountCoupon : System.Web.UI.Page
{
    public static string conStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvBind(); //to bind the data from database
        }
    }
    void gvBind() //to bind the discount coupon into the gridview
    {
        List<DiscountCoupon> discountCoupons = DiscountCouponDB.getAllDiscountCoupon();
        gvDiscount.DataSource = discountCoupons;
        gvDiscount.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e) //add the new discount coupon
    {
        Admin a = (Admin)Session["admin"];
        double disAMT;
        if (tbxAMT.Text == "")
            disAMT = 0;
        else
            disAMT = Convert.ToDouble(tbxAMT.Text);
        DiscountCoupon dc = new DiscountCoupon()
        {
            CouponCode = tbxCc.Text,
            Name = tbxName.Text,
            Description = tbxDesc.Text,
            Percentage = tbxPercentage.Text,
            Amount = disAMT,
            StartDate = Convert.ToDateTime(tbxSd.Text),
            EndDate = Convert.ToDateTime(tbxEd.Text),
            AdminID = a
        };
        
        if (Convert.ToDateTime(tbxSd.Text) < DateTime.Now) //to check the start date must be future and cannot be past
        {
            lblOutput.Text = "Start date must be in the future";
        }
        else
        {
            if (Convert.ToDateTime(tbxEd.Text) < Convert.ToDateTime(tbxSd.Text)) //to check end date cannot be before the start date
            {
                lblOutput.Text = "End date cannot be before the start date";
            }
            else
            {
                try
                {
                    int id = DiscountCouponDB.addDiscountCoupon(dc); //add row into the database
                    lblOutput.Text = id + "Added Successfully!"; 
                    gvBind();
                    tbxAMT.Text = "";
                    tbxCc.Text = "";
                    tbxDesc.Text = "";
                    tbxEd.Text = "";
                    tbxName.Text = "";
                    tbxPercentage.Text = "";
                    tbxSd.Text = "";
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "Cannot Add!" + ex.Message; //to show the error message cannot add the discount coupon
                }
            }
        }
    }

    protected void gvDiscount_RowUpdating(object sender, GridViewUpdateEventArgs e) //row updating the discount coupon
    {
        Label lblCode = gvDiscount.Rows[e.RowIndex].FindControl("lblCode") as Label;
        Label lblCouponCode = gvDiscount.Rows[e.RowIndex].FindControl("lblCouponCode") as Label;
        TextBox textName = gvDiscount.Rows[e.RowIndex].FindControl("tbxName") as TextBox;
        TextBox textDesc = gvDiscount.Rows[e.RowIndex].FindControl("tbxDesc") as TextBox;
        TextBox textPersen = gvDiscount.Rows[e.RowIndex].FindControl("tbxPersen") as TextBox;
        TextBox textAMT = gvDiscount.Rows[e.RowIndex].FindControl("tbxAMT") as TextBox;
        TextBox textSd = gvDiscount.Rows[e.RowIndex].FindControl("tbxSd") as TextBox;
        TextBox textEd = gvDiscount.Rows[e.RowIndex].FindControl("tbxEd") as TextBox;
        con = new SqlConnection(conStr);
        con.Open();
        //update record
        SqlCommand cmd = new SqlCommand("update DiscountCoupon set Name='" + textName.Text + "',description='" + textDesc.Text + "',percentage='" + Convert.ToDecimal(textPersen.Text) + "',amount='" + Convert.ToDecimal(textAMT.Text) + "',StartDate='" + textSd.Text + "',EndDate='" + textEd.Text + "' where CouponCode='" + lblCode.Text+"'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        gvDiscount.EditIndex = -1;
        gvBind();
    }

    protected void gvDiscount_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDiscount.EditIndex = e.NewEditIndex; //to edit the discount coupon in the gridview
        gvBind();
    }

    protected void gvDiscount_RowDeleting(object sender, GridViewDeleteEventArgs e) //to delete the row
    {
        GridViewRow row = (GridViewRow)gvDiscount.Rows[e.RowIndex];
        Label lblCouponCode = (Label)row.FindControl("lblCouponCode");
        con = new SqlConnection(conStr);
        con.Open();
        SqlCommand cmd = new SqlCommand("Delete DiscountCoupon where CouponCode=@CouponCode", con); //sql command to delete the row
        cmd.Parameters.AddWithValue("@CouponCode", lblCouponCode.Text); //based on the coupon id
        cmd.ExecuteNonQuery();
        con.Close();
        gvBind();
    }

    protected void gvDiscount_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDiscount.EditIndex = -1; //to cancel update
        gvBind();
    }
}