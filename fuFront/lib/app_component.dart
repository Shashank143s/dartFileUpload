import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'src/fileUpload/file_upload_component.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, ROUTER_DIRECTIVES],
  providers: const [materialProviders]
)

@RouteConfig(const [
  const Route(path: '/fileupload', name: 'Upload', component: FileUploadComponent)
])

class AppComponent {
  // Nothing here yet. All logic is in FileUploadComponent.
  bool selectValueUpload = false;
  bool selectValueView = false;

  void selectedIconUpload(){
    selectValueUpload = true;
    selectValueView = false;
  }
  void selectedIconView(){
    selectValueView = true;
    selectValueUpload = false;
  }
}
