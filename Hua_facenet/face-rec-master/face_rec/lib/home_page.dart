import 'package:flutter/material.dart';
import 'facerec_page.dart'; // 导入人脸识别页面

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'GOOD MORNING\nHi Oxygen!\nFile List',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FileButton(label: 'file1'),
              FileButton(label: 'file2'),
              FileButton(label: 'file3'),
              FileButton(label: 'file4'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FileButton(label: 'file5'),
              FileButton(label: 'file6'),
              FileButton(label: 'file7'),
              MoreButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class FileButton extends StatelessWidget {
  final String label;

  FileButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FaceRecognitionPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[100],
        minimumSize: Size(100, 100),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FaceRecognitionPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[100],
        minimumSize: Size(100, 100),
      ),
      child: Text(
        'More',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
