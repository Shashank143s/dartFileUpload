import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';



@Component(
  selector: 'app-welcome-page',
  styleUrls: const ['welcome_page_component.css'],
  templateUrl: 'welcome_page_component.html',
  directives: const [COMMON_DIRECTIVES],
  pipes : const [COMMON_PIPES],
  providers: const [materialProviders]
)

class WelcomePageComponent{

}
