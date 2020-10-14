import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickets/proto/login.pb.dart';

import 'constant.dart';

// login & register interface
Future<LoginRsp> makeLogin(data) async {
  var url = "$server/$login";
  final http.Response rsp = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  return LoginRsp.fromBuffer(rsp.bodyBytes);
}
