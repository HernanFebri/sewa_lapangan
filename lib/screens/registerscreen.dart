import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
// import 'package:flutter_application_1/components/square_tile.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message , password dont match
        ShowErrorMessage('Password tidak sama!');
      }

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
            'Daftar Sekarang',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
          MyTextField(
            controller: confirmpasswordController,
            hintText: 'Konfirmasi Password Anda',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          MyButton(
            text: 'Daftar',
            onTap: signUserUp,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' Already have an account?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
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
