<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="CapaCliente.Agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Esta es mi agenda personal</p>
    <p>Eliab Zamalloa</p>
    <p>Universidad Continental</p>
    <p>CodContacto: <asp:TextBox runat="server" Id="txtCodContacto"/> </p>
    <p>Apellidos: <asp:TextBox runat="server" Id="txtApellidos"/> </p>
    <p>Nombres: <asp:TextBox runat="server" Id="txtNombres"/> </p>
    <p>Correo: <asp:TextBox runat="server" Id="txtCorreo"/> </p>
    <p>Telefono <asp:TextBox runat="server" Id="txtTelefono"/> </p>
    <p>
        <asp:Button Text="Agregar" runat="server" Id="btnAgregar" OnClick="btnAgregar_Click"/>
        <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" OnClick="btnEliminar_Click"/>
        <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" />
    </p>

    <!--Mostrar la tabla Agenda-->
    <asp:GridView runat="server" ID="gvAgenda" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</asp:Content>
