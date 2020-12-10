class Passenger {
  String name;
  String age;
  String gender;
  String paymentmode;
  int amount;
  //bool paid;
  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return "Passenger name -> $name age -> $age gender -> $gender mode-> $paymentmode";
  }
}
