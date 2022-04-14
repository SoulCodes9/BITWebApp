using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BITWebApp
{
    public partial class NewRequest : System.Web.UI.Page
    {
        DataTable availableSessions;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                calBookDate.SelectedDate = DateTime.Now.Date;
                SQLHelper helper = new SQLHelper();
                string sql = "SELECT Skill_Name from SKILL";
                ddlSkills.DataSource = helper.ExecuteSQL(sql);
                ddlSkills.DataBind();
                ddlSkills.DataTextField = "Skill_Name";
                ddlSkills.DataBind();

                string sqlLocation = "SELECT Location_Id, CONCAT(Address, Suburb_Name) as Address from location" +
                    " WHERE Client_Id = " + Convert.ToInt32(Session["Client_Id"]);
                ddlLocation.DataSource = helper.ExecuteSQL(sqlLocation);
                ddlLocation.DataBind();
                ddlLocation.DataTextField = "Address";
                ddlLocation.DataValueField = "Location_Id";
                ddlLocation.DataBind();
            }
        }

        protected void btnFindSessions_Click(object sender, EventArgs e)
        {
            if (calBookDate.SelectedDate == null || ddlStartTime.SelectedValue == "" || ddlLocation.SelectedValue == "")
            {
                Response.Write("<script> alert('Select date, time and pickup address') </script>");
            }
            else
            {
                availableSessions = AvailableRequests.GetAllAvailableRequests(ddlLocation.SelectedValue, calBookDate.SelectedDate, ddlStartTime.SelectedValue, ddlEndTime.SelectedValue, ddlSkills.SelectedValue);
                gvAvailableSessions.DataSource = availableSessions;
                gvAvailableSessions.DataBind();
            }
        }

        protected void gvAvailableSessions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvAvailableSessions.Rows[rowIndex];

                string sql =
                     "INSERT INTO REQUEST( " +
                     " Location_Id, " +
                     " Skill_Name, " +
                     " Date_Of_Job, " +
                     " Client_Id, " +
                     " Start_Time, " +
                     " End_Time, " +
                     " Contractor_Id, " +
                     " Km_Travelled, " +
                     " Status ) " +
                     " VALUES( " +
                     ddlLocation.SelectedValue + ",  '" +
                     ddlSkills.SelectedValue + "' ,  '" +
                     calBookDate.SelectedDate.ToString("yyyy-MM-dd") + "' , " +
                     Convert.ToInt32(Session["Client_Id"]) + ", '" +
                     ddlStartTime.SelectedValue + "' ,  '" +
                    ddlEndTime.SelectedValue + "' , '" +
                    row.Cells[1].Text +
                    "',  0, " +
                    " 'Booked') ";
                SQLHelper objHelper = new SQLHelper();
                objHelper.ExecuteNonQuery(sql);
                Response.Write("Request confirmed");
                Response.Redirect("CurrentRequests.aspx");

            }
        }

        protected void calBookDate_SelectionChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //
            }
        }
    }
}