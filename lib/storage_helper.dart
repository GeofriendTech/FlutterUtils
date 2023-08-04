
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class StorageHelper{
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile(String filename) async{
    final localPath = await _localPath;
    return File("$localPath/$filename");
  }

  Future<File> writeTextToFile(String filename, String text) async{
    final file = await _getLocalFile(filename);
    return file.writeAsString(text);
  }

  Future<String> readFromFile(String filename) async{
    final file = await _getLocalFile(filename);
    return file.readAsString();
  }

  Future<File> writeBytesToFile(String filename, Uint8List data) async{
    final file = await _getLocalFile(filename);
    return file.writeAsBytes(data);
  }
}