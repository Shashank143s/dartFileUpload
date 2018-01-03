import 'dart:async';
import 'dart:html';
import 'package:json_object/json_object.dart';
import 'package:angular/angular.dart';
//import 'package:http/http.dart';


@Injectable()
class FileUploadService{
  var response;
 //HttpRequest _http;
//  FileUploadService(this._http);
  //dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];
  Future getfiles() async {
      response = await HttpRequest.getString('http://localhost:3000/fetch');
      //final files = _extractData(response);
          // .map((value) => new files.fromJson(value))
          // .toList();
          JsonObject data = new JsonObject.fromJsonString(response);
          print('printing in service');
          print(data.runtimeType);
      return data;
  }

  Future searchFiles(sid) async{
    response = await HttpRequest.getString('http://localhost:3000/search/'+sid);
    JsonObject data = new JsonObject.fromJsonString(response);
    print('printing in searchFile service');
    print('pritning respone in searchFile service...');
    print(response);
    return data;
  }

  Future deleteFiles(String fid) async{
      response = await HttpRequest.getString('http://localhost:3000/delete/'+fid);
      JsonObject data = new JsonObject.fromJsonString(response);
      print(data.ok.runtimeType);
      return data.ok;
  }


}
