import 'dart:io';
import 'dart:async';

//need to add async modifier to main function or whatever function where await is used
Future<void> main(List<String> arguments) async {

  var path = Directory.current.path + '/MyFile.txt';

  print('Starting');

  //await statement will basically wait for the actual object to be returned instead of just the Future
  var f = await appendFile(path);

  print('Appended to $path');

  print('**** End ****');

}

Future<File> appendFile(String path) {

  var file = File(path);
  print('Appending to $path');

  //return Future<File>, not File
  return file.writeAsString(DateTime.now().toString() + '\r\n', mode: FileMode.append);
}


