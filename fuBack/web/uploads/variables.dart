void main(){
  var a; //dart assumes dynamic type
  var x=5; //dart takes type as a number
  //var keyword means dart will infer the type of the variable (Inferred Type)
  var dyn = 5;
  var dyn = "Hello!"; //error
  dynamic z = "art";
  print(x);
  print(dyn);
  print(z);
}
//Dart assigns null to a variable initially if nothing is assigned.
// var z; is same as dynamic z;
