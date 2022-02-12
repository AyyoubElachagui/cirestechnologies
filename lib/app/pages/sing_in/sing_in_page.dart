import 'dart:async';

import 'package:cirestechnologies/app/pages/sing_in/sing_in_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  final SingInPageViewModel viewModel;

  SingInPage({required this.viewModel});

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    widget.viewModel.navigateToOnbroadingScreenPage();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sing In",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(fontSize: 16, color: AppColors.gray),
                        ),
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          hintText: 'Password',
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 16, color: AppColors.gray),
                        ),
                        obscureText: true,
                        controller: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 2) {
                            return 'The password is shorter than 8 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: rememberMe,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onChanged: (newValue) {
                                    setState(() {
                                      rememberMe = newValue!;
                                    });
                                  }),
                              Container(
                                child: Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Forget password ?",
                            style: TextStyle(
                              color: AppColors.primary,

                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_state == 0) {
                                animateButton();
                              }
                            }
                          },
                          child: _state == 0
                              ? Text('LOGIN')
                              : Container(
                                  width: 100,
                                  height: 30,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 5),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Container(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have one ? ",
                                  style: TextStyle(
                                      color: AppColors.gray),
                                ),
                                TextSpan(
                                  text: " Sing up",
                                  style: TextStyle(
                                      color: AppColors.primary),
                                ),

                              ]
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 0;
      });
    });
  }
}
