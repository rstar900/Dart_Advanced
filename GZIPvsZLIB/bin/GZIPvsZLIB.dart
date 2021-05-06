import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  int gzip = compareCodec(GZipCodec());
  int zlib = compareCodec(ZLibCodec());

  print('GZIP: $gzip');
  print('ZLIB: $zlib');
}

String makeData() {
  String data = '';
  for(int i = 0; i < 1000; i++) {
    data += 'Hello World!\r\n';
  }
  return data;
}

int compareCodec(var codec) {

  String data = makeData();
  print('Testing using ${codec.toString()}');

  List original = Utf8Codec().encode(data);
  print('Size of the original data: ${original.length} bytes');

  List compressed = codec.encode(original);
  print('Size of the original data: ${compressed.length} bytes');

  List decompressed = codec.decode(compressed);
  print('Size of decompressed data: ${decompressed.length} bytes');

  print('');

  String uncompressed = Utf8Codec().decode(decompressed);

  assert(data == uncompressed); //ensure no loss

  return compressed.length;
}
