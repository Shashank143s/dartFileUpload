import 'dart:io' as IOParser;
import 'package:angel_framework/angel_framework.dart';

class FileUploadParser{
  //Metadata and data of the file to be uploaded.
  FileUploadInfo file;
  //Constructor
  FileUploadParser(this.file);
  //method
  double fLength;
  String fName;
  String dlink;
  fileUploadParser() async{
        IOParser.File f = new IOParser.File('web/uploads/'+ file.filename);
        await f.writeAsBytes(file.data)
        .then((data){
          fLength = data.lengthSync()/1000;
          fName = data.toString().split('/')[data.toString().split('/').length-1].split('\'')[0];
          dlink = 'http://localhost:3000/uploads/' + fName;
        });
        print(fLength);
        print(fName);
        return [fLength,fName,dlink];
  }
}
