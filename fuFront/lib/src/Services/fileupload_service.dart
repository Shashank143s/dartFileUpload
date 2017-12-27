import 'package:angular/angular.dart';
import 'package:http/http.dart';
//import 'dart:convert';

@Injectable()
class FileUploadService{
  final Client http;
  FileUploadService(this.http);
  getfiles() async{
     var response = await http.get('http://localhost:3000/fetch');
     print('printing in service $response');
  }
}
