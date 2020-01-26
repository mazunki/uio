public class printPotato {
  public static void main(String[] args){
    System.out.println(printPotato.checkTypes("hey", 1, 2));
  }
  public static String[] checkTypes(Object... things){
    String[] types = new String[things.length];
    for (int i=0; i < things.length; i++){
      types[i] = checkType(things[i]);
    }
    return types;
  }
  public static String checkType(String thing){
    return "text";
  }
  public static String checkType(int thing){
    return "number";
  }
}
