<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CapaCliente._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tienda</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .header { background-color: #f8f9fa; padding: 20px; text-align: center; margin-bottom: 20px; }
        .menu { display: flex; justify-content: center; gap: 20px; }
        .menu-btn { padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; }
        .menu-btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Sistema de Gestión de Tienda</h1>
        </div>
        
        <div class="menu">
            <a href="productos.aspx" class="menu-btn">Gestionar Productos</a>
            <a href="cliente.aspx" class="menu-btn">Gestionar Clientes</a>
            <a href="Categorias.aspx" class="menu-btn">Gestionar Categorías</a>
        </div>
    </form>
</body>
</html>