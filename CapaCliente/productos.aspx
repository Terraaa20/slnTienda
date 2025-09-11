<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="CapaCliente.Productos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Productos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 1200px; margin: 0 auto; }
        .form-section { margin-bottom: 20px; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="number"] { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
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
            <h1>Gestión de Productos</h1>
            
            <!-- Formulario para agregar/editar productos -->
            <div class="form-section">
                <h2>Datos del Producto</h2>
                <div class="form-group">
                    <label for="txtIdProducto">ID Producto:</label>
                    <asp:TextBox ID="txtIdProducto" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtNombre">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPrecio">Precio:</label>
                    <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtStock">Stock:</label>
                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlCategoria">Categoría:</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" DataTextField="Nombre" DataValueField="IdCategoria"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlProveedor">Proveedor:</label>
                    <asp:DropDownList ID="ddlProveedor" runat="server" DataTextField="Nombre" DataValueField="IdProveedor"></asp:DropDownList>
                </div>
                
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
            </div>
            
            <!-- GridView para mostrar los productos -->
            <asp:GridView ID="gvProductos" runat="server" CssClass="grid-view" AutoGenerateColumns="False" 
                OnRowDeleting="gvProductos_RowDeleting" OnRowEditing="gvProductos_RowEditing" DataKeyNames="IdProducto">
                <Columns>
                    <asp:BoundField DataField="IdProducto" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Editar" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Eliminar" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>