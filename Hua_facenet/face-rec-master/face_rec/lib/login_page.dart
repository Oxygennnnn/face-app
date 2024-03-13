import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:face_rec/facerec_page.dart';
import 'package:dio/dio.dart'; // 导入 Dio 包

class LoginPage extends StatelessWidget {
  final passwordController = TextEditingController();
  final accountController = TextEditingController();
  void loginpost(BuildContext context) async {
    String username = accountController.text;
    String password = passwordController.text;
    try {
      Dio dio = Dio();
      Response response =
          await dio.post("http://127.0.0.1:8000/apis/account/login/", data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {
        if (kDebugMode) {
          // print(response.data);
        }
        // ignore: use_build_context_synchronously
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => FaceRecognitionPage()));
      } else {
        if (kDebugMode) {
          // print(response.statusCode);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // print(e);
      }
      // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Please try again later. ')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Let Us Sign You In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome back, you have been missed!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                loginpost(context); // 调用loginpost方法来进行登录操作
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[100],
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[100],
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot_password');
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
