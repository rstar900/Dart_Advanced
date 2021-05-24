import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:math';

void main(List<String> arguments) {

  //print 16 random numbers which are more random than simply generating using built-in function
  print(randomBytes(16));
}

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
