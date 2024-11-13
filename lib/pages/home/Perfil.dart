import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el usuario autenticado
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              // Navegar a la pantalla de login
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/user.jpg'), // Imagen de perfil
            ),
            SizedBox(height: 10),
            // Mostrar el nombre o el correo del usuario autenticado
            Text(
              user?.displayName ?? user?.email ?? 'Usuario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Senior Designer', // Puedes reemplazar este texto si tienes otro rol específico
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.person, 'Información Personal'),
                  _buildListTile(Icons.payment, 'Preferencias de Pago'),
                  _buildListTile(Icons.credit_card, 'Bancos y Tarjetas'),
                  _buildListTile(Icons.notifications, 'Notificaciones',
                      hasNotification: true),
                  _buildListTile(Icons.message, 'Centro de Mensajes'),
                  _buildListTile(Icons.location_on, 'Dirección'),
                  _buildListTile(Icons.settings, 'Configuración'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title,
      {bool hasNotification = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: hasNotification
          ? Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        // Aquí puedes manejar la acción de cada opción
      },
    );
  }
}
