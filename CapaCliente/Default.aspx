<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión</title>
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
            padding: 0;
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
        
        .header {
            text-align: center;
            padding: 40px 20px;
            position: relative;
            overflow: hidden;
        }
        
        .header h1 {
            font-family: 'Orbitron', sans-serif;
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 20px;
            background: linear-gradient(90deg, var(--secondary), var(--accent), var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 20px rgba(43, 210, 255, 0.3);
            letter-spacing: 1px;
        }
        
        .header p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
            color: #cbd5e1;
            line-height: 1.6;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 40px;
            padding: 20px;
        }
        
        .card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            transition: all 0.4s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 320px;
        }
        
        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
        }
        
        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 15px 35px rgba(108, 66, 245, 0.3);
        }
        
        .card-icon {
            font-size: 4rem;
            margin-bottom: 25px;
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transition: all 0.3s ease;
        }
        
        .card:hover .card-icon {
            transform: scale(1.2);
        }
        
        .card h3 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: var(--light);
        }
        
        .card p {
            color: #94a3b8;
            margin-bottom: 30px;
            font-size: 1rem;
            line-height: 1.6;
            max-width: 300px;
        }
        
        .card-btn {
            display: inline-block;
            padding: 14px 30px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-family: 'Montserrat', sans-serif;
            position: relative;
            overflow: hidden;
            z-index: 1;
            font-size: 1.1rem;
            letter-spacing: 0.5px;
        }
        
        .card-btn::before {
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
        
        .card-btn:hover::before {
            left: 100%;
        }
        
        .card-btn:hover {
            box-shadow: 0 0 25px rgba(108, 66, 245, 0.5);
            transform: translateY(-3px);
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
        
        .footer {
            margin-top: auto;
            text-align: center;
            padding: 30px;
            color: #64748b;
            font-size: 0.9rem;
        }
        
        /* Animaciones */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .animated {
            opacity: 0;
            animation: fadeIn 0.8s ease forwards;
        }
        
        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        
        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.5rem;
            }
            
            .dashboard {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .card {
                min-height: 280px;
                padding: 30px 20px;
            }
            
            .card-icon {
                font-size: 3rem;
            }
            
            .card h3 {
                font-size: 1.5rem;
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
    
    <div class="container">
        <div class="header">
            <h1>Sistema de Gestión de Tienda</h1>
        </div>
        
        <div class="dashboard">
            <div class="card animated">
                <div class="card-icon"><i class="fas fa-box-open"></i></div>
                <h3>Gestionar Productos</h3>
                <p>Controla tu inventario, precios y disponibilidad de productos en tiempo real.</p>
                <a href="productos.aspx" class="card-btn">Acceder</a>
            </div>
            
            <div class="card animated delay-1">
                <div class="card-icon"><i class="fas fa-users"></i></div>
                <h3>Gestionar Clientes</h3>
                <p>Administra la información de tus clientes y su historial de compras.</p>
                <a href="cliente.aspx" class="card-btn">Acceder</a>
            </div>
            
            <div class="card animated delay-2">
                <div class="card-icon"><i class="fas fa-tags"></i></div>
                <h3>Gestionar Categorías</h3>
                <p>Organiza tus productos en categorías para una mejor gestión.</p>
                <a href="Categorias.aspx" class="card-btn">Acceder</a>
            </div>
        </div>
        
      
    </div>

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

        // Efectos de aparición para elementos
        function animateOnScroll() {
            const elements = document.querySelectorAll('.animated');

            elements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;

                if (elementPosition < screenPosition) {
                    element.style.opacity = 1;
                    element.style.transform = 'translateY(0)';
                }
            });
        }

        // Inicializar
        document.addEventListener('DOMContentLoaded', function () {
            createParticles();
            window.addEventListener('scroll', animateOnScroll);
            animateOnScroll(); // Ejecutar una vez al cargar
        });
    </script>
</body>
</html>