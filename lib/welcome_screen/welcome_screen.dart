import 'package:flutter/material.dart';
import 'package:snapkart_project/auth/screen/log_in_screen.dart';
import 'package:snapkart_project/auth/screen/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/welcome_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        text: 'Welcome Back\n',
                        children: const [
                          TextSpan(
                              text: 'Enter Personal details to your own account',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,

                                  color: Colors.white))
                        ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containerButton(
                      context, () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),));
                  },
                      const Color(0xFF7EA8E1),
                      'SIGN IN',
                      Colors.white,
                      Radius.circular(0),
                      Radius.circular(0),
                      Radius.circular(80),
                      Radius.circular(80)),
                  containerButton(
                      context,
                          () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignUpScreen(),));
                      },
                      const Color(0xFF4A90E2),
                      'SIGN UP',
                      Colors.white,
                      Radius.circular(80),
                      Radius.circular(80),
                      Radius.circular(0),
                      Radius.circular(0))
                ],
              ),
            )
          ],
        ));
  }

  Widget containerButton(BuildContext context,
      VoidCallback callback,
      Color color,
      String text,
      Color textColor,
      Radius bottomRight,
      Radius topLeft,
      Radius topRight,
      Radius bottomLeft) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: 60,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomRight: bottomRight,
              topLeft: topLeft,
              topRight: topRight,
              bottomLeft: bottomLeft),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
