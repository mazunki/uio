class Person {
  private Car3 myCar;
  public Person(Car3 car){
    this.myCar = car;
  }
  public void printOut(){
    System.out.println("I have a car named " + this.myCar.getNumber() + ".");
  }
}
