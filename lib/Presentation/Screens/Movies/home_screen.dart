import 'package:cinema_app/Config/Constant/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema App'),
      ),
      body: Center(
        child: Text( Environment.THE_MOVIEDB_KEY),
      ),
    );
  }
}
