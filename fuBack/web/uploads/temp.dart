void main() {
  var degC = 60, fahren = 90 ;
  var CdegC = (fahren - 32)/(1.8);
  var Cfahren = 1.8 * degC + 32 ;
  print("$degC is equivalent to $Cfahren");
  print("$fahren is equivalent to $CdegC");
}
