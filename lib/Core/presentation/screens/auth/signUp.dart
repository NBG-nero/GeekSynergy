import 'package:flutter/material.dart';
import 'package:geek/Core/data/dataProviders/providers/authProvider.dart';
import 'package:geek/Core/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:geek/Core/logic/utils/auth_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl  = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController professionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Form(
                autovalidate: authProvider.autoValidate,
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                     SizedBox(height: 15.0,),
                      Text('SignUp' , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      SizedBox(height: 105),
                      MyTextField(
                        labelText: 'Name',
                        obscureText: false,
                        validator: (val) => AuthValidator().validateName(val),
                        controller: nameCtrl,
                        hintText: 'Frances',
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Email',
                        obscureText: false,
                        validator: (val) => AuthValidator().validateEmail(val),
                        controller: emailCtrl,
                        hintText: 'email@email.com',
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Password',
                        obscureText: true,
                        hintText: '*******',
                        validator: (val) =>
                            AuthValidator().validatePassword(val),
                        controller: passwordCtrl,
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Phone Number',
                        obscureText: false,
                        hintText: '+41 99 456 81',
                        validator: (val) =>
                            AuthValidator().validatemobileNumber(val),
                        controller: phoneCtrl,
                      ),
                      SizedBox(height: 15),
                      CustomDropdown(
                        label: 'Professions',
                        child: new DropdownButton<String>(
                          isExpanded: true,
                          value: authProvider.selectedCategory,
                          hint: Text('Select Category'),
                          iconSize: 10,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          // itemHeight: 300,
                          elevation: 0,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.grey,
                          items: [
                            'Engineer',
                            'Teacher',
                            "Software Developer",
                            "Accountant",
                            'Lawyer',
                            "Scientist",
                            "Architect",
                            "Physician"
                          ].map((value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(
                                value ?? '',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            authProvider.setCategory(newValue);
                          },
                        ),
                      ),
                      SizedBox(height:15),
                       MaterialButton(
                          elevation: 20,
                          color: Colors.blue[300],
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              authProvider.signUp(
                                  nameCtrl.text, emailCtrl.text, passwordCtrl.text, phoneCtrl.text, context);
                            } else {
                              authProvider.setAutoValidate(true);
                              
                            }
                          }),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            child: RichText(
                                text: TextSpan(
                              text: 'Already have an Acccount?  Login',
                              style: TextStyle(color: Colors.grey),
                              
                            )),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/login')),
                      ),
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
