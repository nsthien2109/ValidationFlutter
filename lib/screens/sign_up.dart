import 'package:ecommerce_app/contains/validation.dart';
import 'package:ecommerce_app/screens/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _PasswordStates = true;

  void CheckValiSuccess(){
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Register success')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 200,
                alignment: Alignment.bottomCenter,
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator:(value) => Validation.checkUsername(value!),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter full name",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator:(value) => Validation.checkPassword(value!),
                        obscureText: _PasswordStates,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _PasswordStates = !_PasswordStates;
                                });
                              },
                              child: _PasswordStates == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            )),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator:(value) => Validation.checkPassword(value!),
                        obscureText: _PasswordStates,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Confimp Password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _PasswordStates = !_PasswordStates;
                                });
                              },
                              child: _PasswordStates == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            )),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator:(value) => Validation.checkMail(value!),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
                          child: const Text("Register",style: TextStyle(
                              color: Colors.white
                          ),),
                          onPressed: CheckValiSuccess,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I have an Account",style: TextStyle(fontSize: 15),),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contex)=> SignIn()));
                          }, child: const Text("Login"))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


