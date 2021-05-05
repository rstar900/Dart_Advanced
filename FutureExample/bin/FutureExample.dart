import 'dart:io';
import 'dart:async';

void main(List<String> arguments) {

  String path = Directory.current.path + '/myFile.txt';
  File file = new File(path);

  print('Writing to ${path}');

  //Future is a promise and it means that the result might not be returned now but can be returned later on, so non blocking
  Future<RandomAccessFile> f = file.open(mode: FileMode.append); //append to the file

  //do something when the open operation finishes
  f.then((RandomAccessFile raf) {

    print('File opened');

    raf.writeString('Hello World\r\n').then((value){

      print('Finished writing');

    }).catchError(()=>print('Error occurred!')).whenComplete(() => raf.close());

  });

  //this will be printed even before the file opened message appears.
  print('******* The End ********');
}
