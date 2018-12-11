import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


List _toDoList = [];

Future<File> _getFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File("${directory.path}/data.json");
}

Future<File> _saveData() async {
  String data = json.encode(_toDoList);
  final file = await _getFile();
  return file.writeAsString(data);
}

Future<String> _readData() async {
  try {
    final file = await _getFile();
    return file.readAsString();
  } catch (erro) {
    return null;
  }
}
