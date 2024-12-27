import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const String name = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AuthField(
                    hintText: 'Name',
                    controller: nameTEController,
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    hintText: 'Email',
                    controller: emailTEController,
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordTEController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 32),
                  const AuthGradientButton(
                    bottonText: 'Sign Up',
                    routeName: SigninPage.name,
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: const TextStyle(
                              color: AppPallete.gradient2,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SigninPage(),
                                    ),
                                  ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    super.dispose();
  }
}
