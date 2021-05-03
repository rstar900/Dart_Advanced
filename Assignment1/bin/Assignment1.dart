import 'dart:io';

void main(List<String> arguments) {

  //get the os name
  print('OS: ${Platform.operatingSystem}');
  print('');
  //get the PATH variable from a map of environment variables
  print('PATH: ' + Platform.environment['PATH']);

}
