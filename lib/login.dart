import 'package:flutter/material.dart';
import 'package:lab06/register.dart';
import 'package:lab06/servive/auth_servive.dart';
import 'package:lab06/success.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  //final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Login"),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your password";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed:(){
                if (_formkey.currentState!.validate()) {
                  print("ok");
                  AuthService.loginUser(_emailController.text, _passwordController.text)
                  .then((value){
                    if (value == 1 ) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SuccessPage(),
                      ));
                    }
                  });
                }
              },
              child: const Text("Login")),
              ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ));
              },
              child: const Text("Register")),
            ],
          ),
          ) 
          ),
    );
  }
}