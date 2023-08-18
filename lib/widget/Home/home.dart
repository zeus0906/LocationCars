import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addCarSection.dart';
import 'homeAppbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              HomeAppBar(user: _user),
              AddCarSection(user:_user)
            ],
          )
      ),
    );
  }
}
