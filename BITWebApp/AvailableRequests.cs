using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BITWebApp
{
    public class AvailableRequests
    {
        public AvailableRequests()
        {

        }

        public static DataTable GetAllAvailableRequests(string suburb, DateTime dayname, string startTime, string endTime, string skill)
        {
            string sqlStr =
              "SELECT DISTINCT c.Contractor_Id, " +
              "a.Start_Time, " +
              " a.End_Time, " +
              "a.WeekDayName, " +
              "c.Cont_FName, " +
              "c.Cont_LName " +
              "FROM " +
              "AVAILABILITY a, " +
              "CONTRACTOR c, " +
              "CONTRACTOR_SKILL cs, " +
              "REQUEST r, " +
              "LOCATION l " +
              " WHERE " +
              "c.Contractor_Id = a.Contractor_Id " +
              "AND a.Contractor_Id = r.Contractor_Id " +
              "AND a.WeekDayName = '" + dayname +
              "' AND ( '" + startTime + "' >= a.Start_Time AND '" + startTime + "' <= a.End_Time) " +
              " OR ( '" + endTime + "' >= a.Start_Time AND '" + endTime + "' <= a.End_Time) " +
              " or ( '" + startTime + "' < a.Start_Time AND '" + endTime + "' > a.End_Time) " +
              " AND cs.Skill_Name = '" + skill + "' AND c.Status = 'Active' " +
              " AND l.Suburb_Name = '" + suburb + "'";

            SQLHelper objHelper = new SQLHelper();
            return objHelper.ExecuteSQL(sqlStr);
        }
    }
}