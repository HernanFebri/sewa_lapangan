import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/square_tile.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(){}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(height: 100,),
              const Image(image: AssetImage("assets/images/Union.png"),
              ),
              const SizedBox(height: 20,),
              const Text('Selamat Datang!',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold ),
              ),
              const SizedBox(height: 10,),
              const Text('Masuk Akun Anda',style: TextStyle(color: Colors.black38,fontSize: 17,fontWeight: FontWeight.bold ),
              ),const SizedBox(height: 20),
              MyTextField(controller: usernameController,hintText: 'Masukan Email Anda',obscureText: false),
              const SizedBox(height: 10,),
              MyTextField(controller: passwordController,hintText: 'Masukan Password Anda',obscureText: true,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Lupa Password ?',style: TextStyle(color: Colors.grey[600]),),
                  ],
                ),
              ),const SizedBox(height: 25),
              MyButton(
                onTap: signUserIn,
              ),const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5,
                      color: Colors.grey[400],),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Atau masuk menggunakan',style: TextStyle(color: Colors.grey[700]),),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5,
                      color: Colors.grey[400],),
                    ),
                  ],
                ),
              ),const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/images/icon_google.png'),
                  SizedBox(width: 10),
                  SquareTile(imagePath: 'assets/images/icon_facebook.png')
              ],
            ),
          const SizedBox(height: 20),
           Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Belum punya akun ?', style: TextStyle(color: Colors.grey[700]),),
            const SizedBox(width: 5,),
            const Text('Daftar', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          ],
        ),
      ]
    )
  )),
);}}