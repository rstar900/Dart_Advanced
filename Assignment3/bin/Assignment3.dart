import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {

  String data = '';

  for(int i = 0; i < 1000; i++) {
    data += 'Hello\r\n';
  }

  //encoding
  List original = Utf8Codec().encode(data);

  print('Size of the original is ${original.length} bytes');

  //compressing
  List compressed = GZipCodec().encode(original);

  //saving to a file
  File f = File(Directory.current.path + '/CompressedData');
  f.writeAsBytesSync(compressed);

  print('Size of compressed file is ${f.lengthSync()} bytes');

  //decompress
  List uncompressed = GZipCodec().decode(f.readAsBytesSync());

  print('Size of decompressed file is ${uncompressed.length} bytes');

  //decode
  String decodedString = Utf8Codec().decode(uncompressed);

  //assert to make sure no loss of data after compression
  assert(decodedString == data);

  print('Success! \r\n');

  print(decodedString);
}
