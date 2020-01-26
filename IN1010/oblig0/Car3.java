class Car3 {
  private String carNumber;
  public Car3(String carNumber){
    this.carNumber = carNumber;
  }
  public void printOut(){
      System.out.println("I'm a car. My name is " + this.getNumber() + ".");
  }
  public String getNumber(){
    return this.carNumber;
  }
}
