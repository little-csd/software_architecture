///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RegReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegReq', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pwd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verify')
    ..hasRequiredFields = false
  ;

  RegReq._() : super();
  factory RegReq() => create();
  factory RegReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegReq clone() => RegReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegReq copyWith(void Function(RegReq) updates) => super.copyWith((message) => updates(message as RegReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegReq create() => RegReq._();
  RegReq createEmptyInstance() => create();
  static $pb.PbList<RegReq> createRepeated() => $pb.PbList<RegReq>();
  @$core.pragma('dart2js:noInline')
  static RegReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegReq>(create);
  static RegReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pwd => $_getSZ(1);
  @$pb.TagNumber(2)
  set pwd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPwd() => $_has(1);
  @$pb.TagNumber(2)
  void clearPwd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get verify => $_getSZ(2);
  @$pb.TagNumber(3)
  set verify($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVerify() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerify() => clearField(3);
}

class LoginRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRsp', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errno')
    ..hasRequiredFields = false
  ;

  LoginRsp._() : super();
  factory LoginRsp() => create();
  factory LoginRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRsp clone() => LoginRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRsp copyWith(void Function(LoginRsp) updates) => super.copyWith((message) => updates(message as LoginRsp)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRsp create() => LoginRsp._();
  LoginRsp createEmptyInstance() => create();
  static $pb.PbList<LoginRsp> createRepeated() => $pb.PbList<LoginRsp>();
  @$core.pragma('dart2js:noInline')
  static LoginRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRsp>(create);
  static LoginRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errno => $_getSZ(1);
  @$pb.TagNumber(2)
  set errno($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrno() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrno() => clearField(2);
}

