using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CapaCliente
{
    public partial class Productos : System.Web.UI.Page
    {
        string cadenaConexion = "server=Terry\\SQLTERRY;Database=TiendaDB;Integrated Security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarProveedores();
                CargarProductos();
            }
        }

        private void CargarCategorias()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT IdCategoria, Nombre FROM Categorias";
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                DataTable tabla = new DataTable();
                adapter.Fill(tabla);

                ddlCategoria.DataSource = tabla;
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccionar Categoría", ""));
            }
        }

        private void CargarProveedores()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT IdProveedor, Nombre FROM Proveedores";
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                DataTable tabla = new DataTable();
                adapter.Fill(tabla);

                ddlProveedor.DataSource = tabla;
                ddlProveedor.DataBind();
                ddlProveedor.Items.Insert(0, new ListItem("Seleccionar Proveedor", ""));
            }
        }

        private void CargarProductos()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = @"SELECT p.IdProducto, p.Nombre, p.Precio, p.Stock, 
                                   c.Nombre as Categoria, pr.Nombre as Proveedor
                                   FROM Productos p
                                   INNER JOIN Categorias c ON p.IdCategoria = c.IdCategoria
                                   INNER JOIN Proveedores pr ON p.IdProveedor = pr.IdProveedor";
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                DataTable tabla = new DataTable();
                adapter.Fill(tabla);

                gvProductos.DataSource = tabla;
                gvProductos.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "INSERT INTO Productos (Nombre, Precio, Stock, IdCategoria, IdProveedor) VALUES (@Nombre, @Precio, @Stock, @IdCategoria, @IdProveedor)";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Precio", decimal.Parse(txtPrecio.Text));
                comando.Parameters.AddWithValue("@Stock", int.Parse(txtStock.Text));
                comando.Parameters.AddWithValue("@IdCategoria", int.Parse(ddlCategoria.SelectedValue));
                comando.Parameters.AddWithValue("@IdProveedor", int.Parse(ddlProveedor.SelectedValue));

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarProductos();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdProducto.Text))
            {
                // Mostrar mensaje de error
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "UPDATE Productos SET Nombre = @Nombre, Precio = @Precio, Stock = @Stock, IdCategoria = @IdCategoria, IdProveedor = @IdProveedor WHERE IdProducto = @IdProducto";
                SqlCommand comando = new SqlCommand(consulta, conexion);

                comando.Parameters.AddWithValue("@IdProducto", int.Parse(txtIdProducto.Text));
                comando.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                comando.Parameters.AddWithValue("@Precio", decimal.Parse(txtPrecio.Text));
                comando.Parameters.AddWithValue("@Stock", int.Parse(txtStock.Text));
                comando.Parameters.AddWithValue("@IdCategoria", int.Parse(ddlCategoria.SelectedValue));
                comando.Parameters.AddWithValue("@IdProveedor", int.Parse(ddlProveedor.SelectedValue));

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            LimpiarFormulario();
            CargarProductos();
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Obtener el ID del producto seleccionado
            int idProducto = Convert.ToInt32(gvProductos.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "SELECT * FROM Productos WHERE IdProducto = @IdProducto";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdProducto", idProducto);

                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    txtIdProducto.Text = reader["IdProducto"].ToString();
                    txtNombre.Text = reader["Nombre"].ToString();
                    txtPrecio.Text = reader["Precio"].ToString();
                    txtStock.Text = reader["Stock"].ToString();
                    ddlCategoria.SelectedValue = reader["IdCategoria"].ToString();
                    ddlProveedor.SelectedValue = reader["IdProveedor"].ToString();
                }

                reader.Close();
                conexion.Close();
            }
        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idProducto = Convert.ToInt32(gvProductos.DataKeys[e.RowIndex].Value);

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string consulta = "DELETE FROM Productos WHERE IdProducto = @IdProducto";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@IdProducto", idProducto);

                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }

            CargarProductos();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtIdProducto.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            ddlCategoria.SelectedIndex = 0;
            ddlProveedor.SelectedIndex = 0;
        }
    }
}