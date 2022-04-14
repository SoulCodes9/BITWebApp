using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BITWebApp
{
    public partial class ClientRego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            //this is where we will take the data from the ASP.Net/HTML Form
            //and add that data as a new customer to our database
            //In syntax of C#
            //Customer class having a addnewCustomer() method that then
            //connects to sqlhelper class and adds a new record to the database
            //DateTime dob = DateTime.ParseExact(txtDOB.Text.Trim(), "yyyy-MM-dd", null);
            Client newClient = new Client()
            {
                FirstName = txtFirstName.Text,
                LastName = txtLName.Text,
                Street = txtStreet.Text,
                Suburb = txtSuburb.Text,
                PostCode = txtPostCode.Text,
                State = ddlState.SelectedValue,
                Phone = txtPhone.Text,
                Email = txtEmail.Text,
                DOB = Convert.ToDateTime(txtDOB.Text),
                Password = txtPassword.Text

            
            };
            int returnValue = newClient.InsertClient();
            if (returnValue >= 1)
            {
                Response.Write("Account creation successful.");
            }
            else
            {
                Response.Write("Account Creation failed, please try again.");
            }

        }
    }
}