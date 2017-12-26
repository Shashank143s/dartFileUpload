class Person{
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  message(){
    print('Hi $firstName $lastName !');
  }
}

class Employee extends Person{
  Employee(f,l):super(f,l){
    print('Employee Name');
  }
}

main(){
  Person shash = new Employee('Shashank','Kumar');
  shash.message();  
}
