import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'facebbok_login_page.dart';
import 'google_login_page.dart';
import 'login_page.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

/// Entrypoint example for registering via Email/Password.


class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registration';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success;
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // _register();
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (BuildContext context) {
                                  return const LoginPage();
                                }));
                          },
                          child: const Text("Register"),
                        )),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        _success == null
                            ? ''
                            : (_success!
                            ? 'Successfully registered $_userEmail'
                            : 'Registration failed'),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // _register();
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (BuildContext context) {
                                  return  GoogleLogInPage();
                                }));
                          },
                          child: const Text("Google Log in"),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // _register();
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (BuildContext context) {
                                  return  FaceBookPage();
                                }));
                          },
                          child: const Text("Facebook Log in"),
                        )),

                  ],
                ),
              ),
            ),
        ],
      ),

    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  Future<void> _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email ?? '';
      });
    } else {
      _success = false;
    }
  }

}
