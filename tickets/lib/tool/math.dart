import 'dart:math';
import 'dart:typed_data';

var _rand = Random();
String generateRandomString(int len) {
  var data = Uint8List(len);
  for (int i = 0; i < len; i++) {
    data[i] = _rand.nextInt(26) + 97;
  }
  return String.fromCharCodes(data);
}
