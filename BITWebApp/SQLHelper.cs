using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BITWebApp
{
    public class SQLHelper
    {
        private string _conn;
        public SQLHelper()
        {
            _conn = ConfigurationManager.ConnectionStrings["BIT"].ConnectionString;
        }
        public DataTable ExecuteSQL(string sql, SqlParameter[] sqlParameters = null,
           bool storedProcedure = false)
        {
            SqlConnection dbConnection = new SqlConnection(_conn);
            DataTable dataTable = new DataTable();
            //SqlCommand in Sql Client language it is any query or stored procedure

            SqlCommand dbCommand = new SqlCommand(sql, dbConnection);
            if (storedProcedure == true)
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                dbConnection.Open();
                SqlDataReader drResults = dbCommand.ExecuteReader(CommandBehavior.CloseConnection);
                dataTable.Load(drResults);
                return dataTable;
            }
            catch (SqlException ex) //more specialized Exceptions to be caught first
            {
                dbConnection.Close();
                throw new Exception(ex.Message);
            }
            catch (Exception ex)//Remember in the framework Exception is the base class for
            //all specialized exceptions so in multiple catch statements this generic exception
            //must be the last one to catch
            {
                throw new Exception(ex.Message);
            }
        }
        //Refactoring concept where all the physical database related functionalities are separated out
        //to a different class.
        public int ExecuteNonQuery(string sql, SqlParameter[] sqlParameters = null,
            bool storedProcedure = false)
        {
            int returnValue = -1;
            SqlConnection dbConnection = new SqlConnection(_conn);

            SqlCommand dbCommand = new SqlCommand(sql, dbConnection);
            if (sqlParameters != null)
            {
                AddParameters(dbCommand, sqlParameters);//important line
            }
            if (storedProcedure)
            {
                dbCommand.CommandType = CommandType.StoredProcedure; //important line
            }
            try
            {
                dbConnection.Open();
                returnValue = dbCommand.ExecuteNonQuery(); //important line
                return returnValue;

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }

        }
        private void AddParameters(SqlCommand objCommand, SqlParameter[] sqlParameters)
        {
            for (int i = 0; i < sqlParameters.Length; i++)
            {
                objCommand.Parameters.Add(sqlParameters[i]);
            }

        }
    }
}
