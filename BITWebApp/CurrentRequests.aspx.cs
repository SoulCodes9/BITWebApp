using System;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace BITWebApp
{
    public partial class CurrentRequests : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int clientId = Convert.ToInt32(Session["Client_Id"].ToString());
            string sqlString =
                 "SELECT DISTINCT r.Request_Id as 'Request ID', " +
                  "r.Date_Of_Job as 'Date of Job', " +
                  "r.Start_Time as 'Start Time', " +
                  "c.Cont_FName as 'Contractor First Name', " +
                  "c.Cont_lName as 'Contractor Last Name', " +
                  "cl.Client_Id as 'Client ID', " +
                  "cl.Client_FName as 'Client First Name', " +
                  "cl.Client_LName as 'Client Last Name', " +
                 // "r.Location_Id as 'Location ID', " +
                  "l.Address, " +
                  "l.Suburb_Name as 'Suburb', " +
                  "l.PostCode, " +
                  "r.Status, " +
                  "r.Km_Travelled as 'Km Travelled' " +
                  "FROM REQUEST r, AVAILABILITY a, CLIENT cl, CONTRACTOR c, LOCATION l " +
                  "WHERE a.Contractor_Id = r.Contractor_Id " +
                  "AND r.Client_Id = cl.Client_Id " +
                  "AND r.Contractor_Id = c.Contractor_ID " +
                  "AND l.Location_Id = r.Location_Id " +
                  "AND cl.Client_Id = r.Client_Id " +
                  "AND cl.Client_Id = " + clientId +
                  " AND r.Status = 'Booked'";

            SQLHelper objHelper = new SQLHelper();
            gvCurrentRequests.DataSource = objHelper.ExecuteSQL(sqlString);
            gvCurrentRequests.DataBind();

            string sqlAllRequests =
                 "SELECT DISTINCT r.Request_Id as 'Request ID', " +
                  "r.Date_Of_Job as 'Date of Job', " +
                  "r.Start_Time as 'Start Time', " +
                  "c.Cont_FName as 'Contractor First Name', " +
                  "c.Cont_lName as 'Contractor Last Name', " +
                  "cl.Client_Id as 'Client ID', " +
                  "cl.Client_FName as 'Client First Name', " +
                  "cl.Client_LName as 'Client Last Name', " +
                  // "r.Location_Id as 'Location ID', " +
                  "l.Address, " +
                  "l.Suburb_Name as 'Suburb', " +
                  "l.PostCode, " +
                  "r.Status, " +
                  "r.Km_Travelled as 'Km Travelled' " +
                  "FROM REQUEST r, AVAILABILITY a, CLIENT cl, CONTRACTOR c, LOCATION l " +
                  "WHERE a.Contractor_Id = r.Contractor_Id " +
                  "AND r.Client_Id = cl.Client_Id " +
                  "AND r.Contractor_Id = c.Contractor_ID " +
                  "AND l.Location_Id = r.Location_Id " +
                  "AND cl.Client_Id = r.Client_Id " +
                  "AND cl.Client_Id = " + clientId ;
            gvAllRequests.DataSource = objHelper.ExecuteSQL(sqlAllRequests);
            gvAllRequests.DataBind();
        }


        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

    }
}