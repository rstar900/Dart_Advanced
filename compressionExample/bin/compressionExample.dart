import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main(List<String> arguments) {

  String data = '';

  for(int i = 0; i < 100; i++) {
    data += 'Hello World!\r\n';
  }

  //Encoding the data string into UTF8 for further processing
  List original = Utf8Codec().encode(data);
  print('Size of original data: ${original.length} bytes.');

  //Compress it
  List compressed = GZipCodec().encode(original);
  print('Size of compressed data: ${compressed.length} bytes.');

  //uncompress it
  List uncompressed = GZipCodec().decode(compressed);
  print('Size of uncompressed data: ${uncompressed.length} bytes.');
  
  assert(uncompressed.length == original.length); //will not proceed forward if the lengths are not equal.
  
  //decode again into a string
  String dataAgain = Utf8Codec().decode(uncompressed);
  
  print('');
  
  print(dataAgain);
}
