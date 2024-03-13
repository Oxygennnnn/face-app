import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CameraPreviewPage extends StatefulWidget {
  final CameraDescription camera;

  CameraPreviewPage({required this.camera});

  @override
  _CameraPreviewPageState createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  late CameraController _controller; // 创建 CameraController 对象来控制摄像头
  late Future<void> _initializeControllerFuture; // 定义 Future 以初始化摄像头控制器

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera, // 使用传入的相机描述初始化控制器
      ResolutionPreset.medium, // 设置摄像头的分辨率
    );
    _initializeControllerFuture = _controller.initialize(); // 初始化摄像头控制器的 Future
  }

  @override
  void dispose() {
    _controller.dispose(); // 在页面销毁时释放摄像头资源
    super.dispose();
  }

  // 拍照方法，当点击拍照按钮时调用
  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture; // 等待摄像头控制器初始化完成
      final image = await _controller.takePicture(); // 拍照并获取图片文件
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: image.path), // 跳转显示拍摄的照片
        ),
      );
    } catch (e) {
      print("Error taking picture: $e"); // 如果拍照出错，打印错误信息
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Preview')), // 显示摄像头预览页面的标题
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller); // 当摄像头控制器初始化完成时，显示摄像头预览
          } else {
            return Center(child: CircularProgressIndicator()); // 否则显示加载圈
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture, // 点击按钮触发拍照方法
        child: Icon(Icons.camera), // 设置按钮图标为相机图标
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Picture')), // 显示照片页面的标题
      body: Center(
        child: Image.file(File(imagePath)), // 在页面中心显示拍摄的照片
      ),
    );
  }
}
