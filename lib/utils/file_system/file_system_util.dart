import 'dart:io';

class FileSystemUtil {
  Future<File> writeToFile(String content, String path) =>
      File(path).writeAsString(content);
}
