import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn();

class GoogleSignInScreen extends StatefulWidget {
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Realiza operaciones adicionales después del inicio de sesión con Google
      }
    } catch (error) {
      print('Error al iniciar sesión con Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleSignIn,
      child: Text('Iniciar sesión con Google'),
    );
  }
}
