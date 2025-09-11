<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CapaCliente.Clientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Clientes</title>
    <style>
        /* Mismos estilos que Productos.aspx */
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 1200px; margin: 0 auto; }
        .form-section { margin-bottom: 20px; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"] { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
        .btn { padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-danger { background-color: #dc3545; color: white; }
        .btn-success { background-color: #28a745; color: white; }
        .btn-warning { background-color: #ffc107; color: black; }
        .grid-view { width: 100%; margin-top: 20px; border-collapse: collapse; }
        .grid-view th, .grid-view td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        .grid-view th { background-color: #f8f9fa; }
        .nav-link { margin-right: 15px; text-decoration: none; color: #007bff; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <a href="Default.aspx" class="nav-link">← Volver al Inicio</a>
            <h1>Gestión de Clientes</h1>
            
            <!-- Formulario para agregar/editar clientes -->
            <div class="form-section">
                <h2>Datos del Cliente</h2>
                <div class="form-group">
                    <label for="txtIdCliente">ID Cliente:</label>
                    <asp:TextBox ID="txtIdCliente" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtNombre">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtTelefono">Teléfono:</label>
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDireccion">Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
            </div>
            
            <!-- GridView para mostrar los clientes -->
            <asp:GridView ID="gvClientes" runat="server" CssClass="grid-view" AutoGenerateColumns="False" 
                OnRowDeleting="gvClientes_RowDeleting" OnRowEditing="gvClientes_RowEditing" DataKeyNames="IdCliente">
                <Columns>
                    <asp:BoundField DataField="IdCliente" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Editar" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Eliminar" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>