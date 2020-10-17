///
//  Generated code. Do not modify.
//  source: train.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TrainReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrainReq', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fs')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ts')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'day')
    ..hasRequiredFields = false
  ;

  TrainReq._() : super();
  factory TrainReq() => create();
  factory TrainReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainReq clone() => TrainReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainReq copyWith(void Function(TrainReq) updates) => super.copyWith((message) => updates(message as TrainReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrainReq create() => TrainReq._();
  TrainReq createEmptyInstance() => create();
  static $pb.PbList<TrainReq> createRepeated() => $pb.PbList<TrainReq>();
  @$core.pragma('dart2js:noInline')
  static TrainReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainReq>(create);
  static TrainReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fs => $_getSZ(1);
  @$pb.TagNumber(2)
  set fs($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFs() => $_has(1);
  @$pb.TagNumber(2)
  void clearFs() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ts => $_getSZ(2);
  @$pb.TagNumber(3)
  set ts($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTs() => $_has(2);
  @$pb.TagNumber(3)
  void clearTs() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get day => $_getSZ(3);
  @$pb.TagNumber(4)
  set day($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => clearField(4);
}

class TrainRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrainRsp', createEmptyInstance: create)
    ..pc<Ticket>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tickets', $pb.PbFieldType.PM, subBuilder: Ticket.create)
    ..hasRequiredFields = false
  ;

  TrainRsp._() : super();
  factory TrainRsp() => create();
  factory TrainRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainRsp clone() => TrainRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainRsp copyWith(void Function(TrainRsp) updates) => super.copyWith((message) => updates(message as TrainRsp)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrainRsp create() => TrainRsp._();
  TrainRsp createEmptyInstance() => create();
  static $pb.PbList<TrainRsp> createRepeated() => $pb.PbList<TrainRsp>();
  @$core.pragma('dart2js:noInline')
  static TrainRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainRsp>(create);
  static TrainRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Ticket> get tickets => $_getList(0);
}

class Ticket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ticket', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'kid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fStation', protoName: 'fStation')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tStation', protoName: 'tStation')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fTime', protoName: 'fTime')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tTime', protoName: 'tTime')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tid')
    ..hasRequiredFields = false
  ;

  Ticket._() : super();
  factory Ticket() => create();
  factory Ticket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ticket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ticket clone() => Ticket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ticket copyWith(void Function(Ticket) updates) => super.copyWith((message) => updates(message as Ticket)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ticket create() => Ticket._();
  Ticket createEmptyInstance() => create();
  static $pb.PbList<Ticket> createRepeated() => $pb.PbList<Ticket>();
  @$core.pragma('dart2js:noInline')
  static Ticket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ticket>(create);
  static Ticket _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get kid => $_getSZ(0);
  @$pb.TagNumber(1)
  set kid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKid() => $_has(0);
  @$pb.TagNumber(1)
  void clearKid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fStation => $_getSZ(1);
  @$pb.TagNumber(2)
  set fStation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFStation() => $_has(1);
  @$pb.TagNumber(2)
  void clearFStation() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tStation => $_getSZ(2);
  @$pb.TagNumber(3)
  set tStation($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTStation() => $_has(2);
  @$pb.TagNumber(3)
  void clearTStation() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fTime => $_getSZ(3);
  @$pb.TagNumber(4)
  set fTime($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearFTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set tTime($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get duration => $_getSZ(5);
  @$pb.TagNumber(6)
  set duration($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get tid => $_getSZ(6);
  @$pb.TagNumber(7)
  set tid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTid() => $_has(6);
  @$pb.TagNumber(7)
  void clearTid() => clearField(7);
}

class PriceReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PriceReq', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tid')
    ..hasRequiredFields = false
  ;

  PriceReq._() : super();
  factory PriceReq() => create();
  factory PriceReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PriceReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PriceReq clone() => PriceReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PriceReq copyWith(void Function(PriceReq) updates) => super.copyWith((message) => updates(message as PriceReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PriceReq create() => PriceReq._();
  PriceReq createEmptyInstance() => create();
  static $pb.PbList<PriceReq> createRepeated() => $pb.PbList<PriceReq>();
  @$core.pragma('dart2js:noInline')
  static PriceReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PriceReq>(create);
  static PriceReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tid => $_getSZ(1);
  @$pb.TagNumber(2)
  set tid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTid() => clearField(2);
}

class PriceRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PriceRsp', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prices')
    ..hasRequiredFields = false
  ;

  PriceRsp._() : super();
  factory PriceRsp() => create();
  factory PriceRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PriceRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PriceRsp clone() => PriceRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PriceRsp copyWith(void Function(PriceRsp) updates) => super.copyWith((message) => updates(message as PriceRsp)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PriceRsp create() => PriceRsp._();
  PriceRsp createEmptyInstance() => create();
  static $pb.PbList<PriceRsp> createRepeated() => $pb.PbList<PriceRsp>();
  @$core.pragma('dart2js:noInline')
  static PriceRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PriceRsp>(create);
  static PriceRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get prices => $_getList(0);
}

