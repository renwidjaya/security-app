import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_app/providers/login_provider.dart';
import 'package:security_app/ui/screen/bottom_navigation_screen.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/utils/state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Security Smart",
                style: TextStyleConstants.kHeading1.copyWith(
                  color: AppColors.softBlue,
                ),
              ),
              Image.asset(
                "assets/img_security.png",
                width: 300,
              ),
              Text(
                "Login",
                style: TextStyleConstants.kHeading1,
              ),

              //username
              // Container(
              //   margin: const EdgeInsets.all(16.0),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(18.0),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         filled: true,
              //         fillColor: AppColors.softGrey,
              //         border: InputBorder.none,
              //         labelText: 'Username',
              //         labelStyle: TextStyleConstants.kBody3,
              //       ),
              //     ),
              //   ),
              // ),
              //endusername

              Container(
                margin: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.softGrey,
                      border: InputBorder.none,
                      labelText: 'Password',
                      labelStyle: TextStyleConstants.kBody3,
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
              ),

              //button login
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return Container(
                    margin: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (passwordController.text != '') {
                          await provider.login(
                            password: passwordController.text,
                          );
                          if (provider.state == ViewState.hasData) {
                            print(provider.state);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BottomNaviationScreen(),
                              ),
                            );
                          } else if (provider.state == ViewState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              showSnackBarMessage(
                                provider.message,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showSnackBarMessage(
                              'Password Tidak Boleh Kosong',
                            ),
                          );
                        }
                      },
                      child: provider.state == ViewState.loading
                          ? Text(
                              "Login",
                              style: TextStyleConstants.kHeading6.copyWith(
                                color: AppColors.white,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                    ),
                  );
                },
              )
              //end button login
            ],
          ),
        ),
      ),
    );
  }

  SnackBar showSnackBarMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    return snackBar;
  }
}
