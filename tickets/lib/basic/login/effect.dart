import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickets/network/global.dart';
import 'package:tickets/network/request.dart';
import 'package:tickets/tool/math.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.submit: _onSubmit,
    LoginAction.save: _onSave,
    Lifecycle.initState: _onInit,
  });
}

void _onSubmit(Action action, Context<LoginState> ctx) {
  if (!ctx.state.checkValidForSubmit()) {
    Fluttertoast.showToast(msg: "input format error");
    return;
  }
  String pwd = ctx.state.data['pwd'];
  if (pwd == null || pwd.isEmpty) {
    String pwd = generateRandomString(10);
    print('generate pwd = $pwd');
    ctx.dispatch(LoginActionCreator.onStateChange({'pwd': pwd}));
    ctx.dispatch(LoginActionCreator.onSave());
  }

  var data = ctx.state.data;
  makeLoginReq(data).then((value) {
    if (value == null || value.ok != true) {
      Fluttertoast.showToast(msg: 'Password wrong');
      return;
    }
    Fluttertoast.showToast(msg: 'login success');
    id = data['id'];
    Navigator.of(ctx.context).popAndPushNamed('main');
  }, onError: (err) {
    Fluttertoast.showToast(msg: 'login failed, please check your network');
  });
}

void _onSave(Action action, Context<LoginState> ctx) async {
  var instance = await SharedPreferences.getInstance();
  var data = ctx.state.data;
  instance.setString("id", data['id']);
  instance.setString("pwd", data['pwd']);
  print('save data = $data');
}

void _onInit(Action action, Context<LoginState> ctx) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String id = sp.getString('id'), pwd = sp.getString('pwd');
  print('init: load id = $id pwd = $pwd');
  if (pwd != null) {
    ctx.dispatch(LoginActionCreator.onStateChange({
      'id': id,
      'pwd': pwd,
    }));
    ctx.dispatch(LoginActionCreator.onSubmit());
  }
}
