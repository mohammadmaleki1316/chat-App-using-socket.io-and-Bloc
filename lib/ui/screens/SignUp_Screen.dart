import 'package:chatwithsocketio/bloc/login_signup/login_cubit.dart';
import 'package:chatwithsocketio/ui/screens/home_screen.dart';
import 'package:chatwithsocketio/ui/widgets/customtextfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'LogIn_Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signupUserNameController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();


  TextEditingController signupPasswordController = TextEditingController();

  bool checked = false;

  @override
  Widget build(BuildContext context) {
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
                        'Create an Account                             ',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Name                                                                                                 ',
                        style: TextStyle(fontSize: 12),
                      ),
                      CustomTextField(
                        controller: signupNameController,
                        onchange: (value) {
                          if (signupUserNameController.text.isNotEmpty &&
                              signupPasswordController.text.isNotEmpty
                              && signupUserNameController.text.isNotEmpty&&
                            signupPhoneController.text.isNotEmpty
                          ) {
                            BlocProvider.of<LoginCubit>(context).trr();
                          } else {
                            BlocProvider.of<LoginCubit>(context).fll();
                          }
                        },
                        color: Colors.grey.withOpacity(0.1),
                        hint: 'name',
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'User Name                                                                                        ',
                        style: TextStyle(fontSize: 12),
                      ),
                      CustomTextField(
                        controller: signupUserNameController,
                        onchange: (value) {
                          if (signupUserNameController.text.isNotEmpty &&
                              signupPasswordController.text.isNotEmpty
                              && signupUserNameController.text.isNotEmpty&&
                              signupPhoneController.text.isNotEmpty
                          ) {
                            BlocProvider.of<LoginCubit>(context).trr();
                          } else {
                            BlocProvider.of<LoginCubit>(context).fll();
                          }

                        },
                        color: Colors.grey.withOpacity(0.1),
                        hint: 'Username',
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Phone Number                                                                                   ',
                        style: TextStyle(fontSize: 12),
                      ),
                      CustomTextField(
                        controller: signupPhoneController,
                        onchange: (value) {
                          if (signupUserNameController.text.isNotEmpty &&
                              signupPasswordController.text.isNotEmpty
                              && signupUserNameController.text.isNotEmpty&&
                              signupPhoneController.text.isNotEmpty
                          ) {
                            BlocProvider.of<LoginCubit>(context).trr();
                          } else {
                            BlocProvider.of<LoginCubit>(context).fll();
                          }

                        },
                        color: Colors.grey.withOpacity(0.1),
                        hint: '09xxxxxxxx',
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password                                                                                             ',
                        style: TextStyle(fontSize: 12),
                      ),
                      CustomTextField(
                        controller: signupPasswordController,
                        onchange: (value) {
                          if (signupUserNameController.text.isNotEmpty &&
                              signupPasswordController.text.isNotEmpty
                              && signupUserNameController.text.isNotEmpty&&
                              signupPhoneController.text.isNotEmpty
                          ) {
                            BlocProvider.of<LoginCubit>(context).trr();
                          } else {
                            BlocProvider.of<LoginCubit>(context).fll();
                          }

                        },
                        color: Colors.grey.withOpacity(0.1),
                        hint: '*****',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: checked,
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                                onChanged: (bool? value) {
                                  checked = !checked;
                                },
                              )),
                          const SizedBox(width: 2),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: "I agree with ",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'alata',
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms and conditions',
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontFamily: 'alata',
                                  fontSize: 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Material(
                        color: state? Colors.purple:Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: InkWell(
                            onTap: () {
                              state? Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),)):{};
                            },
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              width: 350,
                              height: 50,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Already have an account?  ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'alata',
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontFamily: 'alata',
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginScreen(),));
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
)),
      ),
    );
  }
}
