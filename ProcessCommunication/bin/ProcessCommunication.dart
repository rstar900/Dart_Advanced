import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {

  //run cat process and interact with it
  Process.start('cat', []).then((Process process) {
    
    //transform the output of the process
    process.stdout.transform(Utf8Decoder()).listen((data) { print(data); });

    //feed the input of the process
    process.stdin.writeln('Hello World');

    //Kill the process
    Process.killPid(process.pid);

    //get the exit code
    process.exitCode.then((int code){

      print('Exit Code: $code');

      //exit
      exit(0);
    });

  });
}
