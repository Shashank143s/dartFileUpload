import 'package:angular/angular.dart';
//import 'package:angular_components/angular_components.dart';
import '../Services/fileupload_service.dart';

@Component(
  selector: 'app-view-files',
  styleUrls: const ['view_files_component.css'],
  templateUrl: 'view_files_component.html',
  providers: const [FileUploadService]
)

class ViewFilesComponent implements OnInit{
  var flexfiles;
  final FileUploadService fuService;
  //constructor
  ViewFilesComponent(this.fuService);
  //Page load lifecycle hook
  void ngOnInit(){
    this.fuService.getfiles().then((data)=>this.flexfiles=data);
    print('printing in component');
    print(this.flexfiles);
  }
}
