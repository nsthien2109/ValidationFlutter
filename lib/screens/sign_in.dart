import 'package:ecommerce_app/contains/validation.dart';
import 'package:ecommerce_app/screens/sign_up.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override

  final _formKey = GlobalKey<FormState>();
  bool _PasswordStates = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text("Login",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                validator: (value) => Validation.checkUsername(value!),
                decoration: const InputDecoration(
                  hintText: "Enter username",
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                obscureText: _PasswordStates,
                validator: (value) => Validation.checkPassword(value!),
                decoration: InputDecoration(
                    hintText: "Enter password",
                    border: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _PasswordStates = !_PasswordStates;
                        });
                      },
                      child: _PasswordStates == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    )
                ),

              ),
              const SizedBox(height: 13,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: const Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login success')),
                      );
                    }
                  }
                ),
              ),
              const SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I dont have account',style: TextStyle(fontSize: 15),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contex)=> SignUp()));
                  }, child: const Text('Register',style: TextStyle(color: Colors.black),))
                ],
              ),
            ],
          ),

        ),

      )
    );
  }
}
