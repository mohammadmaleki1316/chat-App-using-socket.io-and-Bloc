import 'package:chatwithsocketio/bloc/login_signup/login_cubit.dart';
import 'package:chatwithsocketio/ui/screens/SignUp_Screen.dart';
import 'package:chatwithsocketio/ui/screens/home_screen.dart';
import 'package:chatwithsocketio/ui/widgets/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginUserNameController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool activate = false;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<LoginCubit, bool>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        const Text(
                          'Login                             ',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Username                                                                                            ',
                          style: TextStyle(fontSize: 12),
                        ),
                        CustomTextField(
                          controller: loginUserNameController,
                          onchange: (value) {
                            if (loginUserNameController.text.isNotEmpty &&
                                loginPasswordController.text.isNotEmpty) {
                              BlocProvider.of<LoginCubit>(context).trr();
                            } else {
                              BlocProvider.of<LoginCubit>(context).fll();
                            }
                          },
                          color: Colors.grey.withOpacity(0.1),
                          hint: 'Mhp.maleki@gmail.com',
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Password                                                                                             ',
                          style: TextStyle(fontSize: 12),
                        ),
                        CustomTextField(
                          controller: loginPasswordController,
                          onchange: (value) {
                            if (loginUserNameController.text.isNotEmpty &&
                                loginPasswordController.text.isNotEmpty) {
                              BlocProvider.of<LoginCubit>(context).trr();
                            } else {
                              BlocProvider.of<LoginCubit>(context).fll();
                            }
                          },
                          color: Colors.grey.withOpacity(0.1),
                          hint: '*****',
                          obsecuretext: true,
                        ),
                        const SizedBox(height: 60),
                        Material(
                          color: state ? Colors.purple : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: InkWell(
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ));
                              },
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: 350,
                                height: 50,
                                child: const Text(
                                  'Login',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        const SizedBox(height: 40),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'alata',
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontFamily: 'alata',
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ));
                                },
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
