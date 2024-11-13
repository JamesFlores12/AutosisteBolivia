import 'package:flutter/material.dart';
import 'package:autosistebolivia/pages/home/perfil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Función para actualizar la pantalla seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación a PerfilScreen al seleccionar el índice de perfil
    if (index == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PerfilScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Función de tamaño adaptable para texto
    double responsiveFont(double value) => value.clamp(16.0, 32.0);
    double responsiveHeight(double value) => value.clamp(150.0, 300.0);

    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Contenedor de fondo de bienvenida
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E1E2C), Color(0xFFFBC02D)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenido a',
                          style: TextStyle(
                            fontSize: responsiveFont(screenWidth * 0.07),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'AUTOSISTE BOLIVIA',
                          style: TextStyle(
                            fontSize: responsiveFont(screenWidth * 0.09),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFBC02D),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.35),
                  // Contenido del home
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Taller Central',
                              style: TextStyle(
                                fontSize: responsiveFont(screenWidth * 0.045),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.notifications_none, color: Colors.white),
                            SizedBox(width: screenWidth * 0.05),
                            Icon(Icons.shopping_cart_outlined,
                                color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar servicios, repuestos, mecánicos...',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.search, color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.03),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Continuar con el contenido de la página
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Container(
                      height: responsiveHeight(screenHeight * 0.25),
                      decoration: BoxDecoration(
                        color: Color(0xFF283593),
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Servicio Mecánico hasta 20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: responsiveFont(screenWidth * 0.05),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              'Aprovecha las ofertas en mantenimiento de tu vehículo.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: responsiveFont(screenWidth * 0.04),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.015,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
                                ),
                              ),
                              child: Text(
                                'Ver Servicios',
                                style: TextStyle(color: Color(0xFF283593)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFBC02D),
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF1E1E2C),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Servicios'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: 'Historial'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
