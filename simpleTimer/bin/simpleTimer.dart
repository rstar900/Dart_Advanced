import 'dart:async';

int counter = 0;

void main(List<String> arguments) {

  //set the duration as 1 seconds and call timerFunc every 1 second
  var duration = Duration(seconds: 1);
  var timer = Timer.periodic(duration, timerFunc);

  print('Started at ${DateTime.now().toString()}');
  
}

void timerFunc(Timer timer) {

  print('Time is ${getTime()}');
  counter++;

  //after 5 seconds stop the timer
  if(counter >=5) {
    print('Timeout');
    timer.cancel();
  }
}

String getTime() {
  return DateTime.now().toString();
}
