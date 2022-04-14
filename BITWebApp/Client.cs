using System;
using System.Data;
using System.Data.SqlClient;

namespace BITWebApp
{
    public class Client
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Street { get; set; }
        public string Suburb { get; set; }
        public string PostCode { get; set; }
        public string State { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; } //Username
        public DateTime DOB { get; set; }
        public string Password { get; set; }

        private SQLHelper _db;

        public Client()
        {
            _db = new SQLHelper();
        }

        public int InsertClient()
        {
            int returnValue = -1;
            string sqlStr =
                "INSERT INTO CLIENT " +
                "(Client_FName, " +
                "Client_LName, " +
                "Street, " +
                "Suburb, " +
                "PostCode, " +
                "State, " +
                "Phone, " +
                "Email, " +
                "Date_Of_Birth, " +
                "Password, " +
                "Status) " +
                "" +
                "VALUES ( " +
                "@FName, " +
                "@LName, " +
                "@Street, " +
                "@Suburb, " +
                "@Postcode, " +
                "@State, " +
                "@Phone, " +
                "@Email, " +
                "@DOB, " +
                "@Password, " +
                "'Active')";
            SqlParameter[] objParams;
            objParams = new SqlParameter[10];
            objParams[0] = new SqlParameter("@FName", DbType.String);
            objParams[0].Value = FirstName;
            objParams[1] = new SqlParameter("@LName", DbType.String);
            objParams[1].Value = LastName;
            objParams[2] = new SqlParameter("@Street", DbType.String);
            objParams[2].Value = Street;
            objParams[3] = new SqlParameter("@Suburb", DbType.String);
            objParams[3].Value = Suburb;
            objParams[4] = new SqlParameter("@Postcode", DbType.String);
            objParams[4].Value = PostCode;
            objParams[5] = new SqlParameter("@State", DbType.String);
            objParams[5].Value = State;
            objParams[6] = new SqlParameter("@Phone", DbType.String);
            objParams[6].Value = Phone;
            objParams[7] = new SqlParameter("@Email", DbType.String);
            objParams[7].Value = Email;
            objParams[8] = new SqlParameter("@DOB", DbType.DateTime);
            objParams[8].Value = DOB;
            objParams[9] = new SqlParameter("@Password", DbType.String);
            objParams[9].Value = Password;
            returnValue = _db.ExecuteNonQuery(sqlStr, objParams);

            return returnValue;
        }
    }
}