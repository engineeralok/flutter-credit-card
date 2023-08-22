import 'package:credit_card_project/theme/theme.dart';
import 'package:credit_card_project/widgets/input_field.dart';
import 'package:credit_card_project/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;
  bool isChecked = false;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register new\naccount',
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
                      hintText: 'Name',
                      controller: nameController,
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    InputField(
                      hintText: 'Email',
                      controller: emailController,
                      suffixIcon: const SizedBox(),
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
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isChecked ? primaryBlue : Colors.transparent,
                        borderRadius: BorderRadius.circular(4.0),
                        border: isChecked
                            ? null
                            : Border.all(color: textGrey, width: 1.5),
                      ),
                      width: 20,
                      height: 20,
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'By creating an account, you agree to our',
                        style: regular16pt.copyWith(color: textGrey),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: regular16pt.copyWith(color: primaryBlue),
                      ),
                    ],
                  ),
                ],
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
              //     if (state is AuthLoading) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return
              CustomPrimaryButton(
                buttonColor: primaryBlue,
                textValue: 'Register',
                textColor: Colors.white,
                onPressed: () {
                  // isChecked
                  //     ? context.read<AuthCubit>().signUp(
                  //           name: nameController.text,
                  //           email: emailController.text,
                  //           password: passwordController.text,
                  //         )
                  //     : ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Colors.red.shade700,
                  //           content: Text(
                  //             'Are you agree with our Tems & Conditions?',
                  //           ),
                  //         ),
                  //       );
                },
                //     );
                //   },
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      'Login',
                      style: regular16pt.copyWith(color: primaryBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
