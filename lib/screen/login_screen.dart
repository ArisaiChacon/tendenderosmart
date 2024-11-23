import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa HomeScreen
import 'register_screen.dart'; // Importa RegisterScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo blanco en toda la pantalla
          Container(
            color: Color(0xFFFFFFFF), // Color blanco
          ),
          // Ola azul en la parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: InvertedWaveClipper(),
              child: Container(
                height: 200, // Altura de la ola
                color: Color(0xFF92D4E3), // Color azul claro
              ),
            ),
          ),
          // Contenido del formulario de inicio de sesión en el centro de la pantalla
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido a TendederoSmart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF13596B), // Color verde oscuro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Imagen del logo debajo del texto de bienvenida
                  Image.asset(
                    'assets/images/logo.png', // Ruta de tu logo
                    height: 100, // Tamaño del logo
                  ),
                  SizedBox(height: 20),
                  _buildTextField('Correo electrónico'),
                  SizedBox(height: 20),
                  _buildTextField('Contraseña', obscureText: true),
                  SizedBox(height: 10),
                  // Texto para registro
                  GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de registro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      '¿No tienes cuenta? Regístrate aquí',
                      style: TextStyle(
                        color: Color(0xFF61C6DE), // Azul claro
                        fontSize: 14,
                       
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar a la pantalla principal
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), // Navegación a HomeScreen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF13596B), // Color del botón
                      minimumSize: Size(double.infinity, 60), // Botón más largo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Leve redondeo en las puntas
                      ),
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white), // Color del texto del botón
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xFF13596B)), // Color verde oscuro
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF13596B)), // Línea inferior verde oscuro
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF61C6DE)), // Línea inferior azul cielo al enfocar
            ),
          ),
        ),
      ],
    );
  }
}

// Clipper personalizado para crear el diseño de ola invertida
class InvertedWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Comenzar en la parte inferior

    // Crear la forma de ola invertida
    path.quadraticBezierTo(
      size.width / 4, size.height, // Punto de control
      size.width / 2, size.height - 50, // Punto final de la primera ola
    );
    path.quadraticBezierTo(
      3 * size.width / 4, size.height - 100, // Punto de control
      size.width, size.height - 50, // Punto final de la segunda ola
    );
    path.lineTo(size.width, size.height); // Línea recta en la parte inferior
    path.lineTo(0, size.height); // Línea recta en la parte inferior
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
