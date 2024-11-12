import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autosistebolivia/pages/home/home.page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  String _errorMessage = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() {
      _errorMessage = '';
    });

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('Usuario registrado: ${userCredential.user}');

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'El correo ya está en uso.';
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          _errorMessage = 'La contraseña es demasiado débil.';
        });
      } else {
        setState(() {
          _errorMessage = 'Ocurrió un error, por favor inténtalo de nuevo.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF04294F), // Dark blue background color
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo section
                  Container(
                    height: 100, // Adjust as per logo size
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                        'lib/assets/logo.jpeg'), // Replace with your logo asset
                  ),
                  SizedBox(height: 10),

                  // Title
                  Text(
                    'REGISTRATE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), // Spacing before fields

                  // Email Field
                  TextLeyend(text: 'Dirección electronica'),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white70),
                      hintText: 'yourname@gmail.com',
                      hintStyle: TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Color(0xFF08376B),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Username Field
                  TextLeyend(text: 'Tu Usuario'),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white70),
                      hintText: '@tunombre',
                      hintStyle: TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Color(0xFF08376B),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
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
                      prefixIcon: Icon(Icons.lock, color: Colors.white70),
                      hintText: '******',
                      hintStyle: TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Color(0xFF08376B),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
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
                  SizedBox(height: 20),

                  // Register Button
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3366FF), // Light blue button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Registro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Or Sign up with
                  Text(
                    'O Inicia Sesion con',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),

                  // Social Icons
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
        color: Colors.white70, // Light white color for field labels
      ),
      textAlign: TextAlign.start,
    );
  }
}
