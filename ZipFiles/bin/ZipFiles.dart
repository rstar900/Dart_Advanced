import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:archive/archive.dart';

void main(List<String> arguments) {

  List<String> files = [];

  //List all files from the current directory and add to a string List
  print('Compressing');
  print('-----------');
  Directory.current.listSync().forEach((FileSystemEntity fse) {

    if(fse.statSync().type == FileSystemEntityType.file) {
      print(p.basename(fse.path));
      files.add(fse.path);
    }
  });

  print('');

  String inputPath = Directory.current.path + '/Compression/test.zip';
  String outputPath = Directory.current.path + '/Compression/Uncompressed/';

  //compress in a test.zip file in Compression folder
  zip(files, inputPath);

  print('');
  print('Decompressing');
  print('');

  //decompress to /Compression/Uncompressed folder
  unzip(inputPath,outputPath);
}

void zip(List<String> files, String file) {

  //create a new Archive object
  Archive archive = Archive();

  files.forEach((String path){

    File f = File(path);

    //create an ArchiveFile type record
    ArchiveFile archiveFile = ArchiveFile(p.basename(path), f.lengthSync(), f.readAsBytesSync());

    //add this record to archive
    archive.addFile(archiveFile);

  });

  //encode the archive to zip format and write as bytes to the zip file
  List zipFileBytes = ZipEncoder().encode(archive);
  File f = File(file);
  f.writeAsBytesSync(zipFileBytes);

  print('Compressed to: ${file}');

}

void unzip(String ip, String op) {

  //open the zip file and decode it as an Archive object
  File ipFile = File(ip);
  List ipFileBytes = ipFile.readAsBytesSync();
  Archive archive = ZipDecoder().decodeBytes(ipFileBytes);

  //add each file to the destination folder, if the folder doesn't exist then createSync() takes care using recursive
  archive.forEach((ArchiveFile af) {
    File opFile = File(op + af.name);
    opFile.createSync(recursive: true);
    opFile.writeAsBytesSync(af.content);
  });

  print('Uncompressed to ${op}');
}
