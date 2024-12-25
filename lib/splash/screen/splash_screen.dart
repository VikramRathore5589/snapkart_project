import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/dash_board_screen/dashboard_screen.dart';
import 'package:snapkart_project/splash/provider/splash_provider.dart';
import 'package:snapkart_project/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    takeDesicion();
  }

  Future takeDesicion() async {
    SplashProvider splashProvider =
    Provider.of<SplashProvider>(context, listen: false);
    bool isLoggedIn = await splashProvider.checkLoggedIn();
    if (isLoggedIn) {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  DashboardScreen(),
            ));
      }
    } else {
      if(mounted){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ));
      }}
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text('SnapKart Screen'),
      ),
    );
  }
}
