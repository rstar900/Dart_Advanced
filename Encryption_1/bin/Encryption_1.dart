import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> arguments) {

  //make a digest (basically telling the hashing algorithm)
  Digest digest = new Digest('SHA-256');

  String string = 'Hello World';

  //encoding string in UTF-8 and storing in Uint8List as unsigned bytes
  Uint8List data = Uint8List.fromList(Utf8Codec().encode(string));

  //creating a hash using SHA-256 algorithm
  Uint8List hash = digest.process(data);

  //printing the list as it is (too many bytes!)
  print(hash);

  //for a little bit comprehensible data, we encode the binary data to Base64 and print it
  print(Base64Codec().encode(hash));


}
