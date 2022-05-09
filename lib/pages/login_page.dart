import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool _buttonClicked = false;
  final _keyForm = GlobalKey<FormState>();

  _moveToHome(BuildContext context) async {
    if (_keyForm.currentState?.validate() ?? false) {
      setState(() {
        _buttonClicked = !_buttonClicked;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        _buttonClicked = !_buttonClicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Welcome $_name",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter user name", labelText: "Username"),
                      onChanged: (value) {
                        _name = value.trim();
                        setState(() {});
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Password can't be empty";
                        } else if (value != null && value.length < 6) {
                          return "Minimum length should be 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Theme.of(context).buttonColor,
                      borderRadius:
                          BorderRadius.circular(_buttonClicked ? 50 : 8),
                      child: InkWell(
                          splashColor: Colors.white,
                          onTap: () => {_moveToHome(context)},
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: _buttonClicked ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: _buttonClicked
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple,
                            //   // shape: _buttonClicked
                            //   //     ? BoxShape.circle
                            //   //     : BoxShape.rectangle
                            // borderRadius:
                            // BorderRadius.circular(_buttonClicked ? 50 : 8),
                            // )),
                          )),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
