using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TesteGrid.Interfaces;
using TesteGrid.Model;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TesteGrid.Repositories
{
    public class ICarteiraRepositorio : ICarteira
    {
        private string ConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        }


        public DataSet GetCarteiras()
        {
            DataSet ds = new DataSet();
            ds.DataSetName = "carteiras";

            SqlConnection conn = new SqlConnection(ConnectionString());
            conn.Open();

            SqlCommand command = new SqlCommand("select * from tbCarteiras");
            command.CommandType = CommandType.Text;
            command.Connection = conn;

            using (conn)
            {
                using (SqlDataAdapter da = new SqlDataAdapter())
                {
                    da.SelectCommand = command;
                    da.Fill(ds);
                }
            }

            return ds;
        }

        public void SaveCarteira(Carteira carteira)
        {
            SqlConnection conn = new SqlConnection(ConnectionString());
            conn.Open();

            string query = String.Format("insert into tbCarteiras values ('{0}',{1},{2},{3},{4})", carteira.Perfil,
                carteira.Mes, carteira.Ano, carteira.CDI12m, carteira.CDI24m);

            SqlCommand command = new SqlCommand(query);
            command.CommandType = CommandType.Text;
            command.Connection = conn;
            command.ExecuteNonQuery();

        }
    }
}