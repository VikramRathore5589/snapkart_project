import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/model/auth_model.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/dash_board_screen/dashboard_screen.dart';
import 'package:snapkart_project/auth/screen/sign_up_screen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future logInAccount() async {
      String email = emailController.text;
      String password = passwordController.text;
      if (formKey.currentState!.validate()) {
        AuthModel authModel = AuthModel(username: email, password: password);
        AuthProvider authProvider =
            Provider.of<AuthProvider>(context, listen: false);
        bool success = await authProvider.logIn(authModel);
        if (success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        } else {
          // Stay on the login screen and display the error
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.lime[100],
      // appBar: AppBar(
      //   title: const Text('Log In Screen'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/friendship.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                    child: Text(
                  'LOG IN',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field are required';
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'password must be required';
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lime[100],
                        foregroundColor: Colors.black),
                    onPressed: () {
                      logInAccount();
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' Do you have no Account'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text('SIGN UP'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
