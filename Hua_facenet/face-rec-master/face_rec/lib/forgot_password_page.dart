import 'package:flutter/material.dart';
import 'phone_verification_page.dart'; // 导入手机验证界面
import 'email_verification_page.dart'; // 导入邮箱验证界面

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please select option to send link reset password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            OptionButton(
              label: 'Send to your email',
              description: 'Password reset link has been sent to your email address.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmailVerificationPage()), // 导航到邮箱验证界面
               );
              },
            ),
            SizedBox(height: 10.0),
            OptionButton(
              label: 'Send to your phone number',
              description: 'Password reset link has been sent to your phone number.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneVerificationPage()), // 导航到手机验证界面
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String label;
  final String description;
  final VoidCallback? onPressed;

  OptionButton({required this.label, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[100],
        minimumSize: Size(double.infinity, 70), // 大长方形
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
