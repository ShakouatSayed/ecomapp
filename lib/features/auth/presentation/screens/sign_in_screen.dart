import 'package:ecomapp/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/utility_extension.dart';
import '../../../../app/validators.dart';
import '../widgets/app_logo.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: .onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 24),
                  Text('Welcome Back', style: context.textTheme.titleLarge),
                  Text(
                    'Plase enter your details to continue',
                    style: context.textTheme.labelLarge,
                  ),

                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: .next,
                    keyboardType: .emailAddress,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: Validators.validateEmail,
                  ),

                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: .next,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: Validators.validatePassword,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),

                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSingInButton,
                    child: Text('Sign In'),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: context.textTheme.labelLarge,
                      ),
                      TextButton(
                        onPressed: _onTapSignUpButton,
                        child: Text(
                          'Sign Up',
                          //'Sign In',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingInButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainNavHolderScreen.name,
      (_) => false,
    );
  }

  void _onTapSignUpButton() {
    Navigator.pop(context);
  }
}
