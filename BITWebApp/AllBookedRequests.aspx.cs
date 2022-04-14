using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BITWebApp
{
    public partial class AllBookedRequests : System.Web.UI.Page
    {
        DataTable availableSessions;
        int requestId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Type"] == null || Session["Type"].ToString() != "Coordinator"
                    || Session["Coordinator_Id"].ToString() == null)
                {
                    // Response.Write("<script> alert('you are on the wrong page, will redirect to login') </script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LoadAllBookings();
                    LoadCompletedBookings();
                    LoadRejectedBookings();
                }
            }
        }

        private void LoadAllBookings()
        {
            string sql =
                "SELECT r.Request_Id, " +
                "a.WeekDayName, " +
                "a.Start_Time, " +
                "r.Location_Id, " +
                "r.Status " +
                "FROM AVAILABILITY a, " +
                "REQUEST r, " +
                "CONTRACTOR c " +
                "WHERE c.Contractor_Id = a.Contractor_Id " +
                "AND c.Contractor_Id = r.Contractor_Id " +
                " AND r.Status = 'Booked'";
            SQLHelper objHelper = new SQLHelper();
            gvAllBookings.DataSource = objHelper.ExecuteSQL(sql);
            gvAllBookings.DataBind();
        }

        private void LoadCompletedBookings()
        {
            string sql =
                "SELECT r.Request_Id, " +
                "a.WeekDayName, " +
                "a.Start_Time, " +
                "c.Cont_FNAME, " +
                "r.Location_Id, " +
                "r.Status " +
                "FROM AVAILABILITY a, " +
                "REQUEST r, " +
                "CONTRACTOR c " +
                "WHERE c.Contractor_Id = a.Contractor_Id " +
                "AND c.Contractor_Id = r.Contractor_Id " +
                " AND r.Status = 'Completed'";
            SQLHelper objHelper = new SQLHelper();
            gvCompletedBookings.DataSource = objHelper.ExecuteSQL(sql);
            gvCompletedBookings.DataBind();
        }

        private void LoadRejectedBookings()
        {
            string sql =
                "SELECT r.Request_Id, " +
                "a.WeekDayName, " +
                "a.Start_Time, " +
                "c.Cont_FNAME," +
                "r.Location_Id, " +
                "r.Status " +
                "FROM AVAILABILITY a, " +
                "REQUEST r, " +
                "CONTRACTOR c " +
                "WHERE c.Contractor_Id = a.Contractor_Id " +
                "AND c.Contractor_Id = r.Contractor_Id " +
                " AND r.Status = 'Rejected'";
            SQLHelper objHelper = new SQLHelper();
            gvRejectedBookings.DataSource = objHelper.ExecuteSQL(sql);
            gvRejectedBookings.DataBind();
        }
        protected void gvCompletedBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //update the Bookings table for that bookingid to change the status
            //to "Verified"
            if (e.CommandName == "Confirm")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCompletedBookings.Rows[rowIndex];
                string updatesql = "update REQUEST set status = 'Verified' " +
                    " where Request_Id = " + Convert.ToInt32(row.Cells[1].Text);
                SQLHelper helper = new SQLHelper();
                helper.ExecuteNonQuery(updatesql);
                LoadCompletedBookings();
            }
        }

        protected void gvRejectedBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvAvailableSessions_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }


}