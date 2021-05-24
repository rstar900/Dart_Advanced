import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> arguments) {

  String password = 'password';

  //add salt to randomize algorithm
  var salt = createUint8ListFromString('salT');

  //key derivation algorithm
  var pkcs = new KeyDerivator('SHA-1/HMAC/PBKDF2');

  //parameters for the algorithm (for some reason 16 is necessary in parameter)
  var params = new Pbkdf2Parameters(salt, 100, 16);

  //initialize algo with above parameters
  pkcs.init(params);

  //process password using the algorithm
  var value = pkcs.process(createUint8ListFromString(password));
  display('Key value', value);

}
//Function to directly create Uint8List from string for further processing
Uint8List createUint8ListFromString(String string) => Uint8List.fromList(Utf8Codec().encode(string));

void display(String title, Uint8List value) {
  print('Title: ${title}');
  print('Value: ${value}');
  print('Value in a readable form: ${Base64Codec().encode(value)}');
}