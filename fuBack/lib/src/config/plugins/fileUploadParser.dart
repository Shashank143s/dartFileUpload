import 'dart:io' as IOParser;
import 'package:angel_framework/angel_framework.dart';

class FileUploadParser{
  //Metadata and data of the file to be uploaded.
  FileUploadInfo file;
  //Constructor
  FileUploadParser(this.file);
  //method
  fileUploadParser(){
        return new IOParser.File('uploads/'+ file.filename)
        ..writeAsBytes(file.data)
        .then((data) => data);
  }
}
