import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);

      //show error message
      ShowErrorMessage(e.code);
    }
  }

  // show error message pop
  void ShowErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 50),
          const Image(
            image: AssetImage("assets/images/Union.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Selamat Datang!',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Masuk Akun Anda',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          MyTextField(
              controller: emailController,
              hintText: 'Masukan Email Anda',
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            controller: passwordController,
            hintText: 'Masukan Password Anda',
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Lupa Password ?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          MyButton(
            text: 'Masuk',
            onTap: signUserIn,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Atau masuk menggunakan',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // google button

              SquareTile(
                  onTap: () => AuthService().signInWithGoogle(),
                  imagePath: 'assets/images/icon_google.png'),
              SizedBox(width: 10),
              // facebook button

              SquareTile(
                  onTap: () {}, imagePath: 'assets/images/icon_facebook.png')
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun ?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ]),
      ))),
    );
  }
}
