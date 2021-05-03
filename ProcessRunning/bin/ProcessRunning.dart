import 'dart:io';

void main(List<String> arguments) {

  //execute ls -la for current directory
  Process.run('ls', ['-la']).then((ProcessResult result){
    print('Output:');
    print(result.stdout);
    print('Exit Code: ');
    print(result.exitCode);
  });
}
