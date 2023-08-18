import 'package:flutter/material.dart';
import 'package:locationcars/services/authentification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool inLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Location1.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Text(
                'Location Cars',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
              ),
               Padding(
                  padding: const EdgeInsets.all(12.0),
                child : Text(
                  'Venez découvrir les meilleurs voitures de luxes 2023',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              inLoginProcess
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                  onPressed: () => signIn(),
                  child: Text("Connectez-vous avec Google")
              )
            ],
          ),
        ),
      ),
    );
  }
  signIn(){
    setState(() {
      inLoginProcess = true;
      AuthService().connectionGoogle();
    });
  }
}
