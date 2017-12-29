import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/browser_client.dart';
import 'package:fuFront/app_component.dart';


void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
