using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//LLamar a los driver de SQL server
using System.Data.SqlClient;
//Llamar a buffer de memoria 
using System.Data;

namespace CapaCliente
{
    public partial class Agenda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Declarar la cadena de conexión
            string cadena = "server=localhost;Database=BDAgenda;Integrated Security=true";

            //2. Conectarse con el servidor de SQL Server
            SqlConnection conexion = new SqlConnection(cadena);

            //3. Realizar la consulta a SQL Server
            string consulta = "select * from TContacto";
                //3.1 Enviar la consulta a la base de datos
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);

            //4. Traer la tabla a la grilla
            DataTable tabla = new DataTable(); //"Cesta de memoria (Buffer)"
            adapter.Fill(tabla); //Poner los datos en la "Cesta de memoria (Buffer)"

            //5. Mostrar los datos de la tabla
            gvAgenda.DataSource = tabla;
            gvAgenda.DataBind(); 
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //1. Declarar la cadena de conexión
            string cadena = "server=localhost;Database=BDAgenda;Integrated Security=true";

            //2. Conectarse con el servidor de SQL Server
            SqlConnection conexion = new SqlConnection(cadena);

            //3. Realizar la consulta a SQL Server
            string consulta = "insert into TContacto values(@CodContacto,@Apellidos,@Nombres,@Correo,@Telefono)";
                //3.1 Enviar la consulta a la base de datos
                SqlCommand comando = new SqlCommand(consulta,conexion);
                comando.CommandType = CommandType.Text;
                //3.2 Enviar los datos del formulario
                comando.Parameters.AddWithValue("@CodContacto",txtCodContacto.Text);
                comando.Parameters.AddWithValue("@Apellidos",txtApellidos.Text);
                comando.Parameters.AddWithValue("@Nombres",txtNombres.Text);
                comando.Parameters.AddWithValue("@Correo",txtCorreo.Text);
                comando.Parameters.AddWithValue("@Telefono",txtTelefono.Text);
                //3.3 Ejecutar la consulta
                // Abrir la conexion
                conexion.Open();
                byte i = Convert.ToByte(comando.ExecuteNonQuery());
                conexion.Close();

            //3. Realizar la consulta a SQL Server
            consulta = "select * from TContacto";
                //3.1 Enviar la consulta a la base de datos
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);

            //4. Traer la tabla a la grilla
            DataTable tabla = new DataTable(); //"Cesta de memoria (Buffer)"
            adapter.Fill(tabla); //Poner los datos en la "Cesta de memoria (Buffer)"

            //5. Mostrar los datos de la tabla
            gvAgenda.DataSource = tabla;
            gvAgenda.DataBind();

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            //1. Declarar la cadena de conexión
            string cadena = "server=localhost;Database=BDAgenda;Integrated Security=true";

            //2. Conectarse con el servidor de SQL Server
            SqlConnection conexion = new SqlConnection(cadena);

            //3. Realizar la consulta a SQL Server
            string consulta = "delete from TContacto where CodContacto=@CodContacto";
                //3.1 Enviar la consulta a la base de datos
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.CommandType = CommandType.Text;
                //3.2 Enviar los datos del formulario
                comando.Parameters.AddWithValue("@CodContacto", txtCodContacto.Text);
                // Abrir la conexion
                conexion.Open();
                byte i = Convert.ToByte(comando.ExecuteNonQuery());
                conexion.Close();

            //3. Realizar la consulta a SQL Server
            consulta = "select * from TContacto";
            //3.1 Enviar la consulta a la base de datos
            SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);

            //4. Traer la tabla a la grilla
            DataTable tabla = new DataTable(); //"Cesta de memoria (Buffer)"
            adapter.Fill(tabla); //Poner los datos en la "Cesta de memoria (Buffer)"

            //5. Mostrar los datos de la tabla
            gvAgenda.DataSource = tabla;
            gvAgenda.DataBind();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            //1. Declarar la cadena de conexión
            string cadena = "server=localhost;Database=BDAgenda;Integrated Security=true";

            //2. Conectarse con el servidor de SQL Server
            SqlConnection conexion = new SqlConnection(cadena);

            //3. Realizar la consulta a SQL Server
            string consulta = "update TContacto set CodContacto = @CodContacto, Apellidos = @Apellidos, Nombres = @Nombres, Correo = @Correo, Telefono = @Telefono where CodContacto=@CodContacto";
            //3.1 Enviar la consulta a la base de datos
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.CommandType = CommandType.Text;
            //3.2 Enviar los datos del formulario
            comando.Parameters.AddWithValue("@CodContacto", txtCodContacto.Text);
            comando.Parameters.AddWithValue("@Apellidos", txtApellidos.Text);
            comando.Parameters.AddWithValue("@Nombres", txtNombres.Text);
            comando.Parameters.AddWithValue("@Correo", txtCorreo.Text);
            comando.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
            //3.3 Ejecutar la consulta
            // Abrir la conexion
            conexion.Open();
            byte i = Convert.ToByte(comando.ExecuteNonQuery());
            conexion.Close();

            //3. Realizar la consulta a SQL Server
            consulta = "select * from TContacto";
            //3.1 Enviar la consulta a la base de datos
            SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);

            //4. Traer la tabla a la grilla
            DataTable tabla = new DataTable(); //"Cesta de memoria (Buffer)"
            adapter.Fill(tabla); //Poner los datos en la "Cesta de memoria (Buffer)"

            //5. Mostrar los datos de la tabla
            gvAgenda.DataSource = tabla;
            gvAgenda.DataBind();
        }
    }
}