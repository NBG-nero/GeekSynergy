import 'package:flutter/material.dart';
import 'package:geek/Core/data/dataProviders/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:geek/Core/logic/utils/auth_validator.dart';
import 'package:geek/Core/presentation/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.blue[900],
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Form(
                autovalidate:
                    //  AutovalidateMode.onUserInteraction
                    authProvider.autoValidate,
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 250),

                      // SizedBox(height: 15),
                      MyTextField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: 'Name',
                        obscureText: false,
                        validator: (val) => AuthValidator().validateName(val),
                        controller: nameCtrl,
                        hintText: 'pedro',
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Password',
                        obscureText: true,
                        validator: (val) =>
                            AuthValidator().validatePassword(val),
                        controller: passwordCtrl,
                        hintText: '*******',
                      ),
                      SizedBox(height: 30),
                      // Material(
                      //   borderRadius: BorderRadius.circular(30.0),

                      //   child:
                      MaterialButton(
                        elevation: 20,
                        color: Colors.blue,
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        child: authProvider.loading
                            ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            authProvider.logIn(
                                nameCtrl.text, passwordCtrl.text, context);
                          } else {
                            authProvider.setAutoValidate(true);
                          }
                        },
                      ),

                      // ),

                      SizedBox(height: 30),

                      GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                            text: 'Forgot password?',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed('?'),
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account ? ",
                              style: TextStyle(color: Colors.cyan),
                              children: <TextSpan>[
                                TextSpan(text: 'Sign Up'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Center(child: Text('Login ')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
