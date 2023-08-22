import 'package:credit_card_project/screens/login/register_screen.dart';
import 'package:credit_card_project/theme/theme.dart';
import 'package:credit_card_project/widgets/input_field.dart';
import 'package:credit_card_project/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login to your\naccount',
                  style: heading2.copyWith(color: textBlack),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/accent.png',
                  width: 99,
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Form(
              child: Column(
                children: [
                  InputField(
                    hintText: 'Email',
                    suffixIcon: const SizedBox(),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InputField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    suffixIcon: IconButton(
                      color: textGrey,
                      splashRadius: 1,
                      icon: Icon(passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: togglePassword,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              height: 32,
            ),
            // BlocConsumer<AuthCubit, AuthState>(
            //   listener: (context, state) {
            //     if (state is AuthSuccess) {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => HomeScreen(),
            //           ),
            //           (route) => false);
            //     } else if (state is AuthFailed) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           backgroundColor: Colors.red.shade700,
            //           content: Text(
            //             state.error,
            //           ),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            // if (state is AuthLoading) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            // return
            CustomPrimaryButton(
                buttonColor: primaryBlue,
                textValue: 'Login',
                textColor: Colors.white,
                onPressed: () {
                  // context.read<AuthCubit>().signIn(
                  //       email: emailController.text,
                  //       password: passwordController.text,
                  //     );
                  // },
                  //     );
                  //   },
                  // ),
                }),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                'OR',
                style: heading6.copyWith(color: textGrey),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomPrimaryButton(
              buttonColor: const Color(0xfffbfbfb),
              textValue: 'Login with Google',
              textColor: textBlack,
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: regular16pt.copyWith(color: textGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: Text(
                    'Register',
                    style: regular16pt.copyWith(color: primaryBlue),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
