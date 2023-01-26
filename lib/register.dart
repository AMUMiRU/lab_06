import 'package:flutter/material.dart';
import 'package:lab06/servive/auth_servive.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Register"),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Text("email"),
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
                  AuthService.registerUser(_emailController.text, _passwordController.text)
                  .then((value){
                    if (value == 1 ) {
                      Navigator.pop(context);
                    }    
                  });
                }
              },
              child: const Text("Register")),
            ],
          ),
          ) 
          ),
    );
  }
}