using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CapaCliente
{
    public partial class Clientes : System.Web.UI.Page
    {
        //string cadenaConexion = "server=Terry\\SQLTERRY;Database=TiendaDB;Integrated Security=true";
        string cadenaConexion = "workstation id=TiendaDB12.mssql.somee.com;packet size=4096;user id=terryuwu_SQLLogin_1;pwd=zvhja1q6lj;data source=TiendaDB12.mssql.somee.com;persist security info=False;initial catalog=TiendaDB12;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
            }
        }

        private void CargarClientes()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT * FROM Clientes";
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                DataTable tabla = new DataTable();
                adapter.Fill(tabla);

                gvClientes.DataSource = tabla;
                gvClientes.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "INSERT INTO Clientes (Nombre, Telefono, Direccion) VALUES (@Nombre, @Telefono, @Direccion)";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                comando.Parameters.AddWithValue("@Direccion", txtDireccion.Text);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarClientes();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdCliente.Text))
            {
                // Mostrar mensaje de error
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "UPDATE Clientes SET Nombre = @Nombre, Telefono = @Telefono, Direccion = @Direccion WHERE IdCliente = @IdCliente";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@IdCliente", int.Parse(txtIdCliente.Text));
                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                comando.Parameters.AddWithValue("@Direccion", txtDireccion.Text);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarClientes();
        }

        protected void gvClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int idCliente = Convert.ToInt32(gvClientes.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT * FROM Clientes WHERE IdCliente = @IdCliente";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdCliente", idCliente);

                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    txtIdCliente.Text = reader["IdCliente"].ToString();
                    txtNombre.Text = reader["Nombre"].ToString();
                    txtTelefono.Text = reader["Telefono"].ToString();
                    txtDireccion.Text = reader["Direccion"].ToString();
                }

                reader.Close();
                conexion.Close();
            }
        }

        protected void gvClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idCliente = Convert.ToInt32(gvClientes.DataKeys[e.RowIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "DELETE FROM Clientes WHERE IdCliente = @IdCliente";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdCliente", idCliente);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            CargarClientes();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtIdCliente.Text = "";
            txtNombre.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
        }
    }
}