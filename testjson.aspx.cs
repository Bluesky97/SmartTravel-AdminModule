using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using System.IO;
using Newtonsoft.Json;
//INFT 3970 - FYP Project
//Start Date : 10th May 2018
//Submission Date : 1st August 2018
//Names     :Andrian Alexander Putra(c3271469)
//          :Zhang Chuhan(c3270145)
//          :Thet Paing Htun(c3271285)
//          :Hay Marn Oo(c3271471)
public partial class testjson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string userinput = tbxInput.Text;
        using (WebClient wc = new WebClient())
        {
            var json = wc.DownloadString("https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + tbxInput.Text + "&key=AIzaSyA-Brzltyb6U-xbPlQyCUM2n4F_c130xl0");
            //tbxOutput.Text = json;
            JObject jt = JObject.Parse(json);
            JToken c = jt.GetValue("results");
            String output = "";
            foreach (var result in c)
            {
                output += result.Value<string>("formatted_address").ToString() + Environment.NewLine;
                output += result.Value<string>("name").ToString() + Environment.NewLine;
                output += result.Value<int>("rating") + Environment.NewLine;

                Attraction a = new Attraction()
                {
                    OrgEmail = "",
                    Name = result.Value<string>("name").ToString(),
                    RegID = "",
                    Address = result.Value<string>("formatted_address").ToString(),
                    PostalCode = "",
                    City = "",
                    Country = "",
                    Password = "123456",
                    ContactNo = "",
                    Description = "Not Applicable",
                    StarRating = Convert.ToInt32(5),
                    OpeningHours = "",
                    Photo = "",
                    Verification = true
                };

                int id = AttractionDB.insertAttraction(a);
                lblOutput.Text = id + "Registered Successfully!";

            }
            tbxOutput.Text = output;



        }
    }
}

