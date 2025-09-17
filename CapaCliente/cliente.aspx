<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CapaCliente.Clientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Clientes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;800&family=Orbitron:wght@600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6c42f5;
            --secondary: #2bd2ff;
            --accent: #ff2b9e;
            --dark: #0f172a;
            --light: #f8fafc;
            --success: #00e699;
            --warning: #ffcc00;
            --danger: #ff2b4e;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, var(--dark) 0%, #1e293b 100%);
            color: var(--light);
            min-height: 100vh;
            overflow-x: hidden;
            margin: 0;
            padding: 20px;
        }
        
        .grid-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(rgba(108, 66, 245, 0.1) 1px, transparent 1px),
                linear-gradient(90deg, rgba(108, 66, 245, 0.1) 1px, transparent 1px);
            background-size: 40px 40px;
            z-index: -1;
            perspective: 1000px;
        }
        
        .floating-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .particle {
            position: absolute;
            border-radius: 50%;
            background: radial-gradient(circle, var(--primary) 0%, transparent 70%);
            opacity: 0.4;
            animation: float 15s infinite ease-in-out;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) translateX(0); }
            25% { transform: translateY(-20px) translateX(10px); }
            50% { transform: translateY(-35px) translateX(-15px); }
            75% { transform: translateY(-15px) translateX(-5px); }
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        .nav-link {
            display: inline-flex;
            align-items: center;
            margin-bottom: 25px;
            padding: 10px 20px;
            background: rgba(30, 41, 59, 0.7);
            color: var(--secondary);
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .nav-link:hover {
            background: rgba(108, 66, 245, 0.5);
            transform: translateX(-5px);
            box-shadow: 0 5px 20px rgba(108, 66, 245, 0.4);
        }
        
        .nav-link i {
            margin-right: 8px;
        }
        
        .header {
            text-align: center;
            padding: 20px 0 40px;
            position: relative;
            overflow: hidden;
        }
        
        .header h1 {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 15px;
            background: linear-gradient(90deg, var(--secondary), var(--accent), var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 20px rgba(43, 210, 255, 0.3);
            letter-spacing: 1px;
        }
        
        .header p {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
            color: #cbd5e1;
            line-height: 1.6;
        }
        
        .form-section {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .form-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
        }
        
        .form-section h2 {
            font-size: 1.8rem;
            margin-bottom: 25px;
            color: var(--light);
            display: flex;
            align-items: center;
        }
        
        .form-section h2 i {
            margin-right: 12px;
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary);
            display: flex;
            align-items: center;
        }
        
        .form-group label i {
            margin-right: 8px;
            width: 20px;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 18px;
            background: rgba(15, 23, 42, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            color: var(--light);
            font-family: 'Montserrat', sans-serif;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(108, 66, 245, 0.3);
        }
        
        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }
        
        .btn-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 14px 28px;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-family: 'Montserrat', sans-serif;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
            z-index: -1;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn-primary {
            background: linear-gradient(90deg, var(--primary), var(--accent));
            color: white;
        }
        
        .btn-primary:hover {
            box-shadow: 0 0 25px rgba(108, 66, 245, 0.5);
            transform: translateY(-3px);
        }
        
        .btn-success {
            background: linear-gradient(90deg, var(--success), #00c884);
            color: white;
        }
        
        .btn-success:hover {
            box-shadow: 0 0 25px rgba(0, 230, 153, 0.5);
            transform: translateY(-3px);
        }
        
        .btn-warning {
            background: linear-gradient(90deg, var(--warning), #ffaa00);
            color: black;
        }
        
        .btn-warning:hover {
            box-shadow: 0 0 25px rgba(255, 204, 0, 0.5);
            transform: translateY(-3px);
        }
        
        .btn-danger {
            background: linear-gradient(90deg, var(--danger), #ff1a44);
            color: white;
        }
        
        .btn-danger:hover {
            box-shadow: 0 0 25px rgba(255, 43, 78, 0.5);
            transform: translateY(-3px);
        }
        
        .grid-view {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 30px;
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .grid-view th {
            background: linear-gradient(90deg, var(--primary), var(--accent));
            color: white;
            padding: 16px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }
        
        .grid-view td {
            padding: 16px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            color: #cbd5e1;
        }
        
        .grid-view tr:last-child td {
            border-bottom: none;
        }
        
        .grid-view tr:nth-child(even) {
            background-color: rgba(15, 23, 42, 0.3);
        }
        
        .grid-view tr:hover {
            background-color: rgba(108, 66, 245, 0.1);
        }
        
        .grid-view .btn-grid {
            padding: 8px 16px;
            font-size: 0.85rem;
            border-radius: 30px;
            display: inline-flex;
            align-items: center;
            margin: 2px;
        }
        
        .grid-view .btn-grid i {
            margin-right: 5px;
        }
        
        .button-group {
            position: fixed;
            top: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            z-index: 1000;
        }
        
        .custom-btn {
            background: rgba(30, 41, 59, 0.8);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            position: relative;
        }
        
        .custom-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 0 20px rgba(43, 210, 255, 0.3);
            background: rgba(108, 66, 245, 0.8);
        }
        
        .custom-btn i {
            font-size: 1.2rem;
            color: var(--secondary);
        }
        
        .btn-tooltip {
            position: absolute;
            right: 60px;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(30, 41, 59, 0.9);
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            white-space: nowrap;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            pointer-events: none;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .custom-btn:hover .btn-tooltip {
            opacity: 1;
            visibility: visible;
            right: 65px;
        }
        
        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.2rem;
            }
            
            .btn-group {
                flex-direction: column;
                width: 100%;
            }
            
            .btn {
                width: 100%;
            }
            
            .grid-view {
                display: block;
                overflow-x: auto;
            }
            
            .button-group {
                top: 10px;
                right: 10px;
            }
            
            .btn-tooltip {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="grid-background"></div>
    <div class="floating-particles" id="particles"></div>
    
    <!-- Grupo de botones de acceso rápido -->
    <div class="button-group">
        <!-- Botón 1: Información del sistema -->
        <a href="https://terraaa20.github.io/informeee1" class="custom-btn" title="Infografia">
            <i class="fas fa-info"></i>
            <span class="btn-tooltip">Infografia</span>
        </a>
        
        <!-- Botón 2: Documentación -->
        <a href="https://drive.google.com/file/d/1tFDS0F-IU2hrD7wqIveslM6G8njJttYB/view?usp=drive_link" class="custom-btn" title="Documentación">
            <i class="fas fa-file-alt"></i>
            <span class="btn-tooltip">Documentación</span>
        </a>
        
        <!-- Botón 3: Repositorio GitHub -->
        <a href="https://github.com/Terraaa20/slnTienda.git" class="custom-btn" title="Repositorio GitHub">
            <i class="fab fa-github"></i>
            <span class="btn-tooltip">Repositorio GitHub</span>
        </a>
    </div>
    
    <form id="form1" runat="server">
        <div class="container">
            <a href="Default.aspx" class="nav-link">
                <i class="fas fa-arrow-left"></i>Volver al Inicio
            </a>
            
            <div class="header">
                <h1>Gestión de Clientes</h1>
            </div>
            
            <!-- Formulario para agregar/editar clientes -->
            <div class="form-section">
                <h2><i class="fas fa-users"></i>Datos del Cliente</h2>
                
                <div class="form-group">
                    <label for="txtIdCliente"><i class="fas fa-key"></i>ID Cliente:</label>
                    <asp:TextBox ID="txtIdCliente" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtNombre"><i class="fas fa-user"></i>Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtTelefono"><i class="fas fa-phone"></i>Teléfono:</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtDireccion"><i class="fas fa-map-marker-alt"></i>Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                </div>
                
                <div class="btn-group">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
                </div>
            </div>
            
            <!-- GridView para mostrar los clientes -->
            <asp:GridView ID="gvClientes" runat="server" CssClass="grid-view" AutoGenerateColumns="False" 
                OnRowDeleting="gvClientes_RowDeleting" OnRowEditing="gvClientes_RowEditing" DataKeyNames="IdCliente">
                <Columns>
                    <asp:BoundField DataField="IdCliente" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText=" Editar" ControlStyle-CssClass="btn btn-primary btn-grid" >
                        <ControlStyle CssClass="btn btn-primary btn-grid"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText=" Eliminar" ControlStyle-CssClass="btn btn-danger btn-grid" >
                        <ControlStyle CssClass="btn btn-danger btn-grid"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script>
        // Crear partículas flotantes
        function createParticles() {
            const container = document.getElementById('particles');
            const particleCount = 20;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');

                const size = Math.random() * 60 + 10;
                const posX = Math.random() * 100;
                const posY = Math.random() * 100;
                const delay = Math.random() * 15;

                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                particle.style.left = `${posX}vw`;
                particle.style.top = `${posY}vh`;
                particle.style.animationDelay = `${delay}s`;

                // Colores aleatorios
                const colors = [
                    'rgba(108, 66, 245, 0.4)',
                    'rgba(43, 210, 255, 0.4)',
                    'rgba(255, 43, 158, 0.4)'
                ];
                const randomColor = colors[Math.floor(Math.random() * colors.length)];
                particle.style.background = `radial-gradient(circle, ${randomColor} 0%, transparent 70%)`;

                container.appendChild(particle);
            }
        }

        // Inicializar
        document.addEventListener('DOMContentLoaded', function () {
            createParticles();
        });
    </script>
</body>
</html>