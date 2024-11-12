import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autosistebolivia/pages/create_account/create.page.dart';
import 'package:autosistebolivia/pages/home/home.page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  String _errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _errorMessage = '';
    });
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('Usuario inició sesión: ${userCredential.user}');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'No se encontró un usuario con ese correo.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Contraseña incorrecta.';
        });
      } else {
        setState(() {
          _errorMessage = 'Ocurrio un error, Credenciales Invalidas';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF04294F), // Background dark blue color
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo section
                    Container(
                      height: 100, // Adjust as per the logo size
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                          'lib/assets/logo.jpeg'), // Placeholder for your logo
                    ),
                    SizedBox(height: 10),

                    Text(
                      'BIENVENIDO',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White color for the title text
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Bienvenido Te extrañabamos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70, // Lighter white for subtitle
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40), // Adjust spacing

                    // Username Field
                    TextLeyend(text: 'Su Email'),
                    SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white), // White text color
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Colors.white), // Icon color
                        labelText: 'Usuario',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(
                                179, 99, 92, 92)), // Light white label
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // White focus border
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors
                                .white54, // Light white border when not focused
                            width: 1.5,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password Field
                    TextLeyend(text: 'Contraseña'),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.white), // Icon color
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white54,
                            width: 1.5,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color:
                                  Colors.white70), // Text color for forgot link
                        ),
                      ),
                    ),

                    // Error Message
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    SizedBox(height: 20),

                    // Sign In Button
                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded button
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Sign In Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded button
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Or continue with
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 30),

                    // Social Login Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 40, 118, 196)
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            child: IconButton(
                              icon: Image.asset(
                                'lib/assets/google.png',
                                height: 60,
                                width: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 40, 118, 196)
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            child: IconButton(
                              icon: Image.asset(
                                'lib/assets/apple.png',
                                height: 60,
                                width: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 40, 118, 196)
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            child: IconButton(
                              icon: Image.asset(
                                'lib/assets/facebook.png',
                                height: 60,
                                width: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextLeyend extends StatelessWidget {
  final String text;
  const TextLeyend({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white, // White color for text label
      ),
      textAlign: TextAlign.start,
    );
  }
}
