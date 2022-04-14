using System;
using System.Data;

namespace BITWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            string sqlClient =
                "SELECT Client_Id, Email " +
                "FROM CLIENT " +
                "WHERE Email = '" + email +
             "' AND Password = '" + password + "'";

            SQLHelper sqlHelper = new SQLHelper();
            DataTable clientRecordsRead = sqlHelper.ExecuteSQL(sqlClient);

            if (clientRecordsRead.Rows.Count >= 1) //If the login details are from the Client table
            {
                int clientId = Convert.ToInt32(clientRecordsRead.Rows[0][0].ToString());

                Session.Add("Client_Id", clientId);
                Session.Add("Type", "Client");
                Response.Redirect("CurrentRequests.aspx");
            }
            else
            {
                string sqlContractor =
                    "SELECT Contractor_Id, Email " +
                    "FROM CONTRACTOR " +
                    "WHERE Email = '" + email +
                    "' AND Password = '" + password + "'";
                DataTable contractorRecordRead = sqlHelper.ExecuteSQL(sqlContractor);
                if (contractorRecordRead.Rows.Count >= 1)
                {
                    int contractorId = Convert.ToInt32(contractorRecordRead.Rows[0][0].ToString());

                    Session.Add("Contractor_Id", contractorId);
                    Session.Add("Type", "Contractor");
                    Response.Redirect("BookedRequests.aspx");
                }
                else
                {
                    string sqlStaff =
                        "SELECT Coordinator_Id, Email from COORDINATOR " +
                        " WHERE Email = '" + email +
                         "' AND Password = '" + password + "'";
                    DataTable staffRecordsRead = sqlHelper.ExecuteSQL(sqlStaff);
                    if (staffRecordsRead.Rows.Count >= 1)
                    {
                        int staffid = Convert.ToInt32(staffRecordsRead.Rows[0][0].ToString());
                        Session.Add("Coordinator_Id", staffid);
                        Session.Add("Type", "Coordinator");
                        Response.Redirect("AllBookedRequests.aspx");
                    }
                    else
                    {
                        Response.Write("alert(username or password incorrect)");
                    }
                }
            }
        }
    }
}