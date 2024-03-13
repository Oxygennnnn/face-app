import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_preview_page.dart'; // 导入相机预览页面
import 'home_page.dart'; // 导入主页

class FaceRecognitionPage extends StatelessWidget {
  Future<void> _onGetStartedPressed(BuildContext context) async {
    // 获取可用的摄像头列表
    final cameras = await availableCameras();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPreviewPage(camera: cameras.first),
      ),
    );

    if (result == 'success') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Face Recognition Success'),
            content: Text('You have been successfully recognized.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else if (result == 'failure') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Face Recognition Failed'),
            content: Text('Sorry, we could not recognize your face.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Recognition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please look into the camera and hold',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF6A1B9A), // 深紫色
                    Color(0xFF9C27B0), // 紫色
                    Color(0xFFCE93D8), // 浅紫色
                    Color(0xFFF3E5F5), // 极浅紫色
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _onGetStartedPressed(context),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF9C27B0), // 按钮背景颜色为紫色
                minimumSize: Size(200, 50), // 设置按钮宽度和高度
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white, // 按钮文字颜色为白色
                  fontSize: 18, // 设置文字大小
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
