import 'package:ecomapp/app/app_colors.dart';
import 'package:flutter/material.dart';

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({super.key});

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black45),
            children: [
              TextSpan(text: 'Resend otp after '),
              TextSpan(
                text: '120s',
                style: TextStyle(color: AppColors.themeColor),
              ),
            ],
          ),
        ),

        TextButton(onPressed: _onTapResendButton, child: Text('Resend')),
      ],
    );
  }

  void _onTapResendButton() {}
}
