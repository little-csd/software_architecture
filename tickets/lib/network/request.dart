import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickets/proto/login.pb.dart';
import 'package:tickets/proto/train.pb.dart';

import 'constant.dart';

// login & register interface
Future<LoginRsp> makeLoginReq(data) async {
  var url = "$server/$login";
  final http.Response rsp = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  return LoginRsp.fromBuffer(rsp.bodyBytes);
}

Future<TrainRsp> makeTrainReq(data) async {
  var url = "$server/$train";
  print(url);
  final http.Response rsp = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print('request come back');
  return TrainRsp.fromBuffer(rsp.bodyBytes);
}

Future<PriceRsp> makePriceReq(data) async {
  var url = "$server/$price";
  final http.Response rsp = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  return PriceRsp.fromBuffer(rsp.bodyBytes);
}
