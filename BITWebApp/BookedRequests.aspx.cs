using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BITWebApp
{
    public partial class BookedRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//!IsPostBack is a condition that you instructing your page to be loaded with the same
                            //data if a button on the page is clicked
            {
                if (Session["Type"] == null || Session["Type"].ToString() != "Contractor")
                {
                    // Response.Write("<script> alert('you are on the wrong page, will redirect to login') </script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    RefreshBookedDataGrid();
                    RefreshAcceptedDataGrid();
                }
            }
        }

        private void RefreshBookedDataGrid()
        {
            int contractorid = Convert.ToInt32(Session["Contractor_Id"].ToString());
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
                " AND c.contractor_Id = " + contractorid +
                " AND r.Status = 'Booked'";
            SQLHelper objHelper = new SQLHelper();
            gvBookedSessions.DataSource = objHelper.ExecuteSQL(sql);
            gvBookedSessions.DataBind();
        }

        private void RefreshAcceptedDataGrid()
        {
            int contractorid = Convert.ToInt32(Session["Contractor_Id"].ToString());
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
                " AND c.contractor_Id = " + contractorid +
                " AND r.Status = 'Accepted'";
            SQLHelper objHelper = new SQLHelper();
            gvAcceptedSessions.DataSource = objHelper.ExecuteSQL(sql);
            gvAcceptedSessions.DataBind();
        }

        protected void gvAcceptedSessions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Complete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvAcceptedSessions.Rows[rowIndex];
                int kilometers = Convert.ToInt32(((TextBox)row.FindControl("txtKilometers")).Text.Trim());
                string updateSQL = "UPDATE REQUEST SET Status = 'Completed', Km_Travelled = " + kilometers +
                    " WHERE Request_Id = " + Convert.ToInt32(row.Cells[2].Text);
                SQLHelper helper = new SQLHelper();
                helper.ExecuteNonQuery(updateSQL);
                RefreshAcceptedDataGrid();
            }
        }

        protected void gvBookedSessions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvBookedSessions.Rows[rowIndex];
                string updatesql = "update REQUEST set Status = 'Accepted' " +
                    " where Request_Id = " + Convert.ToInt32(row.Cells[2].Text);
                SQLHelper helper = new SQLHelper();
                helper.ExecuteNonQuery(updatesql);
                RefreshBookedDataGrid();
                RefreshAcceptedDataGrid();
            }
            else if (e.CommandName == "Reject")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvBookedSessions.Rows[rowIndex];
                string updatesql = "UPDATE REQUEST set Status = 'Rejected' " +
                    " where Request_Id = " + Convert.ToInt32(row.Cells[2].Text);
                SQLHelper helper = new SQLHelper();
                helper.ExecuteNonQuery(updatesql);
                RefreshBookedDataGrid();
                RefreshAcceptedDataGrid();
            }
        }
    }
}