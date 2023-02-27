void main(){
  // print("hello");
  String str = "Garnacha 2016";
  String subStr = str.substring(str.length - 3);
  print(subStr);
  String myString = 'Hello\nworld!';
  myString = myString.replaceAll('\n', '');
  print(myString);
}