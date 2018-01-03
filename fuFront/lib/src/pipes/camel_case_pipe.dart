import 'package:angular/angular.dart';

@Pipe('camelCase')
class CamelCasePipe extends PipeTransform{
  String transform(String input){
    var first_letter = input[0];
    var output = first_letter.toUpperCase() + input.substring(1);
    return output;
  }
}
