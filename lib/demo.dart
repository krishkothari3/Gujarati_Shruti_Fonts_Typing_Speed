late int millisecondStart, secondStart, minuteStart, hourofdayStart;
late int millisecondEnd, secondEnd, minuteEnd, hourofdayEnd;
void calculateTime(int firstChar) {
  print("firstchar:::::::$firstChar");
  if (firstChar == 0) {
    // Calendar cal = Calendar.getInstance();
    DateTime cal = DateTime.now();
    millisecondStart = cal.millisecond;
    secondStart = cal.second;
    print("firstchar:::::::$firstChar");
    minuteStart = cal.minute;
    hourofdayStart = cal.hour;
    millisecondEnd = cal.microsecond;
    secondEnd = cal.second;
    minuteEnd = cal.minute;
    hourofdayEnd = cal.hour;

    firstChar = 1;
  } else {

    DateTime cal = DateTime.now();
    millisecondEnd = cal.millisecond;
    secondEnd = cal.second;
    minuteEnd = cal.minute;
    hourofdayEnd = cal.hour;
  }
}
int getCPM(int charsEntered) {
  int seconds = 0, speed = 0;
  print('DATA::1:$minuteEnd');
  print('DATA::2:$minuteStart');
  if (hourofdayEnd == hourofdayStart) {
    if (minuteEnd == minuteStart) {
      seconds = (secondEnd - secondStart);
    } else if (minuteEnd> minuteStart) {
      int totalSeconds;
      totalSeconds = (minuteEnd- minuteStart) * 60;
      totalSeconds += secondEnd;
      seconds = totalSeconds - secondStart;
    }

  } else if (hourofdayEnd > hourofdayStart) {
    seconds = (hourofdayEnd- hourofdayStart) * 3600;
    if (minuteEnd == minuteStart) {
      seconds = (secondEnd- secondStart);
    } else if (minuteEnd> minuteStart) {
      int totalSeconds;
      // getting total seconds by multiplying every minute * 60
      totalSeconds = (minuteEnd- minuteStart) * 60;
      totalSeconds += secondEnd;
      seconds = seconds + (totalSeconds - secondStart);
    } else if (minuteEnd< minuteStart) {
      int startSec, endSec;
      startSec = (minuteStart* 60) + secondStart;
      endSec = (minuteEnd* 60) + secondEnd;
      seconds = seconds - (startSec - endSec);
    }
  }
  print('DATA:::$seconds');
  if (seconds <= 60) {
    speed = charsEntered;
  } else if (seconds > 60) {
    speed = ((charsEntered * 60) ~/ seconds);
  }
  return speed;
}
