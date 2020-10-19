///
//  Generated code. Do not modify.
//  source: passenger.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Passenger extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Passenger', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'male')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCard', protoName: 'idCard')
    ..hasRequiredFields = false
  ;

  Passenger._() : super();
  factory Passenger() => create();
  factory Passenger.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Passenger.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Passenger clone() => Passenger()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Passenger copyWith(void Function(Passenger) updates) => super.copyWith((message) => updates(message as Passenger)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Passenger create() => Passenger._();
  Passenger createEmptyInstance() => create();
  static $pb.PbList<Passenger> createRepeated() => $pb.PbList<Passenger>();
  @$core.pragma('dart2js:noInline')
  static Passenger getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Passenger>(create);
  static Passenger _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get male => $_getBF(1);
  @$pb.TagNumber(2)
  set male($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMale() => $_has(1);
  @$pb.TagNumber(2)
  void clearMale() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get idCard => $_getSZ(2);
  @$pb.TagNumber(3)
  set idCard($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIdCard() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdCard() => clearField(3);
}

class PassengerAddReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassengerAddReq', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..pc<Passenger>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passengers', $pb.PbFieldType.PM, subBuilder: Passenger.create)
    ..hasRequiredFields = false
  ;

  PassengerAddReq._() : super();
  factory PassengerAddReq() => create();
  factory PassengerAddReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassengerAddReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassengerAddReq clone() => PassengerAddReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassengerAddReq copyWith(void Function(PassengerAddReq) updates) => super.copyWith((message) => updates(message as PassengerAddReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassengerAddReq create() => PassengerAddReq._();
  PassengerAddReq createEmptyInstance() => create();
  static $pb.PbList<PassengerAddReq> createRepeated() => $pb.PbList<PassengerAddReq>();
  @$core.pragma('dart2js:noInline')
  static PassengerAddReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassengerAddReq>(create);
  static PassengerAddReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Passenger> get passengers => $_getList(1);
}

class PassengerAddRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassengerAddRsp', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errno')
    ..hasRequiredFields = false
  ;

  PassengerAddRsp._() : super();
  factory PassengerAddRsp() => create();
  factory PassengerAddRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassengerAddRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassengerAddRsp clone() => PassengerAddRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassengerAddRsp copyWith(void Function(PassengerAddRsp) updates) => super.copyWith((message) => updates(message as PassengerAddRsp)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassengerAddRsp create() => PassengerAddRsp._();
  PassengerAddRsp createEmptyInstance() => create();
  static $pb.PbList<PassengerAddRsp> createRepeated() => $pb.PbList<PassengerAddRsp>();
  @$core.pragma('dart2js:noInline')
  static PassengerAddRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassengerAddRsp>(create);
  static PassengerAddRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errno => $_getSZ(0);
  @$pb.TagNumber(1)
  set errno($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrno() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrno() => clearField(1);
}

class PassengerGetReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassengerGetReq', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PassengerGetReq._() : super();
  factory PassengerGetReq() => create();
  factory PassengerGetReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassengerGetReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassengerGetReq clone() => PassengerGetReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassengerGetReq copyWith(void Function(PassengerGetReq) updates) => super.copyWith((message) => updates(message as PassengerGetReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassengerGetReq create() => PassengerGetReq._();
  PassengerGetReq createEmptyInstance() => create();
  static $pb.PbList<PassengerGetReq> createRepeated() => $pb.PbList<PassengerGetReq>();
  @$core.pragma('dart2js:noInline')
  static PassengerGetReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassengerGetReq>(create);
  static PassengerGetReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PassengerGetRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PassengerGetRsp', createEmptyInstance: create)
    ..pc<Passenger>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passengers', $pb.PbFieldType.PM, subBuilder: Passenger.create)
    ..hasRequiredFields = false
  ;

  PassengerGetRsp._() : super();
  factory PassengerGetRsp() => create();
  factory PassengerGetRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassengerGetRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassengerGetRsp clone() => PassengerGetRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassengerGetRsp copyWith(void Function(PassengerGetRsp) updates) => super.copyWith((message) => updates(message as PassengerGetRsp)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PassengerGetRsp create() => PassengerGetRsp._();
  PassengerGetRsp createEmptyInstance() => create();
  static $pb.PbList<PassengerGetRsp> createRepeated() => $pb.PbList<PassengerGetRsp>();
  @$core.pragma('dart2js:noInline')
  static PassengerGetRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassengerGetRsp>(create);
  static PassengerGetRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Passenger> get passengers => $_getList(0);
}

