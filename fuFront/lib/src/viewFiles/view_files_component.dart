import 'package:angular/angular.dart';
import 'dart:html';
//import 'package:rxdart/rxdart.dart';
import 'dart:core';
import 'package:angular_forms/angular_forms.dart';
//import 'package:angular_components/angular_components.dart';
import 'dart:async';
import '../Services/fileupload_service.dart';
import '../pipes/camel_case_pipe.dart';

@Component(
  selector: 'app-view-files',
  styleUrls: const ['view_files_component.css'],
  templateUrl: 'view_files_component.html',
  directives : const [COMMON_DIRECTIVES, CORE_DIRECTIVES, formDirectives],
  pipes: const [COMMON_PIPES,CamelCasePipe],
  providers: const [ FileUploadService ]
)

class ViewFilesComponent implements OnInit{
  final FileUploadService _fuService;
  bool searchClicked = false;
  var files;
  var searchString;
  String deleteMsg;
  ViewFilesComponent(this._fuService);

  Future<Null> ngOnInit(){
    return getfilesMethod();
  }

  Future<Null> getfilesMethod() async{
      this.files = await _fuService.getfiles();
      print(files);
  }

  void showSearchBox(){
    this.searchClicked = !(this.searchClicked);
  }

  searchDynamic() async{
    print('IN component printing value of searchString');
    print(this.searchString);
    this.files = await this._fuService.searchFiles(this.searchString);
  }

  deleteMe(eid) async{
    if(window.confirm("Are you sure, you want to delete this file?")){
    int okValue = await _fuService.deleteFiles(eid);
    this.files = await _fuService.getfiles();
    if(okValue == 1){
      this.deleteMsg = "File deletion successful!!!";
    }
    else{
      this.deleteMsg = "File deletion unsuccessful!!!";
    }
    print(this.deleteMsg);
  }

}

}
