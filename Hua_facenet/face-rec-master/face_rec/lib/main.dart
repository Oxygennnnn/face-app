import 'package:flutter/material.dart';
import 'package:face_rec/login_page.dart'; 
import 'package:face_rec/signup_page.dart'; 
import 'package:face_rec/phone_verification_page.dart'; 
import 'package:face_rec/forgot_password_page.dart'; 
import 'package:face_rec/email_verification_page.dart'; 
import 'package:face_rec/facerec_page.dart'; 
import 'package:face_rec/home_page.dart'; 
import 'package:camera/camera.dart'; 
import 'package:face_rec/camera_preview_page.dart'; 
import 'package:dio/dio.dart'; // 导入 Dio 包

List<CameraDescription>? cameras; 

Dio dio = Dio(); // 创建 Dio 实例

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), 
        '/signup': (context) => SignUpPage(), 
        '/verification': (context) => PhoneVerificationPage(), 
        '/forgot_password': (context) => ForgotPasswordPage(), 
        '/email_verification': (context) => EmailVerificationPage(), 
        '/faceRecognition': (context) => FaceRecognitionPage(), 
        '/home': (context) => HomePage(), 
        '/camera_preview': (context) => CameraPreviewPage(camera: cameras!.first), 
      },
    );
  }
}
