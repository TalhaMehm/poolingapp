import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poolingapp/UI/auth/loginScreen.dart';
import 'package:poolingapp/widgets/round_button.dart';
import 'package:flutter/material.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {



  
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: const Text("Sign Up", textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        hintText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundButton(
                  title: "Sign up",
                  ontap: () {
                    if (_formkey.currentState!.validate());
                    _auth.createUserWithEmailAndPassword(
                      email: emailcontroller.text.toString(),
                      password: passwordcontroller.text.toString());
                  }),
                  const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account "),
                  TextButton(onPressed: (){
                    // ignore: prefer_const_constructors
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, child: const Text('Login'))
                ],
              )
              
            ]),
      ),
    );
  }
}
