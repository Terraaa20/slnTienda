using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CapaCliente
{
    public partial class Categorias : System.Web.UI.Page
    {
        string cadenaConexion = "server=Terry\\SQLTERRY;Database=TiendaDB;Integrated Security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
            }
        }

        private void CargarCategorias()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT * FROM Categorias";
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                DataTable tabla = new DataTable();
                adapter.Fill(tabla);

                gvCategorias.DataSource = tabla;
                gvCategorias.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "INSERT INTO Categorias (Nombre, Descripcion) VALUES (@Nombre, @Descripcion)";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Descripcion", txtDescripcion.Text);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarCategorias();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdCategoria.Text))
            {
                // Mostrar mensaje de error
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "UPDATE Categorias SET Nombre = @Nombre, Descripcion = @Descripcion WHERE IdCategoria = @IdCategoria";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@IdCategoria", int.Parse(txtIdCategoria.Text));
                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Descripcion", txtDescripcion.Text);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarCategorias();
        }

        protected void gvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int idCategoria = Convert.ToInt32(gvCategorias.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT * FROM Categorias WHERE IdCategoria = @IdCategoria";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdCategoria", idCategoria);

                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    txtIdCategoria.Text = reader["IdCategoria"].ToString();
                    txtNombre.Text = reader["Nombre"].ToString();
                    txtDescripcion.Text = reader["Descripcion"].ToString();
                }

                reader.Close();
                conexion.Close();
            }
        }

        protected void gvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idCategoria = Convert.ToInt32(gvCategorias.DataKeys[e.RowIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "DELETE FROM Categorias WHERE IdCategoria = @IdCategoria";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdCategoria", idCategoria);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            CargarCategorias();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtIdCategoria.Text = "";
            txtNombre.Text = "";
            txtDescripcion.Text = "";
        }
    }
}