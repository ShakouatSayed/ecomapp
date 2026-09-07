import 'package:ecomapp/app/app_colors.dart';
import 'package:ecomapp/app/extensions/utility_extension.dart';
import 'package:ecomapp/app/validators.dart';
import 'package:ecomapp/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecomapp/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
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
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 24),
                  Text('Sign Up', style: context.textTheme.titleLarge),
                  Text(
                    'Create an account with details',
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
                    controller: _firstNameTEController,
                    textInputAction: .next,
                    validator: (input) => Validators.validateText(
                      input,
                      message: "Enter your first name",
                    ),
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: .next,
                    validator: (input) => Validators.validateText(
                      input,
                      message: "Enter your last name",
                    ),
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileTEController,
                    textInputAction: .next,
                    validator: (input) => Validators.validatePhoneNumber(input),
                    decoration: InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cityTEController,
                    textInputAction: .next,
                    validator: (input) => Validators.validateText(
                      input,
                      message: "Enter your city ",
                    ),
                    decoration: InputDecoration(hintText: 'City'),
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
                    onPressed: _onTapSingUpButton,
                    child: Text('Sign UP'),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        context.localization.alreadyHaveAnAccount,
                        //'Already have an account?',
                        style: context.textTheme.labelLarge,
                      ),
                      TextButton(
                        onPressed: _onTapSignInButton,
                        child: Text(
                          context.localization.signIn,
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

  void _onTapSignInButton() {}

  void _onTapSingUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
