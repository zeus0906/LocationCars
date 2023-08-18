import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locationcars/services/authentification.dart';
import 'package:locationcars/widget/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationcars/widget/profile/profile.dart';
import 'package:locationcars/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
        providers: [
      StreamProvider.value(
        initialData: null,
        value: AuthService().user,
      )
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Cars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.amber,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

