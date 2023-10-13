import 'package:cirestechnologies/app/pages/sing_in/sing_in_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  final SingInPageViewModel viewModel;

  const SingInPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
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
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Sing In",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: widget.viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          hintText: 'Username',
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(fontSize: 16, color: AppColors.gray),
                        ),
                        controller: widget.viewModel.username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        cursorColor: AppColors.primary,
                        controller: widget.viewModel.password,
                        obscureText: !widget.viewModel.passwordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          hintText: 'Password',
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              fontSize: 16, color: AppColors.gray),
                          suffixIcon: IconButton(
                            icon: Icon(
                              !widget.viewModel.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.primary,
                            ),
                            onPressed: () =>
                                widget.viewModel.showHidePassword(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: widget.viewModel.rememberMe,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onChanged: (newValue) {
                                  setState(() {
                                    widget.viewModel.rememberMe = newValue!;
                                  });
                                },
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Forget password ?",
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () => widget.viewModel.login(context),
                          child: const Text('LOGIN'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Center(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Don't have one ? ",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          TextSpan(
                            text: " Sing up",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ])),
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
}
