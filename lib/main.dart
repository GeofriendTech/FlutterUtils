import 'package:flutter/material.dart';
import 'package:flutterutils/camera_screen.dart';
import 'package:flutterutils/barcode_scanner.dart';
import 'package:flutterutils/read_sms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Utils Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(title: "Flutter Utils Demo"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _openCamera() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CameraScreen(),
    ));
  }

  void _readSMS() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SMSReader(),
    ));
  }

  void _fileUtils() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const QRViewExample(),
    ));
  }

  void _barcodeScanner() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const QRViewExample(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _openCamera,
                  child: Text('Open Camera'),
                ),
                ElevatedButton(
                  onPressed: _readSMS,
                  child: Text('Read SMS'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _fileUtils,
                  child: Text('File Utils'),
                ),
                ElevatedButton(
                  onPressed: _barcodeScanner,
                  child: Text('Barcode Scanner'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}