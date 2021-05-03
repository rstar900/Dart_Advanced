import 'dart:io';

void main(List<String> arguments) {

  //print OS, OS version and Dart version
  print('OS: ${Platform.operatingSystem}');
  print('OS version: ${Platform.operatingSystemVersion}');
  print('Dart Version: ${Platform.version}');

  //check if the current OS is Linux or not
  if(Platform.isLinux) {
    print('You are on Linux!!!');
  }
  else {
    print('You are on some other OS.');
  }

  //path of the current file and Dart location
  print('Path: ${Platform.script.path}');
  print('Dart: ${Platform.executable}');

  //Print out Environment variables
  print('');
  print('Env:');
  print('');
  Platform.environment.keys.forEach((element) {
    print(Platform.environment[element]);
  });
}
