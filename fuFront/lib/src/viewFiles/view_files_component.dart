import 'package:angular/angular.dart';
//import 'package:angular_components/angular_components.dart';
import 'dart:async';
import '../Services/fileupload_service.dart';

@Component(
  selector: 'app-view-files',
  styleUrls: const ['view_files_component.css'],
  templateUrl: 'view_files_component.html',
  directives : const [COMMON_DIRECTIVES],
  providers: const [ FileUploadService ]
)

class ViewFilesComponent implements OnInit{
  final FileUploadService _fuService;
  var files;
  ViewFilesComponent(this._fuService);

  Future<Null> ngOnInit()=>getfilesMethod();

  Future<Null> getfilesMethod() async{
      this.files = await _fuService.getfiles();
      print(files);
  }

}
