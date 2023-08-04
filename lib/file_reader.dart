import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'storage_helper.dart'; // Assuming your class is defined in storage_helper.dart

class ReadAndWriteInFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storageHelper = StorageHelper();
  final String fileName = 'my_text_file.txt';
  final String imageDataFileName = 'image_data.bin';

  TextEditingController textEditingController = TextEditingController();
  String displayedText = '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Helper Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Show a dialog to write text to a file
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Write Text to File'),
                      content: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(labelText: 'Enter text'),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            await storageHelper.writeTextToFile(
                              fileName,
                              textEditingController.text,
                            );
                            print('Text written to file.');
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('Write'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Write Text to File'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Read text from the file
                String text = await storageHelper.readFromFile(fileName);
                setState(() {
                  displayedText = text;
                });
                print('Read from file: $text');
              },
              child: Text('Read Text from File'),
            ),
            SizedBox(height: 20),
            Text(
              displayedText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
