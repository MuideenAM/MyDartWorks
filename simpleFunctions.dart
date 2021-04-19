int add(int num1, int num2) {
  return (num1 + num2);
}

void printDivision(int num, int divisor) {
  print( "The result of dividing " + num.toString() + " by " + divisor.toString() + " = " + (num / divisor).toString() );
}

int multiply([int num1=1, int num2=1, int num3=1, int num4=1]) {
  return (num1 * num2 * num3 * num4);
}

void myName(str) {
  print("MURITALA Muideen Agunbiade");
}

void main() {
  print( "Addition of 2 and 3 = " + add(2, 3).toString() );
  printDivision(4, 2);
  print( "The result of multiply function with args 2, 3, 4, 5 is "  + multiply(2, 3, 4, 5).toString() );
  print( "The result of multiply function without an argument is " + multiply().toString() );
  myName("placeholder");
}