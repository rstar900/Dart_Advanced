import 'dart:async';
import 'dart:io';

void main(List<String> arguments) async {

  print('Starting');

  File f = await appendFile();

  print('Appended!');

  String content = await readFile(f);

  print('Read!\r\n');

  print('Content:');
  print(content);

  print('**** End ****');
}

Future<File> appendFile() {
  File f = File(Directory.current.path + '/MyFile.txt');
  print('Appending');
  return f.writeAsString('Hello!\r\n', mode: FileMode.append);
}

Future<String> readFile(File f) {
  print('Reading');
  return f.readAsString();
}
