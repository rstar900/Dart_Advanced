import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';

void main(List<String> arguments) {

  //making random key and iv for our algorithm
  final key = randomBytes(16);
  final keyParams = new KeyParameter(key);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(keyParams, iv);

  //initialize the algorithm with true for encryption
  StreamCipher cipher = new StreamCipher('Salsa20');
  cipher.init(true, params);

  //create the data for encryption from string
  String plain_text = 'Hello World';
  Uint8List plain_data = createUint8ListFromString(plain_text);

  //encrypt data
  Uint8List encrypted_data = cipher.process(plain_data);

  //reset algorithm and decrypt data (false for decryption)
  cipher.reset();
  cipher.init(false, params);
  Uint8List decrypted_data = cipher.process(encrypted_data);

  //display original, encrypted and decrypted data
  display('Original data', plain_data);
  display('Encrypted data', encrypted_data);
  display('Decrypted data', decrypted_data);

  //check whether the decrypted and original data are same and only if they are same, then proceed
  Function eq = const ListEquality().equals;
  assert(eq(plain_data, decrypted_data));

  print(Utf8Codec().decode(decrypted_data));
}

// Function to generate secure random bytes of specified length
Uint8List randomBytes(int length) {

  //this is the chained secure random number generation algorithm
  final rnd = new SecureRandom('AES/CTR/AUTO-SEED-PRNG');

  //making key and parameters IV means Initialisation Vector (Used like salt)
  final key = Uint8List(16);
  final keyParams = new KeyParameter(key);
  final params = new ParametersWithIV(keyParams, new Uint8List(16));

  //seed the secure random number generator
  rnd.seed(params);

  var random = new Random();

  for(int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  //give the random bytes of desired count
  var Bytes = rnd.nextBytes(length);
  return Bytes;

}

//Function to directly create Uint8List from string for further processing
Uint8List createUint8ListFromString(String string) => Uint8List.fromList(Utf8Codec().encode(string));

//Function to display Uint8List in original as well as Base64 encoded form
void display(String title, Uint8List value) {
  print('Title: ${title}');
  print('Value: ${value}');
  print('Value in a readable form: ${Base64Codec().encode(value)}');
  print('');
}